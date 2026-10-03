# Appendix: the legal record on donor disclosure

Draft for the Paper 2 appendix, 2026-09-22. Companion to
`data/donor_disclosure_events.csv`, which holds the same content in machine-
readable form, one row per legal rule or event. **The CSV is authoritative; the
state sections below are generated from it**, so the two cannot drift apart.

## 1. What this is, and why it is built this way

The paper asks whether legal rules exposing donors reduce donations. That
requires knowing, for each state and year, whether a gift became publicly
linkable to the named donor. The first attempt to record this used one
categorical per state. It churned badly, and this appendix exists partly to
document why and to make the churn auditable.

**The unit is a single legal rule or event, not a state.** One categorical per
state forces a single verdict that must be re-opened whenever any underlying
fact moves — so a correction anywhere propagates everywhere, and the reader
cannot see which part of the verdict rests on what. An event row is one claim:
it is right or wrong on its own evidence, and revising it disturbs nothing
else.

Each row carries what is needed to check it without reference to this project:
the claim in one sentence, the precise citation, a URL, what was actually done
to verify it, whether one or two independent reviewers support it, and an
explicit instruction for hand-verification.

## 2. How the record was produced

Andrew's state-by-state research document was the starting point. Two frontier
models then classified all 51 jurisdictions independently and **blind to each
other**, from that document plus the original classification. Their results
were reconciled over two rounds, with each model auditing the other's
reasoning. Those artefacts are in `data/state_law_review/`.

The blinding included three deliberate test cases. The seed file given to both
reviewers carried Connecticut 2017, Georgia 2012 and Tennessee 2007 — three
dates a previous pass had revised, withheld so they would function as tests.
**Both reviewers independently reached Connecticut 1989, Georgia 2003 and
Tennessee 2011.** Neither saw the other; neither was told these were tests.

The two also independently converged on Alabama 1981, Kentucky 1992, New
Jersey 2013, Pennsylvania 2010, and on reclassifying Virginia, North Dakota,
Mississippi and Massachusetts — every one a departure from the seed. They also
independently designed extended variable sets that both separated donor
identity, gift amounts, gift terms, coverage scope, binding strength and
change-over-time, without either seeing the other's schema.

## 3. Evidence grades

Read `evidence` before relying on any row.

| Grade | Meaning | n |
|---|---|---|
| `original_read` | The primary text was retrieved and read by this pass | 11 |
| `original_read_passB` | Retrieved and read by the independent second pass | 27 |
| `secondary_official` | Official secondary source — legislative summary, AG manual, annotated code | 14 |
| `secondary_unofficial` | Press or advocacy account | 1 |
| `not_retrieved` | **The original could not be obtained by either pass** | 4 |

The four `not_retrieved` rows are Arkansas AG Op. 2010-136, the Oregon 2010 AG
opinion, *Eisenberg v. Goldstein* (N.Y. 1988), and the Maryland null finding.
None should be relied on as a dated event. Arkansas matters most: it is one of
only five states qualifying as a clean never-treated control under a
records-access treatment.

`sources` records agreement: 32 rows supported by both passes, 15 where the
passes conflicted and the conflict was resolved against a source, 9 found only
by the second pass, 1 only by the first.

**On the links.** All 55 distinct URLs were checked and all are live. About a
third return 403 or 202 to an automated request — Justia, FindLaw and the
Kansas AG block scripted access, and CourtListener answers 202 while it loads
— but every one opens normally in a browser. A failed `curl` is not a dead
citation. Every row also carries a full reporter or session-law citation, so
each authority can be found in any database independently of the link.

## 4. Revision log

Every coding that changed during this work, with what caused it. This is the
part to read sceptically.

### 4a. Errors inherited from the source document

| Item | Seed said | Correct | Found by |
|---|---|---|---|
| Connecticut onset | 2017 | **1989** | both passes, blind |
| Georgia onset | 2012 | **2003** | both passes, blind |
| Tennessee onset | 2007 | **2011** | both passes, blind |
| Alabama onset | 1975 | **1981** (1975 is a code recodification year) | both passes |
| Kentucky onset | 1985 | **1992**; no 1985 authority exists | both passes |
| New Jersey onset | 2012 | **2013** (2012 is the complaint number) | both passes |
| Pennsylvania onset | 2011 | **2010** (2011 is the allocatur denial) | both passes |
| Mississippi AG opinion | 98-0676 | **98-0679** | second pass |
| Washington gift exemption | RCW 42.56.310 | **RCW 42.56.320(4)** (42.56.310 is library records) | first pass |
| Idaho board policy | s. V.M | **s. V.E** (V.M is intellectual property) | first pass |
| Louisiana *Bulldog Society* | 2025 | **2017** | both passes |
| Utah donor exemption | "no exemptions" | **Utah Code s. 63G-2-305(37) exists** | both passes |

### 4b. Errors made by the first pass and corrected by the second

| Item | First pass said | Correct | How it was caught |
|---|---|---|---|
| Minnesota donor identity | not disclosable | **disclosable** — s. 13.792 ends "Names of donors and gift ranges are public data" | The first pass had quoted that sentence in its own appendix and coded against it |
| Ohio donor identity | not disclosable | **disclosable** — *Toledo Blade* holds donor names public with no exception, and the later exemption's text preserves names and amounts | Second pass read the exemption's text |
| Georgia donor exemption | created 2012 | **created 2005** (HB 340) | Second pass flagged; verified here on three independent strands |
| Virginia donor margin | nothing exposed | **gift terms exposed** — s. 23.1-1304.1 | Second pass |
| Virginia coverage | statewide | **excludes the Community College System** | Second pass; verified here |
| Washington donor opt-out | general opt-out | **not established** | Second pass |
| Oregon 1988–2010 open interval | asserted | **withdrawn** — the 1988 order covered university-held budgets only | Second pass |
| Indiana 1990–95 open interval | asserted | **withdrawn** — the foundation won below | Second pass |
| Missouri | Explicit | **Unknown** — no foundation-specific determination | Second pass, on a standard the first pass had already applied to MN and NY |
| Oklahoma onset | 1973 | **withdrawn** — 1973 dates the private-status opinion, not the audit duty | Second pass |
| Iowa enacting act | 2006 ch. 1117 | **2006 ch. 1127** (1117 is insurance legislation) | Second pass |
| California chapter | Stats. 2011 ch. 279 | **ch. 247** | Second pass |
| California quid pro quo trigger | "gifts over $2,500" | **the benefit received by the donor**, not gift size | Second pass |
| Donor score rule | blank anonymity carve-out scored as "no carve-out" | **treated as not established** | Second pass; it contradicted the first pass's own stated convention |

### 4c. Genuinely new evidence, not error

