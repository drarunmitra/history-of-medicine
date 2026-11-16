#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => [History of Medicine | L1 | Community Medicine],
  config-info(
    title: [History of Medicine],
    subtitle: [Lecture 1: Ancient medicine, how people explained illness],
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

== Where this series is going
#grid(columns: (60fr, 40fr), column-gutter: 16pt,
  [
Three lectures, one thread:

+ *Ancient medicine:* explanation by tradition and belief (today)
+ *The scientific revolution:* explanation by observation and experiment
+ *The birth of public health:* action on whole populations
],
  [
#align(center, image("/images/timeline_L0.svg", width: 100%))
])

== Learning objectives

By the end of this lecture you should be able to:

+ Describe how early humans and the first farming societies explained and treated illness
+ Name two contributions each of Egyptian, Indus Valley and Indian (Vedic/Ayurvedic) medicine
+ Explain why Hippocrates is called the "father of medicine" and what changed in his approach
+ Link one ancient practice (for example Indus drainage) to a modern public health measure



== Today on the timeline

#align(center, image("/images/timeline_L1.svg", width: 100%))


#callout[
Coloured phases are today: prehistory, the first river civilisations, and the classical world.
]

== Question

#align(center, image("/images/Prosthetic_toe.jpg", height: 198pt))


#callout[
This toe was made in ancient Egypt. Who made it, and why? Was it for walking or for looks?
]

#aside[
Image: Greville Chester toe, British Museum (via seminar deck; licence to be confirmed).
]

== Prehistory: fire changes everything
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center, image("/images/homo-erectus-fire.jpg", width: 100%))
],
  [
- Cooked food, warmth, protection, a gathering place
- Fire also kills some germs and parasites in food and water
- Evidence of care: injured and disabled people survived in some early groups
])

== Prehistory: tools
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/paleo_tools.png", width: 100%)
#text(size: 11pt, fill: rgb("#666666"))[Old Stone Age (Paleolithic) tools]]
],
  [
#align(center)[#image("/images/neo_tools.png", width: 100%)
#text(size: 11pt, fill: rgb("#666666"))[New Stone Age (Neolithic) tools]]
])

== Early surgery: holes in the skull
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/Trepanned_skull_found_at_B_rnecke_Sch_tzenholz_c._3300_BC_human_skull_.jpg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Trepanned skull, c. 3300 BC, Braunschweig]]
],
  [
#align(center)[#image("/images/L1_new/Skull_of_woman_showing_cauterised_T-shaped_scar_Neolithic_Wellcome_M00.jpg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Neolithic skull, healed T-shaped scar]]
])


Some skulls show bone regrowth at the edges, so the person lived on after the operation.


#aside[
Sources: Daderot (public domain); Wellcome Collection (CC BY 4.0).
]

== From hunting to farming
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center, image("/images/plough.png", width: 100%))
],
  [
#align(center, image("/images/oxcart.jpg", width: 100%))
])


Settled life brought crowding, animals living close to people, shared water, stored grain and waste.



== Did farming make people sicker?

- In the southern Levant, farmers' skeletons show more infection lesions than hunter-gatherers' (205 vs 200 skeletons compared)
- But a study in the German loess zone found no sign of epidemics
- Safe summary: *farming tended to raise exposure to infection, but the picture is complex*


#callout[
Public health link: the way people live decides which diseases they get.
]

#aside[
Source: Eshed et al. 2010 (Am J Phys Anthropol); Fuchs et al. 2019 (Holocene).
]

== Cradles of civilisation
#grid(columns: (33fr, 33fr, 33fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/fertile_crescent_cradle.png", width: 100%)
#text(size: 11pt, fill: rgb("#666666"))[Fertile Crescent]]
],
  [
#align(center)[#image("/images/ancient_india_cradle.jpg", width: 100%)
#text(size: 11pt, fill: rgb("#666666"))[India]]
],
  [
#align(center)[#image("/images/ancient_china_cradle.png", width: 100%)
#text(size: 11pt, fill: rgb("#666666"))[China]]
])


Grain, safe-to-drink water, writing and accounting: the base for the first medical texts.



== Egypt: the papyri
#set text(size: 17pt)
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/Ebers7766.jpg", height: 161pt)
#text(size: 11pt, fill: rgb("#666666"))[Ebers papyrus]]
],
  [
#align(center)[#image("/images/L1_new/Edwin_Smith_Papyrus_v2.jpg", height: 161pt)
#text(size: 11pt, fill: rgb("#666666"))[Edwin Smith papyrus]]
])


- *Ebers* (about 1550 BC): a scroll of about 110 pages, with roughly 700 remedies and spells
- *Edwin Smith* (about 1600 BC): 48 trauma cases


#aside[
Sources: Wikimedia Commons (public domain).
]

