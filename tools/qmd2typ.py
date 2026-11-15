"""Convert a History-of-Medicine Quarto reveal deck (.qmd) to a Typst touying deck (.typ).

Usage: python qmd2typ.py HoM_L1.qmd typst/HoM_L1.typ
Image paths are written as /images/... (use `typst compile --root <repo>`).
"""
import re
import sys

PRE = '''#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => [History of Medicine | {code} | Community Medicine],
  config-info(
    title: [{title}],
    subtitle: [{subtitle}],
    author: [Dr. Arun Mitra],
    date: datetime.today(),
    institution: [Department of Community and Family Medicine, AIIMS Bibinagar],
  ),
  config-colors(primary: rgb("#800000"), primary-light: rgb("#d9b8b8"), secondary: rgb("#2b2b2b"), neutral-lightest: rgb("#fbfaf7"), neutral-dark: rgb("#2b2b2b"), neutral-darkest: rgb("#1c1c1c")),
)
#set text(size: 24pt)
#set par(justify: false)
#set list(spacing: 0.9em)
#set enum(spacing: 0.9em)

#let callout(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt), radius: 3pt,
  fill: rgb("#f1ece6"), stroke: (left: 3pt + rgb("#800000")), body)
#let aside(body) = place(bottom + left, dy: -22pt, text(size: 11pt, fill: rgb("#666666"), body))

#title-slide()
'''


def inline(s):
    """Markdown inline -> Typst markup."""
    s = re.sub(r'\{\.[a-z]+\}', '', s)
    s = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', lambda m: '\u0001LINK%s\u0002%s\u0003' % (m.group(2), m.group(1)), s)
    bold, ital = [], []
    s = re.sub(r'\*\*(.+?)\*\*', lambda m: (bold.append(m.group(1)), '\u0004B%d\u0005' % (len(bold) - 1))[1], s)
    s = re.sub(r'\*(.+?)\*', lambda m: (ital.append(m.group(1)), '\u0004I%d\u0005' % (len(ital) - 1))[1], s)
    def esc(t):
        for a, b in (('\\', '\\\\'), ('#', '\\#'), ('$', '\\$'), ('@', '\\@'), ('<', '\\<'), ('>', '\\>'), ('_', '\\_'), ('~', '\\~'), ('[', '\\['), (']', '\\]'), ('*', '\\*'), ('`', '\\`')):
            t = t.replace(a, b)
        return t
    s = esc(s)
    s = re.sub(r'\u0004B(\d+)\u0005', lambda m: '*' + esc(bold[int(m.group(1))]) + '*', s)
    s = re.sub(r'\u0004I(\d+)\u0005', lambda m: '_' + esc(ital[int(m.group(1))]) + '_', s)
    s = re.sub(r'\u0001LINK(.*?)\u0002(.*?)\u0003', lambda m: '#link("%s")[%s]' % (m.group(1), m.group(2)), s)
    return s


def image(line):
    m = re.match(r'!\[(.*?)\]\((.*?)\)(\{(.*?)\})?\s*$', line.strip())
    if not m:
        return None
    cap, path, _, attrs = m.groups()
    attrs = attrs or ''
    h = re.search(r'height="?(\d+)', attrs)
    w = re.search(r'width="?(\d+)%', attrs)
    args = []
    if h:
        args.append('height: %dpt' % min(int(int(h.group(1)) * 0.62), 250))
    elif w:
        args.append('width: %s%%' % w.group(1))
    else:
        args.append('width: 100%')
    out = '#align(center, image("/%s", %s))' % (path.lstrip('/'), ', '.join(args))
    if cap:
        out = '#align(center)[#image("/%s", %s)\n#text(size: 11pt, fill: rgb("#666666"))[%s]]' % (path.lstrip('/'), ', '.join(args), inline(cap))
    return out