| Item | Change | Source |
|---|---|---|
| North Dakota onset | 2013 → **2009** | AG Op. 2009-O-08, found by the second pass, read by the first |
| North Dakota "2017 narrowing" | **withdrawn** | Reading 2009-O-08 showed s. 44-04-18.15 already applied in 2009, so there is no verified donor-open interval. *Neither pass had this right beforehand.* |
| Nevada enactment | unconfirmed → **1993 ch. 626 (S.B. 322)** | Second pass |
| Tennessee public chapter | bracketed → **2011 Pub. Ch. 59 s. 1** | Second pass |
| Georgia 2005 | secondary → **verified on three strands** | This pass: annotated-code history line, official Senate Research Office summary, and the state's own archived code current through 2001 showing no such exemption |

### 4d. What the churn should and should not do to your confidence

Most of it is one of two things: errors inherited from a single-researcher
first pass, or over-claims by the first model that a second model caught. Both
are what the exercise was designed to surface. The blind test cases converging,
and the two passes independently designing the same extended constructs, are
evidence the process works.

The residual worry is the opposite one: **agreement between two passes is not
independence from a shared source.** Both read Andrew's document first, so a
mis-citation there can propagate into both — which is exactly what happened
with the Mississippi opinion number and the Washington section number, caught
only because someone went to the underlying text. The rows to trust least are
those graded `secondary_*` or `not_retrieved`, regardless of how many passes
agree.

## 5. Known gaps

1. **Four originals were never retrieved** (§3). Arkansas is the consequential one.
2. **Ten events have no established date**, including North Dakota's donor
   exemption, Kentucky's *Cape Publications*, Missouri's quasi-public
   definition, and Oklahoma's auditor-access duty. Undated rules cannot enter a
   cohort but still disqualify a state as a clean control.
3. **Georgia's July 1 2005 effective date is inferred** from O.C.G.A. s. 1-3-4's
   default rule; the enrolled act was not read, and Georgia's 2005 bill text is
   not digitised.
4. **Entity-level matching is not done.** Every row here classifies a state. A
   named-entity holding — *Stone* at Jacksonville State, *Weston* at a research
   foundation, *Libit* at UNM — is not automatic statewide treatment, and must
   be mapped to institutions and EINs before exposure is assigned.
5. **The two passes still disagree** on Louisiana, Florida, Texas, New York and
   the treatment of governing-board policies generally. Those disagreements are
   recorded in the `notes` field and in
   `output/transparency/state_law_disagreements.csv`; none of them is a
   donor-margin dispute.

---

## 6. The record, state by state

Generated from `data/donor_disclosure_events.csv`. Rows are ordered by state,
then date.

### Alabama (AL)

**AL-01 — records_route, opens, 1981-10-02** _(decided)_

A nonprofit incorporated to promote a state university, funded by alumni gifts and campus vending proceeds, is the university's alter ego for public-records purposes.

> Stone v. Consolidated Publishing Co., 404 So. 2d 678 (Ala. Oct. 2, 1981)  
> https://law.justia.com/cases/alabama/supreme-court/1981/404-so-2d-678-1.html

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion. Pass B reports it REMANDS for a record-specific public-writing test rather than ordering all donor identities disclosed -- check the disposition before treating this as a donor-identity holding.

**Note:** DATE CORRECTED from the seed's 1975, which is the Code of Alabama recodification year, not an enactment or decision. Both passes independently reached 1981. Pass A's donor score was softened from 3 to 2 on pass B's remand point.



### Arizona (AZ)

**AZ-01 — donor_identity, opens, no date established**

University donor records are exempt other than the names of donors and the description, date, amount and conditions of donations.

> A.R.S. s. 15-1640(A)(3)  
> https://www.azleg.gov/ars/15/01640.htm

*Evidence: original read by this pass · Support: both passes · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read paragraph (A)(3). The exemption's own text carves names, description, date, amount and conditions OUT of the exemption -- i.e. those five items are disclosable.

**Note:** INSTITUTION ROUTE. Foundation coverage is untested, so this does not establish foundation exposure. On disclosure content Arizona is more open than most states the seed coded Explicit.



### Arkansas (AR)

**AR-01 — records_route, closes, 2010-12-08** _(issued)_

A community-college foundation receiving no public funds would likely not be subject to the Arkansas FOIA.

> Ark. Att'y Gen. Op. 2010-136 (Dec. 8, 2010)  
> https://www.courtlistener.com/opinion/3258759/opinion-no/

*Evidence: ORIGINAL NOT RETRIEVED · Support: passes conflicted; resolved · Binding: 1/4 · Custodian: foundation · Covers: named_entity*

**To verify:** THE ORIGINAL OPINION WAS NOT RETRIEVED BY EITHER PASS. The reported reasoning stops at the public-funding element of a two-element test, so the conclusion is conditional on that fact.

**Note:** PASS B MARKS ARKANSAS UNRESOLVABLE on the missing original. This matters: Arkansas is one of only five states that qualify as clean never-treated controls under a records-access treatment.



### California (CA)

**CA-01 — records_route, opens, 2012-01-01** _(effective)_

UC campus foundations and CSU and community-college auxiliary organizations become subject to the California Public Records Act.

> SB 8 (Richard McKee Transparency Act of 2011), Stats. 2011, ch. 247, chaptered Sept. 6, 2011  
> https://www.leginfo.ca.gov/pub/11-12/bill/sen/sb_0001-0050/sb_8_bill_20110906_chaptered.pdf

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** The chaptered PDF header carries the chapter number. There is no urgency clause, so under Cal. Const. art. IV, s. 8(c) the act became operative January 1, 2012.

**Note:** CHAPTER NUMBER CORRECTED: pass A cited ch. 279, pass B ch. 247. The chaptered act says 247.


**CA-02 — donor_identity, closes, 2012-01-01** _(effective)_

Donor identity is exempt where anonymity is requested, but is unmasked where the donor received a benefit exceeding an inflation-adjusted threshold; gift amount, date, purpose and restrictions remain disclosable.

> SB 8, Stats. 2011, ch. 247, donor provisions  
> https://www.leginfo.ca.gov/pub/11-12/bill/sen/sb_0001-0050/sb_8_bill_20110906_chaptered.pdf

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the donor-exception subdivision in the chaptered text. The trigger is the value of the BENEFIT RECEIVED by the donor in a quid pro quo, not the size of the gift.

**Note:** TRIGGER CORRECTED. Pass A's data dictionary described this as 'gifts over $2,500', which misstates the enacted rule. The exposure and the exemption arrive together, so California has no exemption-free donor period.



### Connecticut (CT)

**CT-01 — oversight_report, opens, 1989** _(enacted)_

Foundations supporting state agencies and institutions must report a schedule of items to the legislature; the filing is a public record.

> 1989 Conn. Act Concerning Private Foundations Established For the Benefit of State Agencies and Institutions; Conn. Gen. Stat. ss. 4-37e to 4-37j  
> https://www.cga.ct.gov/current/pub/chap_047.htm

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: state_filing · Covers: all_public*

**To verify:** Read ss. 4-37f and 4-37g. Note the $1.5M UConn endowment threshold and that 4-37g gives the Auditors of Public Accounts backup audit authority.

