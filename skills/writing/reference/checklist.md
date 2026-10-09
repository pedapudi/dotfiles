# Verification pass

Run this before shipping a document. Steps 1–2 are mechanical; steps 3–5
are manual reads that the greps cannot replace; step 6 scales the pass to
long documents. `DOC` below is the file under review (works on LaTeX,
Markdown, and plain text; adjust comment stripping per format).

## 1. Greps for banned constructions

Zero hits expected from every line. Each pattern names its rule.

```bash
DOC=path/to/document
# appositive verb-tags ("..., measured." / "..., rewritten") — the earlier
# pattern listed five -ed verbs and missed every irregular participle, so
# "the same source, rewritten" shipped. Match the FORM, then read each hit.
grep -nE ", [a-z]+(ed|en|wn|ilt|ept|ade|one)[ .,:<]" "$DOC"
# the subject personified — a program requires, it does not ask
grep -niE "\b(zicato|the (tool|gate|test|loop|document|schema)) (asks|wants|cares|knows|promises|tries|expects|is happy)" "$DOC"
# empty intensifiers (review each hit; keep only load-bearing uses)
grep -nE "\b(demonstrably|genuinely|deliberately|precisely|exactly)\b" "$DOC"
# filler phrases that recur
grep -niE "in its own terms|the general contrast|it (helps|is worth noting)|needless to say|in other words," "$DOC"
# lifecycle labels used as identities (review hits in prose, not version tables)
grep -nE "\b(Phase [0-9]|the pilot|the new (pipeline|system|version)|the old (pipeline|system|version)|the latest run)\b" "$DOC"
# tally shorthand and internal identifiers in prose
grep -nE "\b[0-9]+/[0-9]+\b|\+[0-9]+/-[0-9]+" "$DOC"
# unexplained "at ... scale" phrasing
grep -niE "at (what|every|each) scale" "$DOC"
# contrastive appositions ("X, not Y") — review for unprompted alternatives.
# "never" and "rather than a" negate the same way; "rather than" alone is
# the sanctioned repair and is not flagged.
grep -nE ", (not|never) [a-z]|\bnever by\b|\bnot by\b" "$DOC"
# "the whole of" — banned outright, no hit is acceptable
grep -ni "the whole of" "$DOC"
# stock metaphors standing in for an explanation — review every hit
grep -niE "\\b(spine|seam|register|substrate|load-bearing|first-class|the whole [a-z]+)\\b" "$DOC"
# rhetorical questions (any '?' outside quoted speech deserves a look)
grep -n "?" "$DOC" | grep -viE "``|\"[^\"]*\?"
```

## 2. Long-sentence detector

Flags sentences over 45 words. List-carrying "sentences" (bullets glued by
the splitter) are false positives; everything else gets split or defended.

```bash
python3 - "$DOC" <<'EOF'
import re, sys
s = open(sys.argv[1]).read()
# strip LaTeX figure/table/tikz bodies and comments; harmless on Markdown
s = re.sub(r'\\begin\{(tikzpicture|table|figure|axis)\}.*?\\end\{\1\}', '', s, flags=re.S)
s = re.sub(r'(?m)%.*$', '', s)
for sent in re.split(r'(?<=[.!?])\s+', s):
    w = sent.split()
    if len(w) > 45 and r'\item' not in sent and 'bibitem' not in sent:
        print(len(w), '|', ' '.join(w)[:140], '\n')
EOF
```

## 3. First-use audit (manual)

State the intended reader's background before auditing terminology. Retain
standard terms and notation familiar to that audience. Check that specialist
concepts outside that background and document-specific terms receive a
concise definition at first use. Do not require a tutorial for each technical
term. Check consistency even when the vocabulary is familiar: a symbol or
term must keep its meaning unless a change is stated explicitly.

For a technical report, inventory the symbols in equations, captions, tables,
and diagrams. Verify that every symbol has a documented meaning, with its domain
and units where relevant. Preserve explanatory material required by the document
or the user; assumed reader expertise does not replace this coverage.

Walk the document in order. Use `rg -n "term"` to locate the first occurrence
of an unfamiliar term and verify that its meaning is available there. Terms
that have required clarification include "stated null", "pair share",
"guard terms", "planted", "traced benchmark", and "at every scale".

## 4. Reference and antecedent read (manual)

- Every "the X" / "this X" where X is a category noun (approach,
  experiment, method, result): was that exact object introduced locally?
  If it lives more than a paragraph away or across a figure, name it.
- Reduced relatives: search `grep -nE "\b(that|which)\b" -c` is useless
  here; instead read any clause of the form "noun noun verb" for garden
  paths and restore "that" ("clustering [that] the cone cannot explain").
- Pronouns at paragraph openings ("It", "This", "These") — confirm the
  antecedent is the previous sentence's subject, not two ideas back.
- Elided objects: read each transitive verb used without an object
  ("measures at…", "compares against…") and restore the object unless it
  appears in the same sentence.

## 5. Count-vs-list audit (manual)

For every "N things" / "both" / "the two X" claim, count the list it
announces. Include implicit claims: "one for each requirement" asserts a
bijection — check it holds. This class of bug appeared twice in one
document and is invisible to spellcheck and to casual rereading.

## 6. Section sweep for long documents (> ~10 pages)

Independent reviewers over disjoint section ranges, applied centrally so
anchors never go stale:

1. Give each reviewer: its line range, the rules (or this skill), and the
   instruction to return a JSON array of `{"old", "new", "why"}` edits
   where `old` is copied file text with whitespace runs collapsed to
   single spaces, unique in the whole file, verified before proposing.
2. Reviewers write JSON only; nobody edits the document directly.
3. Apply centrally with whitespace-flexible matching; report any anchor
   that matches zero or multiple times rather than guessing:

```python
import json, re
src = open(DOC).read()
for e in json.load(open("edits.json")):
    pat = r"\s+".join(re.escape(t) for t in e["old"].split())
    ms = list(re.finditer(pat, src))
    if len(ms) != 1:
        print("SKIP", len(ms), e["old"][:60]); continue
    src = src[:ms[0].start()] + e["new"] + src[ms[0].end():]
open(DOC, "w").write(src)
```

4. Rebuild/render and re-run steps 1–2 after applying; sweeps introduce
   their own regressions (a reviewer's fix can break a cross-reference in
   another range — one sweep created a dangling "both failures" this way).

## 7. After any user feedback

Fix the instance, then sweep the whole document for the class, then add
the generalized rule to this skill. One comment on one sentence is
evidence of a pattern; the same wording usually appears elsewhere.
