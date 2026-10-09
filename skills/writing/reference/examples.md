# Before/after gallery

Real edits from an editorial collaboration on a 60-page technical report.
Each pair is tagged with the rule it illustrates. Use these to calibrate
how far an edit should go: the "after" versions were accepted; several
"before" versions had already survived earlier review passes.

## Epigrams → literal statements

**Before:** "Raw K reports the crowd, not the outbreak."
**After:** "Counting pairs against a uniform comparison would measure
where the population lives rather than how the disease spreads."
The epigram is memorable to someone who already understands; the literal
sentence teaches the mechanism.

## Mispaired examples

**Before:** "Ripley's K function is the ecologist's tool for asking
whether points (trees, stars, cells) cluster."
**After:** "An ecologist applies it to trees in a forest plot, an
epidemiologist to the home addresses of disease cases, an astronomer to
galaxies in a survey volume, a cell biologist to proteins imaged on a
membrane."
The before-version has ecologists counting stars. Each doer gets their own
object.

## "the whole of"

**Before:** "Context bloat is the whole of #213" (a section heading, over a
passage whose own table gave 85%).
**After:** "85% of billed input is accumulated tool output re-sent at every
step."
The phrase is banned outright. Usually it is padding and deleting it changes
nothing. Where it is doing work it claims a totality the evidence does not
support, and the figure is what belongs there instead.

## Counts that do not match their lists

**Before:** "Two complementary data regimes carry the evidence" — followed
by three regimes, (i), (ii), (iii).
**After:** the count corrected, and later the framing rewritten so no
count was needed.
A reader who counts loses trust in everything else. Check every "N
things" claim against its list; this bug recurred twice in one document
("four instruments, one for each requirement" — the mapping was not
one-to-one).

## Filler that says nothing

**Before:** "The instrument answers the question in its own terms."
**After:** "Three commitments follow from that question." (and the
commitments each say something concrete).
Also cut on sight: "The general contrast is this.", "It helps to fix an
image of the object under study.", "and the move is kinder than it
sounds", "stated in retrieval terms".

## Unexplained abstraction → concrete instance

**Before:** "the band shows at which similarity a corpus departs from the
reference"
**After:** "the band shows at which similarity level a corpus departs from
the reference — at cos = 0.82 on the legal corpus, say, rather than
anywhere looser"
"At what scale", "at every scale at once", "dozens of thresholds", "a
reference band" all drew "what does this mean?" from a reader. One
concrete value repairs each.

## Terms used before explanation

**Before:** "…on hundreds of corpora with nothing planted…"
**After:** "…when a group of near-duplicates is deliberately inserted into
a corpus (a planted defect)…" — the term explained at first use, then
usable thereafter.
Same class: "pair share", "guard terms", "stated null", "traced benchmark"
(used eight times, defined nowhere).

## Explain, then name

**Before:** "…where the null is a cap-area law and, the domain having no
boundary, the planar edge corrections vanish."
**After:** "…the chance that a random point falls within a given distance
of another is the area of the surrounding patch of surface, which has a
closed form (the cap-area law). … A forest plot has edges, and a tree near
one has neighbours only on the inside, so its pair counts run low and the
ecologist must compensate for it (an edge correction). A sphere has no
edge, so nothing needs correcting."
Both readers served: the newcomer gets the idea, the expert gets the term.

## Metaphor in a figure caption

**Before:** "the null pair-cosine distribution collapses to a needle at 0"
**After:** "collapses to a narrow spike at 0"
Literal and still accurate. The metaphor had also spread to a second
caption ("the uniform needle at 1.36") — figurative residue propagates, so
sweep for it.

## Lifecycle labels and codenames as identities

**Before:** files named `e6-ckpt-r1-lora`, `qfix.txt`, `workerb1.log`,
`a0.npy`.
**After:** `lora-round1-rejected`, `esci-rescore-after-query-loader-fix.txt`,
`backfill-natural-questions.log`, `subset-linear-adapter.npy`.
The name states what the thing is or what happened to it, not which
internal round produced it. Same rule in prose: no "Phase 2", "the pilot",
"the new pipeline".

## False definite reference

**Before:** "This report describes an instrument built to measure
occupancy and crowding without either failure." — "either failure" pointed
two paragraphs back, across a figure, at "both difficulties".
**After:** "…without relying on global averages or on a discretization."
Name the referent instead of pointing at it. Related repairs: restore the
"that" in reduced relatives ("clustering that the cone cannot explain" —
without it, "clustering the cone" garden-paths as a verb phrase).

## Journey narration → present-state specification

**Before (doc style):** "We initially used hexbin displays, then found
they were fragile, so the current version replaces them…"
**After:** "The display contains no bins. Binned views were measured to be
fragile (§5) and are excluded by design."
The document states what is; the worklog records what happened.

## Run-on carrying an aside and a clause

**Before (90 words, one sentence):** the report's original conclusion.
**After:** four sentences, one claim each.
The reliable splitting cue: an em-dash aside plus a subordinate clause in
the same sentence.

## Nominalizations and showy verbs

**Before:** "provides a demonstration", "makes a comparison", "the
diagnosis descends to named items", "adjudicate", "prices crowding".
**After:** "shows", "compares", "names the individual items", "judge",
"converts crowding into an expected error count".

## Headline overclaim

**Before (subsection heading):** "Driving retrieval behavior" — the
subsection's finding was that the objective alone is retrieval-neutral.
**After:** "What the objective alone does to retrieval".
Headings must not claim more than the section shows.

## Caption/body duplication

**Before:** the same sentence ("ESCI and TREC-COVID hold the most
near-duplicate mass, Quora the least…") verbatim in a figure caption and
in the adjacent body paragraph.
**After:** caption says what to see; body carries the interpretation;
neither repeats the other.

## No antithesis appositions

**Before:** "No real corpus is that even; the simulation is a yardstick,
not a target."
**After:** "No real corpus is that even; the simulation shows how far
each corpus departs from chance."
*(The "X, not Y" flourish is banned everywhere — including headings like
"The corpus-level claim earns a narrow scope, not a blanket confirmation"
→ "…earns only a narrow scope", and labels like "Reference, not
threshold" → "Reference curves are comparisons only". Where the negation
carries real content, use "rather than" in an ordinary clause: "properties
of the lattice rather than of the data".)*

## Verbs carry their objects

**Before:** "ambit measures at every similarity level rather than at one
chosen cutoff."
**After:** "ambit measures occupancy at every similarity level rather
than at one chosen cutoff."
*(The elided object forces the reader to fetch "measures what?" from a
previous sentence — a first-reading-test failure even when the paragraph
is otherwise clear.)*

## Standard term over invented plainness

**Before:** "false alarms stay within the five percent that the test
allows."
**After:** "\textsf{ambit} has a low false positive rate."
*(Author's own correction. Plain-English passes had replaced standard
terminology with hand-rolled phrasings; the author replaced them back
with the field's ordinary words.)*

## Attribute each result to its actual cause

**Before:** "using ambit measurements to govern supervised fine-tuning
demonstrated improved recall."
**After:** "the repairs ambit chose improved retrieval without harming
any query. Added as penalty terms to a supervised fine-tune, the same
measurements halved the damage that fine-tune caused outside its
training data, at no cost to its gains."
*(The recall gain came from supervision; the tool's measured
contribution was choosing a repair and bounding the damage. Each clause
now claims exactly what its experiment showed.)*