**Note:** Both passes independently moved Connecticut from the seed's 2017 to 1989 -- one of three blind test cases, all of which converged.


**CT-02 — donor_identity, opens, 2017-07-01** _(effective)_

Donor identity becomes reportable, but only for gifts made on or after July 1, 2017, and not where the donor requested non-disclosure.

> Conn. Gen. Stat. s. 4-37f(9)(K), as amended 2017  
> https://codes.findlaw.com/ct/title-4-management-of-state-agencies/ct-gen-st-sect-4-37f/

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: state_filing · Covers: system*

**To verify:** Read s. 4-37f(9)(K). The grandfather clause is explicit: nothing requires disclosure of a donor who gave or committed 'prior to July 1, 2017'.

**Note:** PROSPECTIVE ONLY, so exposure phases in with the donor cohort rather than switching at a date. Any donor-margin treatment for Connecticut must use 2017, not the 1989 oversight date.



### Delaware (DE)

**DE-01 — records_route, closes, no date established**

University activities are excluded from 'public body', 'public record' and 'meeting', except the Boards of Trustees, full Board meetings, and documents relating to the expenditure of public funds.

> 29 Del. C. s. 10002(l)  
> https://law.justia.com/codes/delaware/2021/title-29/chapter-100/section-10002/

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read subsection (l). Foundations are not mentioned at all, so they fall outside a fortiori. Note this is unusually broad: the UNIVERSITIES themselves are largely outside FOIA.

**Note:** No date established for the carve-out.



### Florida (FL)

**FL-01 — oversight_report, opens, no date established**

Direct-support organization records are confidential and exempt except the auditor's report, management letter, records of state-fund expenditure, and financial records of private-fund travel; anonymous donors are protected in the auditor's report.

> Fla. Stat. s. 1004.28(5)  
> https://www.flsenate.gov/Laws/Statutes/2025/1004.28

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read subsection (5). Note the section was recodified in 2002 from s. 240.299; the dates of the individual access exceptions were not traced by either pass.

**Note:** PASSES DISAGREE ON THE LABEL: pass A reads a short carve-out from a confidentiality rule as oversight (Direct); pass B reads the transaction records as record access (Explicit). Not a donor-margin difference.



### Georgia (GA)

**GA-01 — records_route, opens, 2003-11-19** _(issued)_

The Attorney General takes the position that the UGA Foundation is subject to the state open records and open meetings laws.

> Letter, Att'y Gen. Thurbert E. Baker to counsel for the University of Georgia Foundation (Nov. 19, 2003)  
> https://law.georgia.gov/press-releases/2004-03-09/attorney-general-baker-announces-victory-open-government

*Evidence: unofficial secondary source · Support: both passes · Binding: 1/4 · Custodian: foundation · Covers: all_public*

**To verify:** The letter itself has not been located by either pass. The Reporters Committee account of it is quoted at footnote 92 of Capeloto (2013). The AG's own March 9, 2004 press release, linked here, records the follow-through. Treat the 2003 date as the start of an enforcement posture, not as a formal opinion.

**Note:** WEAK LEG. Both passes flag that this is an informal letter, expressly not an official opinion of the office. A Feb. 26, 2004 letter threatened suit under the Open Meetings Act; the March 2004 press release announces compliance.


**GA-02 — donor_identity, closes, 2005** _(inferred default rule)_

Records of public postsecondary institutions and their associated foundations containing personal information about donors become exempt, subject to a business-transaction carve-back.

> Ga. L. 2005, p. 1133, s. 1/HB 340, amending O.C.G.A. s. 50-18-72  
> https://dlg.usg.edu/record/dlg_ggpd_y-ga-bl411-pr4-bs1-bh5-b2005-belec-p-btext

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Three checks. (1) In any annotated copy of O.C.G.A. s. 50-18-72, read the amendment history line: it carries 'Ga. L. 2005, p. 1133, s. 1/HB 340'. (2) The linked Georgia Senate Research Office 2005 session summary describes HB 340 as legislation that exempts donor information to postsecondary educational institutions and foundations from public disclosure. (3) The Wayback Machine copy of the state's own ganet.org code service, current through the 2001 session, contains no postsecondary donor exemption in s. 50-18-72: http://web.archive.org/web/2004/http://www.ganet.org/cgi-bin/pub/ocode/ocgsearch?number=50-18-72

**Note:** RESOLVED AGAINST PASS A. Pass A originally dated this exemption to HB 397 (2012); that was wrong. Residual gaps: the enrolled act was not read, so the July 1 2005 effective date is inferred from O.C.G.A. s. 1-3-4's default rule; and the archived code service was frozen at the 2001 session, so it cannot by itself exclude the 2002-2004 amendments.


**GA-03 — donor_identity, codifies, 2012-04-17** _(effective)_

The donor exemption is recodified at O.C.G.A. s. 50-18-72(a)(29) in the general open-records rewrite; it is not created here.

> Ga. L. 2012, p. 218, s. 2/HB 397  
> https://law.georgia.gov/key-issues/open-government/hb-397-georgias-updated-sunshine-laws

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Compare the pre-2012 paragraph number (a)(19) with the post-2012 (a)(29) in any two dated copies of s. 50-18-72. The substantive text of the donor paragraph is materially unchanged; whether the $10,000 transaction threshold moved requires comparing enacted versions, which neither pass did.

**Note:** Pass A's narrative had called 2012 a narrowing while its own data field was blank. The blank field was right.



### Hawaii (HI)

**HI-01 — records_route, closes, 2007-12-21** _(decided)_

A nonprofit corporation supporting public operations is not an agency subject to the UIPA.

> 'Olelo: The Corporation for Community Television v. Office of Information Practices, 116 Hawai'i 337 (Haw. Dec. 21, 2007)  
> https://caselaw.findlaw.com/court/hi-supreme-court/1361318.html

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the holding. NOTE THE ENTITY: 'Olelo is a community-television corporation, NOT a university foundation, so Hawaii's coding rests on analogy.

**Note:** Pass B moved Hawaii to Unknown on this ground; pass A kept None. Neither is a donor-margin finding.



### Idaho (ID)

**ID-01 — oversight_report, opens, no date established**

Foundations are not subject to the Idaho Public Records Law, but must deliver an annual reporting package to the institution's chief executive; donor confidentiality is preserved.

> Idaho State Board of Education Governing Policies and Procedures s. V.E (Gifts and Affiliated Foundations)  
> https://boardofed.idaho.gov/board-policies-rules/board-policies/financial-affairs-section-v/v-e-gifts-and-affiliated-foundations/

*Evidence: original read by the independent second pass · Support: both passes · Binding: 1/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read s. V.E. The policy states outright that foundations are not subject to the Public Records Law and only ENCOURAGES openness; the mandatory element is the reporting package.

**Note:** CITATION CORRECTED: Andrew's note and pass A's first draft cited s. V.M, which is intellectual property. Board policy, revisable without legislation.



### Illinois (IL)

**IL-01 — records_route, opens, 2017-05-09** _(decided)_