== Ebers papyrus: drug, ritual and observation together
#set text(size: 17pt)
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center, image("/images/Ebers_papyrus.jpg", height: 198pt))
],
  [
- Remedies are written with the ingredients and how to use them
- Many remedies come with a spell
- Medicine and religion were not separate
- The scroll is also a record of what the Egyptians had observed
])

== Edwin Smith papyrus: a method

Each case follows a pattern:

+ *Title* (the injury)
+ *Examination:* "If you examine a man having..."
+ *Diagnosis* (the verdict)
+ *Treatment* (only if the case can be treated)
+ *Gloss* (explanatory note)

#pause


#callout[
*Three possible verdicts:* "an ailment I can treat", "an ailment I will contend with", "an ailment not to be treated". This is an early idea of prognosis.
]

#aside[
Source: van Middendorp et al. 2010, Eur Spine J.
]

== Life in Egypt

#align(center)[#image("/images/Tomb_of_Nakht.jpg", height: 210pt)
#text(size: 11pt, fill: rgb("#666666"))[Tomb of Nakht]]

Farming, harvest and food are the background to health: grain, beer, and the Nile.



== Mesopotamia: Hammurabi's laws
#set text(size: 17pt)
#grid(columns: (45fr, 55fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/P1050763_Louvre_code_Hammurabi_face_rwk.jpg", height: 248pt)
#text(size: 11pt, fill: rgb("#666666"))[Stele of Hammurabi, Louvre]]
],
  [
About 1750 BC, Babylon. Laws 215 to 223 deal with the surgeon:

- Fees depended on the patient's class
- A large incision that cured: 10 shekels (free man), 5 (freed man)
- If the patient died, the surgeon's hands could be cut off
])

#aside[
Source: King LW translation (Avalon Project); photo by Mbzt, CC BY 3.0.
]

== Hammurabi: why it matters
#callout[
The first written rules on payment and liability for doctors. Think of informed consent and malpractice law today.
]


Note: the laws speak only about the surgeon with the knife. Healers who used herbs and incantations are not in them.



== Indus Valley: a city of water
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/The_Great_Bath_at_Mohenjo-daro._Wellcome_L0005461.jpg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Mohenjo-daro Great Bath]]
],
  [
#align(center)[#image("/images/L1_new/Water_canal_for_the_great_bath_-_Mohenjo-daro.jpg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Brick water channel]]
])


Mature Harappan period: about 2600 to 1900 BC.


#aside[
Sources: Wellcome Collection (CC BY 4.0); Quratulain (CC BY-SA 3.0).
]

== Indus Valley: sanitation before germ theory
#set text(size: 17pt)
#grid(columns: (55fr, 45fr), column-gutter: 16pt,
  [
- Brick-lined drains from houses to covered street drains with inspection holes
- Private bathrooms, terracotta pipes, soak pits
- More than 700 wells at Mohenjo-daro
],
  [
#align(center, image("/images/indus-toilets.png", width: 100%))
])

#callout[
We know the engineering. We do *not* know that it reduced disease. The purpose of the Great Bath is also uncertain.
]

#aside[
Source: Jansen 1989, World Archaeol.
]

== Indus Valley: society

#align(center, image("/images/indus_valley-social_structure.png", height: 250pt))



== Question

Which modern public health programme does Indus sanitation remind you of?

#pause


#callout[
Safe water and sanitation: Swachh Bharat, Jal Jeevan Mission, and WASH in general.
]

== Vedic ideas of health
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center, image("/images/vedas1.jpg", height: 198pt))
],
  [
- Health and disease are explained in the Vedas, with prayers, herbs and water
- Ayurveda grew from this tradition
- Health is *balance*: the three doshas (vata, pitta, kapha)
- Two great texts: *Charaka* (medicine) and *Sushruta* (surgery)
])

== Sushruta: the surgeon
#set text(size: 17pt)
#grid(columns: (40fr, 60fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/Sushruta_Statue_Banaras.jpg", height: 223pt)
#text(size: 11pt, fill: rgb("#666666"))[Statue, Banaras Hindu University]]
],
  [
- Date is disputed. Traditionally "about 600 BC"; the text grew over several centuries. Oldest dated manuscript: AD 878
- Traditionally quoted: 184 chapters, 1,120 conditions, about 300 procedures, over 120 instruments
- Covers surgery, anatomy by dissection, fractures, wounds and surgical training
])

#aside[
Photo: Dr.jayan.d, CC BY-SA 3.0. Counts are traditional figures, not a count of the Sanskrit text.
]

== Sushruta Samhita
#grid(columns: (33fr, 33fr, 33fr), column-gutter: 16pt,
  [
#align(center, image("/images/sushruta_samhita.jpg", width: 100%))
],
  [
#align(center, image("/images/susrutha1.jpg", width: 100%))
],
  [
#align(center, image("/images/susrutha2.jpg", width: 100%))
])

