# State law review: manual check of the donor-disclosure record

Built 2026-09-28 by `code/transparency/build_tom_review_pack.py`.

## What this is

We rebuilt the state-law coding for Paper 2 around one row per legal event (a
statute, AG opinion, court decision, or board policy) instead of one category
per state. Two AI models each produced a version of that event record, and
they disagree in places. Neither has been checked by a person. **Your job is to
be that person:** open the cited sources and record whether each claim holds
up.

You are checking **facts**, not coding choices:

1. Does the cited authority exist and say what the row claims?
2. Is the date right?
3. Where the two versions disagree on a fact, which one is right?

Whether an event *counts* as opening or closing donor disclosure for the paper
is a separate question, and it's mine. The `coding_flag_for_keaton` column
marks those cases. Read it if it helps, but you don't need to resolve it.

## The two versions

| | Claude | ChatGPT |
|---|---|---|
| Events file | `version_claude/donor_disclosure_events_claude.csv` | `version_chatgpt/donation_disclosure_events_chatgpt.csv` |
| Appendix | `version_claude/notes_paper2_legal_appendix_claude.md` | `version_chatgpt/donation_disclosure_legal_appendix_chatgpt.md` |
| Rows | 57 | 82 |
| Style | Lean: one claim per row, plus a `verify_by_hand` instruction telling you what to open and look for | Detailed: separate before/after codes for identity, amount, date, terms, benefits, and linkage |

Both started from Andrew's state notes (`reference/andrew_state_notes.txt`)
and from the earlier rounds of review. The ChatGPT appendix links to
`donation_disclosure_events.csv`; that's the ChatGPT events file, renamed here
with a `_chatgpt` suffix.

## Where to work: `state_law_review_workbook.xlsx`

- **Crosswalk** is where you'll work. It has 93 rows. Each row is one
  event, with the two versions side by side where both have it:
  - 46 rows are events that both versions record
  - 11 rows are Claude only
  - 36 rows are ChatGPT only

  Pairing is automatic (same state, dates within a year). I checked a few
  pairings by hand, and `pairing_note` explains those. If you think two rows
  are the same event but weren't paired, or were paired but are really
  different events, put that in `TOM_notes`.
- **States** lists all 51 jurisdictions with each version's events. Use the
  two `TOM_` columns there for a one-line verdict per state once its crosswalk
  rows are done.
- **Claude events (ref)** and **ChatGPT events (ref)** hold the full original
  files, in case you want a column the crosswalk leaves out.

Yellow columns starting with `TOM_` are yours to fill in. Everything else is
read-only; please don't edit it, so I can merge your answers back by `row`.

| Column | What to enter |
|---|---|
| `TOM_source_opened` | Y / N - could not find / N - paywalled |
| `TOM_authority_exists` | Y / N / Cited wrong (e.g. wrong section or opinion number; say what's right in the notes) |
| `TOM_correct_date` | The date as the source gives it (YYYY-MM-DD, or YYYY if that's all there is). For a statute, give the effective date and put the enactment date in the notes if it differs. |
| `TOM_which_version_right` | Claude / ChatGPT / Both / Neither / Cannot tell. Only for paired rows where they differ. |
| `TOM_claim_supported` | Y / Partly / N. Does the source actually say what the claim says? |
| `TOM_minutes` | Rough time spent, so we can plan the rest |
| `TOM_notes` | Anything else, including a pinpoint quote if it settles something |

## Order of work

Work through the rows by `priority`; the sheet is already sorted that way.

- **Priority 1 (42 rows): must check.** Dated events inside our
  1989–2024 sample window, where the versions disagree on a date or a
  direction, only one version has the event, or nobody read the primary text.
  These can move a state's treatment year, so they matter most.
- **Priority 2 (26 rows): should check.** Both versions agree, but the
  event is in the sample window or is undated and only one version has it.
  Here a quick confirmation that the source says what's claimed is enough.
- **Priority 3 (25 rows): spot check.** Baseline and oversight rows with
  no date, and events outside the window. Do a handful and tell me if they
  look sloppy.

Date disagreements in the crosswalk: 1 rows with different years,
8 with the same year but a different exact date, and 5
where only one version gives a date. Some exact-date differences are
enactment vs. effective date, or decision vs. release date. If that's all it
is, just say so.

## Please look at these first

- **Kentucky (KY-02 vs KY-2008).** This is the biggest conflict. Both versions
  cite *Cape Publications v. University of Louisville Foundation*, but they
  describe opposite holdings. Claude says the foundation may withhold *all*
  donor identities and cites the Court of Appeals. ChatGPT says the 2008
  Kentucky Supreme Court decision (260 S.W.3d 818) rejected blanket donor
  privacy. Please establish which court held what, and whether the Supreme
  Court reversed.
- **Tennessee.** The Claude file has no Tennessee rows at all, even though
  both models dated Tennessee to 2011 in the earlier round. ChatGPT has three
  (TN-2007, TN-2011-CASE, TN-2011). Please check all three.
- **Evidence nobody has read.** Rows flagged `not_retrieved` (Claude) or
  `secondary_only` / `later_primary_account` / `official_summary` (ChatGPT)
  rest on someone's description of a source, not the source itself. Arkansas
  (AG Op. 2010-136) and Oregon 2010 are the important ones. If you can get the
  original, that alone is a real contribution.
- **Jurisdictions only one version covers.** Only Claude covers AR, DE, HI,
  and MO. Only ChatGPT covers AK, CO, DC, ME, MT, SD, TN, VT, and WY (mostly
  oversight baselines).

## Tips

- Claude's `claude_how_to_verify` column tells you exactly what to open and
  what text to look for. Start there.
- For state statutes, the legislature's own site is best. Justia is fine for
  current text, but it doesn't give historical versions. For session laws and
  enactment dates, use the legislature's bill history.
- AG opinions are usually on the AG's site. Older ones may only be on Westlaw
  or Lexis through the library.
- Don't trust a summary (a news story, an SPLC write-up, or a later case
  describing an earlier one) for a date or a holding if you can get the
  original. If you can't, record what you did find and mark the row
  `Cannot tell`.
- A case holding about one named foundation isn't automatically a statewide
  rule. If the source is narrower than the claim, mark it `Partly` and say
  why.

## Sending it back

Rename the workbook to `state_law_review_workbook_TOM.xlsx`, fill in the
yellow columns, and send it back. Partial is fine. Priority 1 alone would be
very useful. If you give up on a row, write why in the notes rather than
leaving it blank.