Records of a community-college foundation performing a governmental function on the college's behalf are subject to FOIA under section 7(2); the foundation is NOT a subsidiary public body.

> Chicago Tribune Co. v. College of DuPage, 2017 IL App (2d) 160274 (May 9, 2017)  
> https://www.illinoiscourts.gov/Resources/74545b26-a95f-40e8-beaf-91eef5cbb3cb/2160274.pdf

*Evidence: original read by the independent second pass · Support: both passes · Binding: 3/4 · Custodian: foundation · Covers: appellate_district*

**To verify:** Read the holding. The court expressly declines to find the foundation a subsidiary public body and instead reaches the records through section 7(2).

**Note:** Second District precedent. Originating institution is a community college, which matters for the paper's 2-year contamination checks.



### Indiana (IN)

**IN-01 — records_route, closes, 1995** _(decided)_

The IU Foundation is not a public agency, because it is not subject to State Board of Accounts examination.

> State Board of Accounts v. Indiana Univ. Foundation, 647 N.E.2d 342 (Ind. Ct. App. 1995)  
> https://law.justia.com/cases/indiana/court-of-appeals/1995/28a01-9402-cv-52-8.html

*Evidence: original read by the independent second pass · Support: both passes · Binding: 3/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion. It records a 1990 AG opinion to the contrary, the Foundation's refusal, and the Foundation's SUCCESSFUL declaratory action below -- so there was no interval of actual openness between 1990 and 1995.

**Note:** PASS A WITHDREW its asserted 1990-1995 open interval on pass B's reading. The 1990 AG opinion itself has not been retrieved. Pass B notes other public-agency theories were not decided.



### Iowa (IA)

**IA-01 — records_route, opens, 2005-02-11** _(decided)_

A private foundation soliciting and managing donations for a state university performs a government function, so its records are public records.

> Gannon v. Board of Regents, 692 N.W.2d 31 (Iowa 2005)  
> https://caselaw.findlaw.com/court/ia-supreme-court/1433071.html

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion's disposition. Note footnote 3, which expressly RESERVES whether individual records are confidential — the decision opens a route, it does not adjudicate donor confidentiality.

**Note:** Pass B's footnote-3 point is why the 'one year of donor openness' framing was withdrawn.


**IA-02 — donor_opt_out, closes, 2006-07-01** _(effective)_

Donor identity becomes confidential where the donor has requested anonymity, except for gifts from publicly held business corporations; gift amount, date, purpose and restrictions are expressly preserved.

> Iowa Code s. 22.7(52), added by 2006 Iowa Acts ch. 1127, s. 1 (H.F. 2706, approved May 24, 2006)  
> https://www.legis.iowa.gov/docs/code/22.7.pdf

*Evidence: original read by this pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** In the linked code PDF, read s. 22.7(52)(a)(5): identity is protected 'when such donor has requested anonymity in connection with the gift or pledge', and the subparagraph 'does not apply to a gift or pledge from a publicly held business corporation.' Bill history for H.F. 2706 at https://www.legis.iowa.gov/legislation/billTracking/billHistory?billName=HF+2706&ga=81

**Note:** CITATION CORRECTED. Pass A first cited 2006 Acts ch. 1117, which is insurance legislation. Pass B supplied ch. 1127. Bonfield's Sept. 6 2007 presentation to the legislative interim committee links the amendment to Gannon, which evidences a legislative response without establishing collective motive.



### Kansas (KS)

**KS-01 — records_route, closes, 1982** _(issued)_

A university endowment association is a separate entity whose records are not subject to KORA.

> Kan. Att'y Gen. Op. No. 82-172 (Wichita State Univ. Endowment Ass'n)  
> https://www.ag.ks.gov/divisions/administration/open-government/kora-faq

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: this pass only · Binding: 1/4 · Custodian: foundation · Covers: named_entity*

**To verify:** The opinion itself was not retrieved. The AG's KORA guidance at the link states the act does not apply to private associations.

**Note:** Pass B instead classifies Kansas Direct on K.S.A. 76-721 and Kansas State PPM ch. 3270 (annual CPA audits from affiliates), which is an oversight finding, not a donor one.



### Kentucky (KY)

**KY-02 — donor_identity, closes, no date established**

A university foundation may withhold the identities of ALL donors, not merely those requesting anonymity, on a privacy balance under KRS 61.878(1)(a).

> Cape Publications, Inc. v. Univ. of Louisville Foundation, Inc. (Ky. Ct. App.); KRS 61.878(1)(a); KRS 61.791  
> https://www.courtlistener.com/opinion/1875561/cape-publications-inc-v-university-of-louisville-foundation-inc/

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: second pass only · Binding: 3/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion's treatment of the privacy exemption. Its date was not pinned by either pass, which is why this row carries no year.

**Note:** NO DATE. Kentucky is the clearest case of foundation access WITHOUT donor access. KRS 61.791 (Personal Privacy Protection Act) separately defines protected information to include any compilation identifying a nonprofit donor.


**KY-01 — records_route, opens, 1992** _(decided)_

A university foundation is a public agency within KRS 61.870(1) and subject to the Open Records Act.

> Frankfort Publishing Co. v. Kentucky State Univ. Foundation, Inc., 834 S.W.2d 681 (Ky. 1992) (rehearing denied Sept. 24, 1992)  
> https://www.courtlistener.com/opinion/5254875/frankfort-publishing-co-v-kentucky-state-university-foundation-inc/

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion. It reverses the Court of Appeals and restores the circuit court's holding that the Foundation is a public agency.

**Note:** DATE CORRECTED from the seed's 1985; no 1985 authority was located by either pass. Pass B reports an unretrieved 1989 AG candidate and separate SUNY-style reporting from 1982 -- both unresolved. The redate decides Kentucky's status in the 990 panel, since 1985 precedes it and 1992 does not.



### Louisiana (LA)

**LA-01 — oversight_report, opens, 1992** _(enacted)_

Foundations are declared private and outside the public records law, but their financial affairs must be audited annually with copies furnished to the legislative auditor, and public-funds records remain subject to the records law.

> La. R.S. 17:3390(C), (D), (F) (Acts 1992, No. 1055)  
> https://www.legis.la.gov/legis/LawPrint.aspx?d=80751

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: state_filing · Covers: all_public*

**To verify:** Read subsections C, D and F. C keeps public-funds records subject to R.S. 44:1; D requires the annual audit to the legislative auditor; F makes records of payments over $1,000 to public employees public.

**Note:** PASSES DISAGREE ON THE LABEL. Pass A reads this as oversight with a carve-out (Direct); pass B reads the public-fund record access as record access (Explicit) and dates it to State ex rel. Guste v. Nicholls College Foundation, 564 So. 2d 682 (La. June 28, 1990). Neither reading involves donor exposure.



### Maryland (MD)

**NULL-01 — donor_identity, none, no date established**

No authority establishes whether Maryland university foundations are subject to the Public Information Act, and no donor-margin rule was located.