== Sushruta and the nose

- Cutting off the nose was a punishment, so reconstruction was needed
- The text describes a *cheek-flap* repair, using a leaf as a template for the missing tissue
- The famous forehead flap is *not* in Sushruta. It is documented later, and reached Europe through a 1794 report


#callout[
Plastic surgery has a long Indian history, but be exact about what the text says.
]

#aside[
Sources: Wallace 1978, J R Soc Med; Shaye 2021.
]

== Sushruta: a charge to the pupil

#quote(block: true)["Thou shalt renounce lust, anger, greed, ignorance, vanity... live the life of a truthful, self-controlled anchorite and be obedient and respectful towards thy preceptor."]

- Given at the *start* of training. The Hippocratic Oath comes at the end
- Teachers, friends, the poor and helpless are to be treated without payment
- The same passage excludes some people from treatment. A good case for an ethics discussion


#aside[
Source: Bhishagratna 1907, Sutrasthana, ch. II.
]

== Arthashastra: the state and epidemics
#set text(size: 17pt)
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center, image("/images/arthasashtra_original.jpg", height: 198pt))
],
  [
- Attributed to Kautilya, a Mauryan minister, about 300 BC. The text was assembled between roughly 150 BC and AD 300
- Book 4, ch. 3: against pestilence, use physicians with medicines, and ascetics with purificatory rites
- Medicine and ritual side by side, led by the state
])

#aside[
Source: Shamasastry translation; Olivelle 2013.
]

== Mauryan empire

#align(center, image("/images/mauryan_empire.png", height: 250pt))



== Greece: from spirits to nature
#grid(columns: (40fr, 60fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/Bust_of_Hippocrates_Wellcome_L0005203.jpg", height: 235pt)
#text(size: 11pt, fill: rgb("#666666"))[Bust of Hippocrates]]
],
  [
- Hippocrates, born about 460 BC on Kos. The Corpus has many authors over centuries
- _On the Sacred Disease_: epilepsy is "nowise more divine nor more sacred than other diseases"
- Disease has natural causes, so it can be studied
])

#aside[
Image: Wellcome Collection, CC BY 4.0. The portrait type is a later conception.
]

== Airs, Waters, Places
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
The physician should begin with the *seasons, winds and waters* of a place.

People who drink marsh water have "large and obstructed spleens".
],
  [
#callout[
Public health link: the *environment* as a cause of disease. This is early environmental epidemiology, and a clue to malaria.
]
])

#aside[
Source: Adams translation, MIT Internet Classics Archive.
]

== The humours
#grid(columns: (50fr, 50fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/Four_temperaments_-_2.svg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Four temperaments]]
],
  [
- Blood, phlegm, yellow bile, black bile
- Health is balance, as in the Indian doshas
- The scheme in _Nature of Man_ is usually credited to Polybus, not to Hippocrates himself
- Treatment: diet, rest, bleeding
])

== The Hippocratic Oath
#set text(size: 17pt)
#grid(columns: (45fr, 55fr), column-gutter: 16pt,
  [
#align(center)[#image("/images/L1_new/HippocraticOath.jpg", height: 198pt)
#text(size: 11pt, fill: rgb("#666666"))[Byzantine copy, arranged as a cross]]
],
  [
- "I will use those dietary regimens which will benefit my patients"
- "I will do no harm or injustice to them"
- "I will keep secret... all such things"
- "I will not use the knife, even upon those suffering from stones"
])

#aside[
Translation: North 2002, NLM. Image: Vatican Library, public domain.
]

== Beyond Greece: China
#set text(size: 17pt)
#grid(columns: (55fr, 45fr), column-gutter: 16pt,
  [
- _Huangdi Neijing_ (Yellow Emperor's Inner Classic), compiled in the Han period, about 2nd to 1st century BC. The Yellow Emperor attribution is traditional
- Health is *balance*: yin and yang, five phases, and _qi_ flowing in channels. The same idea as humours and doshas
- It values *prevention*: the best physician acts before disease has formed
- Smallpox inoculation (variolation) is recorded in China from about the 16th century
],
  [
#callout[
Public health link: *prevention before illness*. Two thousand years before screening and vaccination programmes.
]
])

#aside[
Sources: Unschuld 2003, _Huang Di Nei Jing_; Needham, _Science and Civilisation in China_.
]

== Alexandria: dissection of the human body
#set text(size: 17pt)

- Under the Ptolemies, *Herophilus* (about 335 to 280 BC) and *Erasistratus* (about 304 to 250 BC) dissected human bodies. This was rare in the ancient world
- Herophilus placed intelligence in the *brain*, separated nerves from tendons, and timed the pulse
- Later writers (Celsus) say condemned prisoners were cut open alive. Historians dispute this
- The knowledge was largely lost. Galen, centuries later, worked from animals. Lecture 2 shows what that cost


