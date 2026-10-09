---
name: writing
description: >
  Write or revise durable prose — technical reports, papers, documentation,
  READMEs, design docs, data indexes, abstracts, worklogs — in plain,
  self-contained English. Activates when the user asks to write, draft,
  rewrite, review, or "do a pass on" such a document, and when composing one
  as part of a larger task. Core discipline: every sentence must survive two
  tests — a competent reader new to the document understands it on first
  reading, and a reader with the artifact but none of the development history
  loses nothing. Includes a mechanical verification pass to run before
  shipping. Distilled from many rounds of a user's editorial feedback on a
  60-page technical report; treat violations as defects, not preferences.
version: 1.0.0
---

# Writing

Prose that a stranger can read once and understand, and that carries no
dependence on the conversation that produced it. The rules below exist
because each one was violated in practice and the violation was caught by a
reader; the reference files show the actual before/after pairs.

## The two master tests

Every other rule serves these. When a rule seems not to apply, the tests
still do.

1. **The first-reading test.** A competent reader who has never seen this
   document understands each sentence on first reading, without
   backtracking. If you had to re-read it, they will have to re-read it.
2. **The no-hidden-context test.** A reader who has the artifact but none
   of the conversation or development history loses nothing. If
   understanding a sentence requires "you had to be there," rewrite it.

## Audience and technical vocabulary

Establish the reader's assumed background before editing. Preserve technical
precision and use the vocabulary that background supports.

- Retain familiar technical terms, notation, equations, and algorithm names.
  Replacing a standard term with a longer paraphrase can make an explanation
  harder to read and less precise.
- Explain specialist concepts outside the reader's background and define
  document-specific terms at first use. A short definition or example is
  sufficient when the reader can follow the remaining argument unaided.
- For readers with an undergraduate computer science education, assume
  programming, algorithms, asymptotic complexity, linear algebra, and basic
  probability. Introduce specialist statistical and geometric methods at the
  level needed to understand their role, assumptions, and outputs.
- Distinguish unfamiliar terminology from inconsistent definitions and
  unsupported claims. Technical vocabulary alone is not a writing defect.
- Preserve explanatory material required by the document's purpose or the user.
  Improve its clarity and accuracy before deciding whether to shorten it.
  An assumed technical background does not override an explicit requirement.
- Document mathematical notation, including each symbol's role, domain, and
  units where relevant. Define shared notation once and explain local meanings
  beside their formulas. Audit symbol coverage after revisions.

## Self-containment

- Describe the thing as it exists. State purpose, behavior, invariants,
  interfaces, evidence, and limitations directly. Do not narrate the
  journey that produced it.
- Canonical documentation is a present-state specification, not a
  changelog. Replace stale claims instead of layering history on top.
  Chronology, rejected attempts, and retrospectives belong only in
  explicitly historical documents (worklogs, run logs), clearly labeled as
  such.
- No false definite references. "The experiment", "this approach", "the
  1M-token capture" are invalid unless that exact object was introduced
  locally and unambiguously. Counts, dates, and versions are attributes,
  not identities.
- Concepts before identifiers. On first reference, give the object's
  semantic role in plain words; give the durable identifier (path, name,
  schema, hash) only when the reader must use it. Never make internal
  codenames, experiment labels, or shorthand the vocabulary of the
  document.
- Label status explicitly — implemented, qualified, research-only,
  unsupported — rather than implying it.
- State evidence as conditions, measurement, result, and conclusion — not
  as a story.

- **Reaching for a stock metaphor means the point is not made yet.** A small
  set of words get used when a sentence is standing in for an explanation the
  writer has not worked out: *spine*, *seam*, *register*, *substrate*,
  *surface* used figuratively, *the whole X*, *first-class*, *load-bearing*,
  *atom*, *the shape of X*. They feel precise and carry almost nothing — a
  reader cannot act on "the settlement seam" or "the console's register". Treat
  a draft containing one as a signal to stop and ask what the sentence is
  actually claiming, then write that instead: name the thing, say what it does,
  say what happens without it. Some have a literal technical sense that is fine
  (a seam in a garment, a register in a processor, the spine of a book); the
  test is whether a reader who does not already know the answer could act on
  the sentence.