> Md. AG Public Information Act Manual; Baltimore Development Corp. v. Carmel Realty Associates, 395 Md. 299 (2006)  
> https://www.rcfp.org/open-government-guide/maryland/

*Evidence: ORIGINAL NOT RETRIEVED · Support: both passes · Binding: 0/4*

**To verify:** Both passes searched for a PIA Compliance Board decision, an Open Meetings Compliance Board opinion and case law on university foundations, and found none. Carmel Realty supplies a sufficient-nexus test under which foundations MIGHT qualify.

**Note:** Maryland is the LARGEST control state in the primary sample and rests on no authority at all. Pass A moved it from None to Unknown; pass B to Direct on COMAR 13B.07.02.05 (community-college foundation audits).



### Massachusetts (MA)

**MA-01 — oversight_report, opens, no date established**

Each foundation must provide an annual GAAP financial report to the institution's trustees, and that report is a public record on receipt; the state auditor may audit transfers, expenditures and staffing; the foundation is not an agency.

> M.G.L. c. 15A, s. 37(f), (g), (h)  
> https://malegislature.gov/Laws/GeneralLaws/PartI/TitleII/Chapter15A/Section37

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: state_filing · Covers: all_public*

**To verify:** Read subsections (f), (g) and (h). Anonymous donors are protected in all audit reports.

**Note:** Both passes moved Massachusetts from the seed's Unknown to Direct. No date established. Oversight, not donor exposure.



### Michigan (MI)

**MI-01 — records_route, opens, 1996-01-19** _(decided)_

A university foundation primarily funded by the university (over 50%) is a public body under FOIA, and a public body under the Open Meetings Act where empowered to exercise proprietary authority.

> Jackson v. Eastern Michigan Univ. Foundation, 215 Mich. App. 240, Docket No. 168185 (Jan. 19, 1996)  
> https://www.courtlistener.com/opinion/1991430/jackson-v-eastern-michigan-university-foundation/

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 3/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the funding analysis applying the Kubick 'primarily funded' test. COVERAGE IS CONDITIONAL: an independently endowed foundation may fall outside the holding.

**Note:** Michigan's FOIA privacy provision creates no blanket donor-name exemption; corporate donor names may be withheld case by case on a balancing test.



### Minnesota (MN)

**MN-01 — donor_identity, opens, no date established**

Donor names and gift ranges held by the University of Minnesota and MnSCU are public data; specified prospect-research and gift-detail data are private.

> Minn. Stat. s. 13.792  
> https://www.revisor.mn.gov/statutes/cite/13.792

*Evidence: original read by this pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read the final sentence of s. 13.792: 'Names of donors and gift ranges are public data.' Then read s. 13.02 subds. 7a, 11 and 17 -- foundations are not made subject to chapter 13 by this section.

**Note:** CORRECTED AGAINST PASS A. Pass A quoted that final sentence in its own appendix and then coded donor identity as 0. This is an INSTITUTION-route rule; foundation coverage remains untested, which is why pass A classifies Minnesota Unknown.



### Mississippi (MS)

**MS-01 — oversight_report, opens, no date established**

Foundations must obtain annual CPA audits and submit audited financial statements to the institutional executive officer and the IHL Board, certify annually on donor records, and report specified events; donor identity and cultivation strategies are protected.

> 8 Miss. Code R. s. 3-5-301.0806  
> https://www.law.cornell.edu/regulations/mississippi/8-Miss-Code-R-SS-3-5-301-806

*Evidence: original read by this pass · Support: both passes · Binding: 1/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the regulation's audit, certification and reportable-event provisions, and its confidentiality protection for donor identity. Note this is BOARD REGULATION, revisable without legislation, and carries no first-adoption date.

**Note:** Both passes moved Mississippi from the seed's None to Direct. This is oversight WITHOUT donor exposure, so it does not contaminate a donor control.



### Missouri (MO)

**MO-01 — records_route, opens, no date established**

The Sunshine Law's 'quasi-public governmental body' definition may reach some university foundations; no foundation-specific determination was located.

> Mo. Rev. Stat. s. 610.010(4)  
> https://revisor.mo.gov/main/OneSection.aspx?section=610.010

*Evidence: original read by this pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the credit line at the foot of s. 610.010: L. 1973 S.B. 1, A.L. 1977, 1978, 1982, 1987, 1993, 1998, 2004. It does NOT attribute the quasi-public definition to any one amendment, which is why this row has no date.

**Note:** NO DATE, and both passes failed to pin it. The seed's 1973 is the Sunshine Law's enactment, not this definition. Pass A moved Missouri to Unknown in round 2 on pass B's argument; the candidate amendment years 1993, 1998 and 2004 all fall inside the 990 panel.



### Nevada (NV)

**NV-01 — records_route, opens, 1993-07-13** _(enacted)_

University foundations must comply with the open meeting law and make records public, with contributor identity and amount excepted in the same section.

> 1993 Nev. Stat. ch. 626 (S.B. 322), approved July 13, 1993; NRS 396.405  
> https://www.leg.state.nv.us/statutes/67th/Stats199312.html

*Evidence: original read by the independent second pass · Support: second pass only · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read section 1 of the session law. The openness rule and the contributor exceptions were enacted TOGETHER, so Nevada has no exemption-free donor period.

**Note:** CLOSED A PASS A OPEN ITEM. Pass A had the statute content but could not confirm the year.



### New Jersey (NJ)

**NJ-01 — records_route, opens, 2013-05-28** _(decided)_

A university foundation created as an instrumentality of the university is a public agency for OPRA purposes.

> Dusenberry v. New Jersey City Univ. Foundation, GRC Complaint No. 2012-82, final decision May 28, 2013  
> https://www.nj.gov/grc/decisions/pdf/2012-82.pdf

*Evidence: original read by this pass · Support: both passes · Binding: 2/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read finding 1 on the first page. Note finding 2 separately dismisses the request as overly broad, so the requester lost on the facts while the agency-status holding stands. The decision was distributed June 5, 2013.

**Note:** DATE CORRECTED. '2012-82' is the COMPLAINT number, filed March 28, 2012; the seed file used 2012 as the year. Both passes independently reached 2013.



### New Mexico (NM)

**NM-01 — records_route, opens, 2018-06-26** _(decided)_

The district court orders the UNM Foundation to produce records under IPRA.

> Libit v. UNM Foundation, No. D-202-CV-2017-01620 (N.M. 2d Jud. Dist. Ct. June 26, 2018)  
> https://coa.nmcourts.gov/wp-content/uploads/sites/43/2023/11/April-21-2022-Daniel-Libit-v.-University-of-New-Mexico-Lobo-Club-No.-A-1-CA-38255.pdf

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: second pass only · Binding: 2/4 · Custodian: foundation · Covers: named_entity*

**To verify:** The trial order itself was not retrieved. The 2022 Court of Appeals opinion linked here reports and affirms it in its background section. Bound the named parties only.