#aside[
Sources: von Staden 1989, _Herophilus_; Nutton 2013, _Ancient Medicine_.
]

== Rome: public health as engineering
#set text(size: 17pt)
#grid(columns: (55fr, 45fr), column-gutter: 16pt,
  [
- *Cloaca Maxima*, the great sewer of Rome (traditionally 6th century BC)
- *Aqua Appia*, the first aqueduct, 312 BC. By about AD 97 Frontinus, the water commissioner, lists nine
- Vitruvius advised building towns away from marshes
- Army hospitals (_valetudinaria_) cared for soldiers
],
  [
#callout[
Public health link: *clean water, drains and site planning* are state works. Rome did them without any germ theory. Compare the Indus Valley.
]
])

#aside[
Sources: Frontinus, _De aquaeductu_; Vitruvius, _De architectura_, Book 1; Scobie 1986, Klio 68.
]

== Recap

#align(center, image("/images/timeline_L0.svg", width: 100%))

- Fire, farming and early surgery: illness explained by belief, and treated by trial and care
- Egypt and Mesopotamia: written cases, written rules for doctors
- Indus Valley and India: sanitation, balance and surgery
- Greece: natural causes and the environment
- China, Alexandria and Rome: prevention, human dissection, and public works



== Quiz: question 1 of 8

Which ancient civilisation is known for covered drains and private bathrooms in towns?

a) Egyptian

b) Indus Valley

c) Sumerian

d) Greek



== Quiz: question 2 of 8

The Edwin Smith papyrus is best described as:

a) a spell book

b) a list of kings

c) a set of trauma cases with exam, diagnosis and a verdict

d) a map of the Nile



== Quiz: question 3 of 8

Sushruta is chiefly associated with:

a) physiology

b) surgery

c) epidemiology

d) pharmacology



== Quiz: question 4 of 8

Airs, Waters, Places argued that:

a) gods send disease

b) the environment influences disease

c) blood circulates

d) germs cause fever



== Quiz: question 5 of 8

Moving from hunting to farming most likely:

a) removed infections

b) tended to raise exposure to infection

c) had no effect

d) ended injuries



== Quiz: question 6 of 8

A text attributed to the Mauryan minister Kautilya, which describes state duties including epidemic response, is:

a) Rig Veda

b) Charaka Samhita

c) Arthashastra

d) Manusmriti



== Quiz: question 7 of 8

Which ancient civilisation is best known for aqueducts and a great sewer, built without any germ theory?

a) Rome

b) Egypt

c) Sumer

d) Han China



== Quiz: question 8 of 8

The _Huangdi Neijing_ is notable for:

a) the first surgery text

b) a list of kings

c) the first microscope study

d) health as balance, with stress on prevention



== Quiz answers

+ *b* Indus Valley
+ *c* trauma cases with exam, diagnosis and a verdict
+ *b* surgery
+ *b* the environment influences disease
+ *b* tended to raise exposure to infection
+ *c* Arthashastra
+ *a* Rome
+ *d* health as balance, with stress on prevention



== Take-home

- Every culture explained illness. The shift that matters: *from spirits and fate to natural causes, and from the individual to the environment*
- Ancient sources are uncertain. Ask: who wrote this, when, and for whom?
- Next lecture: how observation, dissection, the microscope and counting replaced authority



== References
#set text(size: 17pt)

- van Middendorp JJ, et al. The Edwin Smith papyrus. Eur Spine J. 2010;19(11):1815-23. doi:10.1007/s00586-010-1523-6
- King LW, transl. The Code of Hammurabi. Avalon Project. avalon.law.yale.edu/ancient/hamcode.asp
- Jansen M. Water supply and sewage disposal at Mohenjo-daro. World Archaeol. 1989;21(2):177-92
- Wallace AFC. History of plastic surgery. J R Soc Med. 1978
- Bhishagratna KKL, transl. Sushruta Samhita. 1907
- Olivelle P, transl. King, governance, and law in ancient India: Kautilya's Arthasastra. OUP; 2013
- Adams F, transl. On airs, waters, and places. classics.mit.edu/Hippocrates/airwatpl.html
- North M, transl. Hippocratic Oath. NLM; 2002
- Unschuld PU, Tessenow H. Huang Di Nei Jing Suwen. Univ California Press; 2011
- von Staden H. Herophilus: the art of medicine in early Alexandria. CUP; 1989
- Frontinus. De aquaeductu urbis Romae (about AD 97); Vitruvius. De architectura
- Eshed V, et al. Paleopathology and the origin of agriculture in the Levant. Am J Phys Anthropol. 2010;143(1):121-33