- **Inherited phrasing gets no exemption.** A sentence lifted or adapted
  from a source — a design doc, a spec, an issue, an upstream README, the
  code's own comments — arrives sounding authoritative and slips past the
  rules that would have caught it had you written it yourself. Re-test
  every borrowed phrase against the checklist. Define a source's terminology
  when it falls outside the reader's assumed background. Rewrite slogans
  whose meaning depends on context the document has not supplied.

## Plain language

- **Explain unfamiliar concepts at first use.** Give a concise explanation
  alongside the technical term: "…the area of the surrounding spherical
  cap, given by the cap-area law." Use familiar technical terms directly;
  they do not each require a plain-language paraphrase or a tutorial.
- **Ground every abstraction.** "At every scale" means nothing until it
  becomes "at every similarity level" or, better, "at cos = 0.9, say,
  rather than cos = 0.5". A concrete instance beats a category.
- **Pair examples correctly.** "An ecologist applies it to trees, an
  epidemiologist to disease cases, an astronomer to galaxies" — never a
  list that has the ecologist counting stars.
- **One idea per sentence.** Cap around 40 words. A sentence carrying both
  an em-dash aside and a subordinate clause almost always needs splitting.
- **Plain words, active voice, concrete subjects.** "Compares" not "makes
  a comparison"; "shows" not "provides a demonstration"; "the tool
  computes X" not "X is computed". Prefer "use" to "employ" and "need" to
  "necessitate".
- **No filler or meta-prose.** Cut "in its own terms", "the general
  contrast is this", "it helps to fix an image", "this section describes".
  Enact structure; never announce it. A contributions or summary list
  makes claims, not a walkthrough of the document.
- **State the action or claim directly.** Omit unsolicited descriptions of what
  will remain unchanged, what will not be done, or how results will be classified.
  Include scope boundaries when they answer the reader's question or clarify a
  material assumption, limitation, or compatibility effect.
- **Remove canned summaries and transitions.** Avoid "Bottom Line", "In short",
  "The simplest mental model is", and question-and-answer slogans. End with the
  substantive conclusion or next action. Review words such as "delve", "foster",
  "leverage", "importantly", and "genuinely" for a more concrete verb or deletion.
- **Use established terms and explicit relationships.** Avoid invented compound
  labels whose meaning depends on hidden context, and replace vague qualifiers
  with specific conditions. Use verbs and prepositions to explain relationships.
  Compound terms and hyphenation are not defects by themselves.
- **Describe the behavior instead of compressing a work item into a label.**
  State what executes, what fails, and what must change. Removing hyphens from
  an opaque phrase does not explain it. Issue titles, link labels, progress
  updates, and summaries must be understandable without the conversation;
  a glossary elsewhere does not excuse shorthand in those places.
- **Avoid unprompted contrastive framing.** State the intended claim without
  inventing an alternative to reject. Patterns such as "X, not Y" and "This is
  not about X; it is about Y" often conceal a missing explanation. When a
  distinction is necessary, name the difference in a direct sentence and explain
  its consequence. Preserve technical comparisons and substantive limitations.
- **Verbs carry their objects.** Never elide an argument the reader must
  recover from an earlier sentence: "measures at every similarity level"
  forces the question – measures what? – so write "measures occupancy at
  every similarity level".
- **Do not personify the subject.** A program measures, records, requires,
  refuses and reports. It does not *ask*, *want*, *care*, *know*, *decide to*,
  *promise*, *try*, *expect* or *be happy to*. "What zicato asks of your
  system" defers the claim behind a social verb; "What your system must
  provide" states it. The same applies to a document, a test, or a gate as the
  subject of a sentence.