**Note:** FOUND BY PASS B. Pass A uses 2022 as the primary date because that is when the holding became appellate precedent; 2018 is recorded as the alternative. Genuine judgement call, not a factual dispute.


**NM-02 — records_route, confirms, 2022-04-21** _(decided)_

Records held by private entities on behalf of public bodies are public records under IPRA, and NMSA s. 6-5A-1(D) is not a valid IPRA exemption.

> Libit v. Univ. of N.M. Lobo Club, No. A-1-CA-38255 (N.M. Ct. App. Apr. 21, 2022); cert. quashed, S-1-SC-39396 (Sept. 27, 2023)  
> https://coa.nmcourts.gov/wp-content/uploads/sites/43/2023/11/April-21-2022-Daniel-Libit-v.-University-of-New-Mexico-Lobo-Club-No.-A-1-CA-38255.pdf

*Evidence: original read by the independent second pass · Support: both passes · Binding: 3/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the opinion's treatment of s. 6-5A-1(D). Note the Supreme Court QUASHED certiorari on Sept. 27, 2023 rather than deciding, so the Court of Appeals holding stands. The seed file's 2023 date is the quashing, not a merits ruling.

**Note:** Pass B notes the opinion expressly reserves functional coverage, donor-record and First Amendment issues.



### New York (NY)

**NY-02 — records_route, opens, 1988-02-26** _(decided)_

A community-college foundation was held subject to FOIL.

> Eisenberg v. Goldstein (N.Y. Sup. Ct., Kings County, Feb. 26, 1988), as quoted in FOIL-AO-12685  
> https://docs.dos.ny.gov/coog/ftext/f12685.htm

*Evidence: ORIGINAL NOT RETRIEVED · Support: second pass only · Binding: 2/4 · Custodian: foundation · Covers: named_entity*

**To verify:** THE ORIGINAL ORDER HAS NOT BEEN RETRIEVED BY EITHER PASS. It is known only through the Committee's quotation of it in the linked advisory opinion. Later Farmingdale and Buffalo decisions reached negative results on other entities.

**Note:** DO NOT USE AS A DATED EVENT without retrieving the order. Recorded because pass B raised it and pass A's claim that New York has 'no court case' was too strong.


**NY-01 — records_route, opens, 2007-10-30** _(issued)_

The Stony Brook Foundation is subject to FOIL because it would not exist but for its relationship with the university.

> N.Y. Comm. on Open Government Advisory Opinion FOIL-AO-16851 (Oct. 30, 2007)  
> https://docs.dos.ny.gov/coog/ftext/f16851.htm

*Evidence: original read by this pass · Support: both passes · Binding: 1/4 · Custodian: foundation · Covers: named_entity*

**To verify:** Read the opinion. Note it OVERRIDES Stony Brook's own determination that the Foundation was not a state agency, which shows institutions resist these opinions. Advisory opinions are not binding.

**Note:** The seed's 2001 date comes from FOIL-AO-12685 (May 25, 2001), which concerns Health Research Inc. and the SUNY RESEARCH Foundation -- sponsored-research entities, not gift foundations. Pass A moved New York to Unknown on the records question; pass B moved it to Direct on SUNY Policy 9600. Both agree New York cannot carry a single statewide absorbing indicator.



### North Carolina (NC)

**NC-01 — oversight_report, opens, 2005** _(enacted)_

Covered nonprofit boards must secure audits and transmit annual audit reports to the Board of Governors.

> N.C.G.S. s. 116-30.20 (hist. S.L. 2005-276, s. 9.22)  
> https://www.ncleg.gov/EnactedLegislation/Statutes/HTML/BySection/Chapter_116/GS_116-30.20.html

*Evidence: original read by the independent second pass · Support: second pass only · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the section and its history note. Pass B separately cites UNC Policy 600.2.5 (1990), under which chancellors must REQUEST foundation audits annually and treat those received as public records -- a weaker duty.

**Note:** FOUND BY PASS B. Oversight, not donor exposure.


**NC-02 — donor_identity, closes, 2025-12-01** _(effective)_

Donor-identifying information of nonprofits is protected, subject to enumerated exceptions including a statutory-disclosure exception for public-agency affiliates.

> N.C. Personal Privacy Protection Act, S.L. 2025-79, ss. 55A-18-03 to -06, eff. Dec. 1, 2025  
> https://www.ncleg.gov/EnactedLegislation/SessionLaws/HTML/2025-2026/SL2025-79.html

*Evidence: original read by the independent second pass · Support: second pass only · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read ss. 55A-18-03 to -06 and section 2 for the effective date.

**Note:** OUTSIDE BOTH PANELS (IPEDS ends FY2024, Form 990 ends FY2021) and cannot be projected backward. Recorded because it is part of a national post-2021 trend of Personal Privacy Protection Acts, alongside Kentucky's KRS 61.791.



### North Dakota (ND)

**ND-01 — donor_identity, closes, no date established**

Donor and prospective-donor identifying information held by the board of higher education, the university system or an affiliated nonprofit is exempt.

> N.D.C.C. s. 44-04-18.15(1)  
> https://ndlegis.gov/cencode/t44c04.pdf

*Evidence: original read by this pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** The provision is quoted and APPLIED in AG Opinion 2009-O-08 (see ND-02), which proves it was already in force by June 2009. Its original enactment year was not established by either pass; the code PDF linked here carries no source line.

**Note:** NO DATE. This is why pass A's claim that North Dakota opened in 2013 and narrowed in 2017 was withdrawn: the donor exemption already existed in 2009, so there is no verified donor-open interval.


**ND-02 — records_route, opens, 2009-06-15** _(issued)_

The UND Alumni Association and UND Foundation violated the open records law by refusing a contract; donor records specifically remain exempt.

> N.D. Att'y Gen. Open Records and Meetings Opinion 2009-O-08 (June 15, 2009)  
> https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2009-O-08.pdf

*Evidence: original read by this pass · Support: second pass only · Binding: 2/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the CONCLUSION: 'The Alumni Association and UND Foundation violated N.D.C.C. s. 44-04-18 by failing to provide a copy of a software vendor contract.' Then read the paragraph before it, which cites s. 44-04-18.15 at footnotes 17-18 and notes the contract contained no donor information.

**Note:** FOUND BY PASS B, READ BY PASS A. Moved the coding from 2013 to 2009 and, on reading, withdrew pass A's 2017 narrowing claim. A campus gift foundation, not a research entity.


**ND-03 — records_route, confirms, 2013-06-25** _(issued)_

The North Dakota University System Foundation is a public entity, subject to open records and open meetings.

> N.D. Att'y Gen. Open Records and Meetings Opinion 2013-O-10 (June 25, 2013)  
> https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2013-O-10.pdf

*Evidence: original read by this pass · Support: both passes · Binding: 2/4 · Custodian: foundation · Covers: system*

**To verify:** Read the CONCLUSION and footnote 25 ('Because the Foundation is a public entity, it is also subject to open meeting laws'). Note NDUS counsel had argued the opposite and was overruled.