def parse_blocks(lines, i=0, until_close=False):
    """Return (nodes, next_i). nodes: ('text', line) or ('div', kind, attrs, nodes)."""
    nodes = []
    while i < len(lines):
        ln = lines[i]
        m = re.match(r'^(:{3,})\s*(.*)$', ln)
        if m:
            rest = m.group(2).strip()
            if rest == '':
                if until_close:
                    return nodes, i + 1
                i += 1
                continue
            sub, i = parse_blocks(lines, i + 1, True)
            nodes.append(('div', rest, sub))
            continue
        nodes.append(('text', ln))
        i += 1
    return nodes, i


def render_text_lines(lines):
    out = []
    for ln in lines:
        raw = ln.rstrip()
        if raw.strip() == '':
            out.append('')
            continue
        if raw.strip() == '. . .':
            out.append('#pause')
            continue
        im = image(raw)
        if im:
            out.append(im)
            continue
        m = re.match(r'^(\s*)([-*])\s+(.*)$', raw)
        if m:
            out.append('%s- %s' % (m.group(1), inline(m.group(3))))
            continue
        m = re.match(r'^(\s*)\d+\.\s+(.*)$', raw)
        if m:
            out.append('%s+ %s' % (m.group(1), inline(m.group(2))))
            continue
        m = re.match(r'^>\s*(.*)$', raw)
        if m:
            out.append('#quote(block: true)[%s]' % inline(m.group(1)))
            continue
        out.append(inline(raw))
    return '\n'.join(out)


def render_nodes(nodes):
    buf = []
    out = []

    def flush():
        if buf:
            out.append(render_text_lines(buf))
            buf.clear()
    for n in nodes:
        if n[0] == 'text':
            buf.append(n[1])
        else:
            flush()
            kind, sub = n[1], n[2]
            if '.columns' in kind:
                cols = [c for c in sub if c[0] == 'div' and '.column' in c[1]]
                widths = []
                for c in cols:
                    w = re.search(r'width="?(\d+)%', c[1])
                    widths.append('%sfr' % (w.group(1) if w else '1'))
                cells = ',\n  '.join('[\n%s\n]' % render_nodes(c[2]) for c in cols)
                out.append('#grid(columns: (%s), column-gutter: 16pt,\n  %s)' % (', '.join(widths), cells))
            elif 'callout' in kind:
                out.append('#callout[\n%s\n]' % render_nodes(sub))
            elif kind.startswith('aside'):
                out.append('#aside[\n%s\n]' % render_nodes(sub))
            else:
                out.append(render_nodes(sub))
    flush()
    return '\n\n'.join(o for o in out if o.strip())


def convert(src, dst):
    text = open(src, encoding='utf-8').read()
    fm = re.match(r'^---\n(.*?)\n---\n', text, re.S)
    meta = fm.group(1)
    body = text[fm.end():]
    title = re.search(r'^title:\s*"(.*)"', meta, re.M).group(1)
    sub = re.search(r'^subtitle:\s*"(.*)"', meta, re.M).group(1)
    code = re.search(r'(L\d)', sub).group(1) if re.search(r'(L\d)', sub) else ''
    code = 'L' + re.search(r'Lecture (\d)', sub).group(1)
    sub_short = re.sub(r'^Lecture \d:\s*', '', sub)
    out = [PRE.replace('{title}', inline(title)).replace('{subtitle}', 'Lecture %s: %s' % (code[1:], inline(sub_short))).replace('{code}', code)]
    slides = re.split(r'^## ', body, flags=re.M)[1:]
    for sl in slides:
        head, _, rest = sl.partition('\n')
        small = '.smaller' in head
        title = re.sub(r'\s*\{[^}]*\}\s*$', '', head).strip()
        lines = rest.split('\n')
        nodes, _ = parse_blocks(lines)
        content = render_nodes(nodes)
        size = '#set text(size: 17pt)\n' if small else ''
        out.append('== %s\n%s%s\n' % (inline(title), size, content))
    open(dst, 'w', encoding='utf-8').write('\n'.join(out))
    return len(slides)


if __name__ == '__main__':
    print(convert(sys.argv[1], sys.argv[2]), 'slides')