- **Register.** Formal but plain. No metaphors, epigrams, or aphorisms
  ("raw K reports the crowd, not the outbreak" — rewrite literally). No
  rhetorical questions. No colloquialisms. No contractions. No empty
  intensifiers: demonstrably, deliberately, exactly, precisely, genuinely
  — where they carry nothing. No grandiose title riders ("…, From First
  Principles") and no appositive verb-tags ("…, measured.").
- **Never write "the whole of".** Cut the phrase and keep the noun: "the
  whole of the token cost" says what "the token cost" says. Where the phrase
  is carrying weight it is claiming a totality the evidence does not support,
  and the repair is the figure — "85% of billed input is accumulated tool
  output re-sent at every step", not "context bloat is the whole of the token
  cost". There is no sentence the phrase improves.
- **Name the things the sentence is about.** When a passage exists to
  distinguish four terms, the sentence that opens it names those four terms; a
  count-word standing in for them ("four terms collide") withholds the payload
  and leaves the reader to reconstruct it from what follows. A heading over a
  set of named things uses their names — "Run, round, epoch, lineage", never an
  invented collective ("The four clocks") that the reader must decode. This is
  the grounding rule applied to the case where the instances *are* the content.
- **A heading states; it does not ask or hint.** It carries the claim the
  passage makes, so a reader skimming headings alone learns the argument. A
  question as a heading defers that to the body, and a coy label ("A note on
  scale") defers it further. A section organised around a reader's question is
  fine when each heading is the *answer* rather than the question.
- **Structure parallel content as labeled bullets**, not semicolon chains.
  Headings name the job the passage does ("Testing the whole curve at
  once"), not the object it discusses ("Spatial statistics"), and must not
  overclaim the section's finding.
- **Interpretation beside evidence.** Captions say what to see; adjacent
  body prose says why it matters; the two never duplicate a sentence.
- **Prefer the field's standard term to invented plainness.** "Low false
  positive rate" beats "false alarms stay within the five percent the
  test allows"; "global metric" beats a hand-rolled circumlocution.
  Plain means standard, never folksy: when the audience's ordinary
  vocabulary has the word, use it.
- **Minimize headline concepts.** One named concept carries a document;
  its companions are introduced where they are used, and coinages
  survive only as locally defined names of specific objects (a statistic,
  a threshold), never as competing frames.
- **Attribute each result to its actual cause.** If supervision produced
  the gain and the tool preserved it, say exactly that; crediting the
  tool with the gain is an overclaim even in a one-line summary.
- **Abstract altitude.** Mechanism and qualitative outcome; protocol
  detail, counts, and p-values live in the body. Stated boundaries stay
  even at this altitude ("held on every collection except…") — a scope
  qualifier is content, never detail.
- **Fold defining properties in as operational facts, not taglines.**
  "Working only from the distances between documents, with no labels or
  example queries, the tool computes…" carries the unsupervised property
  inside the mechanism; a bolted-on closing sentence does not.
- **Numbers anchor; they do not argue.** Walk arithmetic step by step when
  it carries the point. Explain odd constants at first use (19 simulations
  because 1/20 = 5%; 199 nulls so the smallest p is 1/200).
- **Honesty mechanics.** Every "N things" claim must match the list it
  announces — count them. Negative results appear at the same volume as
  positive ones. No internal identifiers (H2, E6, Set A) or tally
  shorthand (22/22, +12/−0) in prose; write "in every pairing that tests
  it", "twelve improved, none harmed".

## Verification before shipping

Run the pass in `reference/checklist.md`. In brief:

1. Mechanical greps for the banned constructions.
2. The long-sentence detector.
3. First-use audit: define unfamiliar and document-specific terms; use
   familiar technical vocabulary consistently.
4. A manual read for false definite references and broken antecedents —
   greps only surface candidates.
5. Count-vs-list audit on every announced count.
6. For documents beyond roughly ten pages, sweep in sections with
   independent reviewers returning verified-anchor edits, applied
   centrally; the checklist gives the recipe.

## When the user gives new writing feedback

Generalize it. A comment on one sentence is a rule about a class of
sentences: fix the instance, sweep the document for the class, and add the
generalized rule to this skill (and to project memory if project-specific).
The reference examples grew exactly this way.

## Reference files

- `reference/examples.md` — real before/after pairs, each tagged with the
  rule it illustrates. Read this when calibrating how aggressive an edit
  should be.
- `reference/checklist.md` — the executable verification pass: grep block,
  long-sentence scanner, audit steps, and the section-sweep recipe.