**Note:** Concerns the small system foundation, not the large campus gift foundations. Pass B supplied 2014-O-04 and 2014-O-07 reaching the Dickinson and NDSU development foundations.



### Ohio (OH)

**OH-01 — records_route, opens, 1992-12-16** _(decided)_

A nonprofit acting as the major gift-receiving arm of a public university is a public office subject to the public records law.

> State ex rel. Toledo Blade Co. v. Univ. of Toledo Foundation, 65 Ohio St. 3d 258, 602 N.E.2d 1159 (1992)  
> https://www.leagle.com/decision/199232365ohiost3d2581272

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the syllabus. Paragraph 1 holds the foundation a 'public office' under R.C. 149.011(A).


**OH-02 — donor_identity, opens, 1992-12-16** _(decided)_

The names of donors to such a foundation are public records and are not subject to any exception.

> State ex rel. Toledo Blade Co. v. Univ. of Toledo Foundation, 65 Ohio St. 3d 258 (1992); R.C. 149.43(A)(1)(n)  
> https://codes.ohio.gov/ohio-revised-code/section-149.43

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Two steps. (1) The syllabus holds donor names are public records not subject to any exception, and the court declined to create a common-law donor exemption. (2) In the linked current code, read the definition of 'donor profile record': it covers records about donors 'except the names and reported addresses of the actual donors and the date, amount, and conditions of the actual donation' — i.e. the later exemption preserves disclosure of names and amounts.

**Note:** CORRECTED AGAINST PASS A. Pass A originally coded Ohio donor identity as NOT disclosable, reading the donor-profile exemption as closing it. The exemption's own text says the opposite.



### Oklahoma (OK)

**OK-01 — oversight_report, opens, no date established**

An institution may not receive anything of value from a foundation with overlapping officers unless the foundation opens all financial records and work papers to the institution's auditors, donor names excepted.

> 70 O.S. s. 4306(D); 51 O.S. s. 24A.16a  
> https://law.justia.com/codes/oklahoma/2014/title-51/section-51-24a.16a/

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read 4306(D) for the auditor-access condition and 24A.16a for the donor confidentiality. NOTE: this is AUDITOR access, not public access.

**Note:** ONSET WITHDRAWN. The seed's 1973 is the year of an AG opinion on the Foundation's PRIVATE status, which does not date the 4306(D) duty. Both passes agree 1973 is wrong; neither established the correct year.



### Oregon (OR)

**OR-01 — records_route, opens, 1988-04-22** _(issued)_

PSU Foundation budgets prepared or used by university officials are public records; the foundation itself is not a public body.

> Or. Att'y Gen., Peter Murphy order (Apr. 22, 1988), summarised in the 2019 Public Records and Meetings Manual, App. E  
> https://www.doj.state.or.us/wp-content/uploads/2019/07/public_records_and_meetings_manual.pdf

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: second pass only · Binding: 1/4 · Custodian: institution · Covers: named_entity*

**To verify:** Appendix E, p. E-4 of the linked AG manual. Note the order distinguishes university-held documents from the foundation's own records.

**Note:** PASS A WITHDREW its asserted 1988-2010 donor-open interval on this evidence: 1988 was never a blanket opening.


**OR-02 — donor_identity, closes, 2010** _(issued)_

Gift letters are not public records and foundations are not public bodies.

> Or. Att'y Gen. opinion (2010); ORS s. 192.345(24), (25)  
> https://oregon.public.law/statutes/ors_192.345

*Evidence: ORIGINAL NOT RETRIEVED · Support: both passes · Binding: 1/4 · Custodian: foundation · Covers: all_public*

**To verify:** THE 2010 OPINION HAS NOT BEEN RETRIEVED BY EITHER PASS. The statutory donor exemptions at ORS 192.345(24) and (25) are readable at the link and are conditional exemptions, not absolute.

**Note:** Recorded because Andrew's note relies on it, but it should not be used as a dated event without retrieval.



### Pennsylvania (PA)

**PA-01 — records_route, opens, 2010-05-24** _(decided)_

Fundraising records of a foundation established solely to raise funds for a state-owned university, including meeting minutes, are subject to the Right-to-Know Law.

> East Stroudsburg Univ. Foundation v. Office of Open Records, 995 A.2d 496 (Pa. Commw. Ct. May 24, 2010)  
> https://law.justia.com/cases/pennsylvania/commonwealth-court/2010/886cd09-5-24-10.html

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 3/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the Commonwealth Court opinion's disposition. Then note the Pennsylvania Supreme Court denied allocatur on March 16, 2011 — the date pass A and the seed file originally used.

**Note:** Pass A redated 2011 -> 2010 in round 1; pass B independently reached 2010. Pass B additionally notes a 2009 administrative order preceding the merits appeal.



### Rhode Island (RI)

**RI-01 — donor_identity, closes, no date established**

Records disclosing the identity of a charitable contributor to a public body are exempt where the contributor requested anonymity.

> R.I. Gen. Laws s. 38-2-2(4)(G)  
> https://webserver.rilegislature.gov/Statutes/TITLE38/38-2/38-2-2.htm

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read exemption (G). It applies to a contribution 'to the public body' -- URI itself is squarely subject to APRA; the Foundation's status is untested.

**Note:** INSTITUTION ROUTE. Pass B marks Rhode Island UNRESOLVABLE on foundation applicability.



### South Carolina (SC)

**SC-01 — records_route, opens, 1991-02-11** _(decided)_

A foundation operated for a state university's benefit is a public body under the SC FOIA because it receives support in whole or in part from public funds.

> Weston v. Carolina Research and Development Foundation, 303 S.C. 398, 401 S.E.2d 161 (Feb. 11, 1991)  
> https://law.justia.com/cases/south-carolina/supreme-court/1991/23341-2.html

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the holding on the public-funds trigger. Public funds were read broadly: university property sale proceeds, federal and local grants, research contract funds.

**Note:** Pass B notes the named entity is a research and development foundation, warranting a philanthropic-only sensitivity check.



### Texas (TX)

**TX-01 — donor_identity, opens, 1991-07-03** _(issued)_

Donor names and gift amounts held by a public university are not within any exception to the Texas Open Records Act.

> Tex. Att'y Gen. Open Records Decision No. 590 (July 3, 1991) (RQ-2183)  
> https://www.texasattorneygeneral.gov/sites/default/files/ord-files/ord/2020/ord19910590.pdf

*Evidence: original read by this pass · Support: both passes · Binding: 2/4 · Custodian: institution · Covers: all_public*

**To verify:** Open the PDF and read the SUMMARY on the final page. It should read: 'Information identifying donors or pledgers, and amounts of donations and pledges, including outstanding pledges, to a public university is not within an exception to the Texas Open Records Act.'

**Note:** The request concerned West Texas State University's 'Shared Visions' campaign, jointly run by the university and its Development Foundation. The records were held by the UNIVERSITY. Both passes agree this does not hold that every separate Texas foundation is a governmental body.


**TX-02 — donor_identity, closes, 2003-06-20** _(effective)_

Donor identity at an institution of higher education becomes excepted from disclosure; gift amounts expressly remain disclosable.

> Tex. Gov't Code s. 552.1235, added by Acts 2003, 78th Leg., ch. 1266, s. 4.07, eff. June 20, 2003  
> https://statutes.capitol.texas.gov/SOTWDocs/GV/pdf/GV.552.pdf

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** In the linked code PDF, find s. 552.1235. Subsection (a) excepts information identifying a donor; subsection (b) states that subsection (a) 'does not except from required disclosure other information relating to gifts, grants, and donations ... including the amount or value of an individual gift, grant, or donation.' The source note at the end of the section carries the 2003 act.

**Note:** This is the single cleanest reversal in the data and it separates the two margins: identity closes, amounts stay open, same state, same year.



### Untested states (AK, DC, ME, MT, NE, NH, SD, VT, WY) (ZZ)

**NULL-02 — donor_identity, none, no date established**

No authority establishes foundation coverage or any donor-margin rule in these nine jurisdictions.

> Conn. OLR Report 2014-R-0217 (New England survey); per-state citations in data/transparency_classifications.csv  
> https://www.cga.ct.gov/2014/rpt/2014-R-0217.htm

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 0/4*

**To verify:** The Connecticut OLR report surveys institutionally related foundations for New England public universities and reports that New England FOI laws generally do not address university foundations and that NO court cases were found interpreting them. For the non-New England states, both passes searched for foundation authority, oversight regimes and donor provisions independently and found none.

**Note:** AGGREGATE ROW covering nine jurisdictions, recorded so the appendix is complete. Pass B classifies several of these Direct on governing-board policies (see data/state_law_review/agent_output/legal_events_chatgpt.csv); none of those is a donor-margin rule.



### Utah (UT)

**UT-01 — donor_identity, closes, no date established**

Donor names held by a governmental entity are protected records where the donor requests anonymity; gift terms, restrictions and privileges are expressly preserved from that protection.

> Utah Code s. 63G-2-305(37)  
> https://law.justia.com/codes/utah/title-63g/chapter-2/part-3/section-305/

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read subsection (37). Note the express preservation of terms and restrictions.

**Note:** CORRECTS ANDREW, whose note says Utah has no donation exemption. INSTITUTION ROUTE; foundation coverage untested. Pass B marks Utah UNRESOLVABLE on that ground.



### Virginia (VA)

**VA-01 — records_route, closes, 2019-12-12** _(decided)_

A public university foundation is a private corporation, not a public body, and is not subject to FOIA.

> Transparent GMU v. George Mason Univ. Foundation, 298 Va. 222 (Dec. 12, 2019)  
> https://www.vpm.org/news/2019-12-12/va-supreme-court-says-university-foundations-dont-have-to-disclose-donor/

*Evidence: official secondary source (legislative summary, AG manual, annotated code) · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Unanimous, with no path to appeal. This is the authority that makes Virginia's seed coding of 'Explicit' untenable: the state's highest court held the opposite.

**Note:** Both passes independently reclassified Virginia from Explicit to Direct.


**VA-02 — oversight_report, opens, 2020** _(enacted)_

Public institutions must file an annual report of aggregate foundation expenditure percentages by category; the Virginia Community College System is excluded.

> Va. Code s. 23.1-108 (2020 Acts ch. 511)  
> https://law.lis.virginia.gov/vacode/title23.1/chapter1/section23.1-108/

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: state_filing · Covers: 4yr_only*

**To verify:** Read the section and confirm the VCCS exclusion. The report is aggregate PERCENTAGES by category -- no record-level access, no donor information, no gift amounts.

**Note:** COVERAGE CORRECTED. Pass A originally coded Virginia statewide; the VCCS exclusion means Virginia's 2-year institutions are not covered at all.


**VA-03 — gift_terms, opens, 2020** _(enacted)_

Documentation of the terms and conditions of gifts that direct academic decision-making, and of gifts of $1,000,000 or more imposing new obligations, is subject to FOIA.

> Va. Code s. 23.1-1304.1  
> https://law.lis.virginia.gov/vacode/23.1-1304.1/

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read the section. Note the VCCS exclusion in s. 23.1-108 does NOT apply here -- this is a different provision.

**Note:** CORRECTED AGAINST PASS A, which had coded Virginia as exposing nothing about an individual gift. Gift TERMS are exposed even though identity and exact amounts are not.



### Washington (WA)

**WA-01 — donor_identity, closes, no date established**

Records obtained through or concerning a gift are exempt where the TERMS OF THE GIFT restrict public access; the exemption is qualified by the public-records definition.

> RCW 42.56.320(4)  
> https://app.leg.wa.gov/RCW/default.aspx?cite=42.56.320

*Evidence: original read by the independent second pass · Support: passes conflicted; resolved · Binding: 4/4 · Custodian: institution · Covers: all_public*

**To verify:** Read subsection (4). It turns on the gift's own access-restricting terms, NOT on a general donor opt-out.

**Note:** PASS A WITHDREW ITS CODING HERE. Pass A had recorded a general donor-identity opt-out; pass B showed the provision does not establish one, and that the inference to foundations was unproved on top of that. Andrew's note cites RCW 42.56.310, which is the LIBRARY RECORDS section -- a citation error carried into the seed.



### West Virginia (WV)

**WV-01 — records_route, closes, 1989** _(decided)_

The WVU Foundation's financial activity is not subject to the state FOIA; it was not created by legislative mandate and does not use public money, property or employees.

> 4-H Road Community Ass'n v. West Virginia Univ. Foundation, Inc., 182 W. Va. 434, 388 S.E.2d 308 (1989)  
> https://law.justia.com/cases/west-virginia/supreme-court/1989/18858-5.html

*Evidence: original read by the independent second pass · Support: both passes · Binding: 4/4 · Custodian: foundation · Covers: all_public*

**To verify:** Read the holding. It is CONDITIONAL on the creation and funding facts: leases of state-owned buildings and a close working relationship did not defeat private status, but a differently funded foundation could come out otherwise.



### Wisconsin (WI)

**WI-01 — oversight_report, opens, 2017-12-07** _(enacted)_

Required MOU provisions between UW institutions and affiliated foundations include financial information, tiered audit or review requirements, and inspection rights.

> UW System Regent Policy Document 21-9, adopted Dec. 7, 2017  
> https://www.wisconsin.edu/regents/policies/institutional-relationships-with-foundations/

*Evidence: original read by the independent second pass · Support: second pass only · Binding: 1/4 · Custodian: foundation · Covers: system*

**To verify:** Read RPD 21-9 and Appendix A. Pass B notes actual agreement implementation should be checked before assigning unit-level exposure.

**Note:** FOUND BY PASS B. Oversight, not donor exposure. Pass A keeps Wisconsin as None on the records question; the two passes disagree on the label, not on the facts.


