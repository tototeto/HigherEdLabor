# Donation disclosure: legal event inventory and research appendix

Prepared September 22, 2026. Companion dataset: [donation_disclosure_events.csv](donation_disclosure_events.csv).

This appendix documents legal routes through which details of gifts to public higher education and associated foundations can become public. The object of interest is the exposure a donor could anticipate: disclosure of identity, amount, timing, gift language, benefits or influence, and the ability to connect a donor to a particular gift. Legal access is measured separately from actual publication, requests, donor awareness and fundraising outcomes.

The inventory replaces the earlier four-category institutional taxonomy for this purpose. It combines the supplied reconciliation materials with targeted primary-source review. It includes statutes, court and administrative decisions, contractual/public-custodian routes, and oversight rules that help distinguish public gift detail from financial reporting. It is an audited research inventory, not a completed institution-by-year treatment panel or an exhaustive search of all historical state and federal disclosure law. All 50 states and D.C. receive a coverage note below. Missing events or dates are not findings that a jurisdiction was never exposed.

The dataset contains **82 rows and 52 columns**, covering identifiable rules/events in **45 jurisdictions**; the map also documents the other six. Its tiers are: 10 baseline only, 14 candidate, 24 context only, 10 dated access ruling, 6 documented statutory change, 18 rule or ruling without demonstrated donor change. These counts describe inventory entries, not independent shocks, treated states or causally identified events.

## 1. Unit, interpretation and important distinctions

Each CSV row describes a legally distinct rule/event and its covered population and records route. Enactment and effectiveness of the same provision occupy separate date columns rather than duplicate rows. A current baseline has no invented first-adoption date. Related trial, administrative and appellate decisions are retained where timing might matter, linked by IDs, and explicitly distinguished from independent changes. Kentucky’s legacy anonymous donors receive a separate row because their treatment differs from future donors under the same decision.

All field codes are conditional on the row’s entity, custodian, record and legal scope. A public university can hold an accessible copy of an agreement even if its foundation is private. Conversely, a foundation can be covered by records law while donor information is exempt. Government-only access to books is not a public gift-disclosure right. Public annual financial statements are not necessarily public donor lists. A gift’s use or restrictions may be visible without a donor name; a name list may be visible without a linked amount.

The question “is public disclosure legally possible?” needs two distinctions. First, an enforceable right to obtain records differs from permission for a custodian to release them voluntarily. Second, an exception permitting withholding differs from a statutory prohibition on release. The CSV therefore records both field-specific compulsory-access status and the form of withholding. It does **not** interpret every exemption as legal impossibility of publication. Voluntary naming, press coverage, leaks, litigation discovery, federal filings and public announcements are not systematically inventoried here. Nor does a later restriction retract information already public.

The codes describe the cited route and reviewed rule, subject to otherwise applicable law. Even `public` is not a certification that no conceivable privilege or privacy exception could apply. Where only a named type of report is required, `not_required` means that report need not contain the field; it does not mean the field is confidential everywhere. `Protected` similarly refers to the identified route, and the separate withholding field explains whether the authority allows withholding, requires confidentiality or excludes the entity from that route.

## 2. Coding dictionary

### The six disclosure dimensions

| Field prefix | What it measures |
|---|---|
| `identity` | Name or other information identifying a donor, as distinct from confidential donor research/background. |
| `amount` | Exact individual gift/pledge/payment amount unless expressly coded `range_only`; aggregate fundraising totals do not qualify. |
| `gift_date` | Gift, pledge or payment timing; conditions specify when a rule reaches only schedules or some dates. |
| `terms` | Gift agreement language, purpose, conditions, restrictions and obligations; a reported use summary is distinguished from underlying language. |
| `benefits` | Donor benefits, consideration, institutional obligations or influence, including academic control. General spending is not automatically a donor benefit. |
| `linkage` | Ability under this route to associate an identified donor with the same gift’s details. A public name list alone is insufficient. |

Each prefix has `_before` and `_after` columns. For a baseline, `_after` means the observed rule, and `_before` remains unresolved. Before values can be unresolved even when the new statute is verified. New report duties can have `not_required` before values scoped to that newly created duty; this does not establish that no alternative route existed. Court decisions often have `disputed` before values because the previous legal obligation was contested.

| Value | Meaning |
|---|---|
| `public` | The reviewed rule supports public access to the field for covered records; read the scope and exemption qualifications. |
| `opt_out` | Access is reduced by a donor anonymity request/condition; the row describes limits and exceptions. |
| `trigger_only` | Disclosure requires a specified transaction, benefit, threshold or other trigger; not equivalent to ordinary opt-out. |
| `conditional` | Depends on record contents, custody, coverage, redaction, another exemption or a legal test not resolved for every case. |
| `protected` | No compulsory public access to this field under the identified exemption/exclusion; voluntary release status is separate. |
| `range_only` | Gift ranges, rather than exact amounts, are public under the rule. |
| `summary_only` | A summary, such as general use or named positions, is required; full agreement/benefit detail is not established. |
| `not_required` | The specified report/oversight duty does not require this individual gift field for the public. |
| `unresolved` | The reviewed evidence does not establish the field’s substantive status. Never replace this value with zero. |
| `disputed` | Public access was legally contested in the relevant earlier proceeding; not a verified open or closed baseline. |

`change_direction` is a legal interpretation, not an arithmetic difference between field labels. `expansion` means the event adds or vindicates a disclosure route or duty; `restriction` means it narrows a route or adds protection. It does not require that every donor move from open to closed. `no_demonstrated_change` is used for an unchanged donor rule, reaffirmance, or an event that changes spending/oversight without establishing a donor-detail change. `undetermined` means the incremental donor effect cannot be established. The schema permits `mixed`, but no row is assigned that value merely because an act contains openness and confidentiality provisions together. The prior rule must support both directions. Georgia’s trigger can narrow while both categorical field values remain `trigger_only`.

### Complete column guide

| Columns | Meaning and handling |
|---|---|
| `event_id`, `state_code`, `state_name` | Stable inventory key and jurisdiction. Use event IDs to locate the detailed appendix entries. |
| `record_kind`, `event_title`, `authority_type`, `authority_citation` | Legal object and citation. Kinds distinguish statutory changes, access/exclusion rulings, clarifications, baselines, oversight rules and candidates. `authority_type` is a broad label; the full citation controls. |
| `decision_enactment_date`, `decision_date_precision` | Decision/adoption/enactment date when established. Not automatically the operative treatment date. |
| `effective_date`, `effective_date_precision` | Operative date supported by the cited evidence. Year-only values remain year-only; no artificial January 1 dates. |
| `document_version_date`, `timing_notes` | Version observed and dating issues. A policy revision or observation date does not establish first adoption. |
| `covered_entities`, `record_custodian`, `public_access_route`, `coverage_conditions` | Population, holder/request recipient, mechanism and legal predicates. These define the row’s scope. |
| Six `_before` and six `_after` fields | The dimension codes defined above. All 12 are populated with explicit categories. |
| `change_direction`, `change_dimensions` | Direction and affected fields/conditions; pipe-separated dimensions are not separate events. |
| `rule_before`, `rule_after`, `baseline_evidence` | Substantive summaries and support for the earlier state. An older decision is evidence of a prior route, not proof that no intervening authority exists. |
| `anonymity_rule`, `threshold`, `withholding_rule` | Donor choice, monetary/transaction/time thresholds and whether withholding is permitted, required or an effect of noncoverage. These fields contain descriptive text, not numeric scores. |
| `existing_gifts`, `new_gifts` | Grandfathering/retroactivity and prospective reach as established. Absence of a finding is stated explicitly. |
| `donation_relevance` | Donor rule, coverage with conditional donor effect, or oversight context. `oversight_context` is excluded from donor-change counts. |
| `verification`, `source_url`, `source_pinpoint` | Claim-specific provenance, one or more links separated by ` | `, and the section/page/holding to inspect. A current statute is distinguished from an enrolled act and an official summary from an original judgment. |
| `remaining_gap` | Unresolved legal, historical or applicability issue; not a default negative conclusion. |
| `related_event_ids`, `original_inventory_ids`, `appendix_anchor` | Related sequence, crosswalk to the supplied pass-B event inventory, and Markdown anchor. Blank original IDs identify additions in this donor-focused review. |
| `as_of_date` | Review cutoff, not certification that all subsequent history was exhausted. |
| `analysis_tier` | `documented_statutory_change`, `dated_access_ruling`, `rule_or_ruling_without_demonstrated_donor_change`, `baseline_only`, `candidate`, or `context_only`. These are evidence/workflow classes, not causal-validity grades. |
| `causal_readiness` | All rows require entity/history validation before use in an estimator. No row is automatically a statewide treatment assignment. |
| `ipeds_calendar_window`, `foundation_calendar_window` | Coarse timing relative to 2004–2024 and 1989–2021. Derived from effective date, otherwise decision date. These are calendar-window flags, **not fiscal-year cohort assignments**. |

Dates are text in ISO form, with year or month precision retained. Other blank cells mean no separate information established for that column; the 12 substantive disclosure fields use explicit `unresolved` rather than blanks. Rows do not contain the old four-category coding or a composite transparency score.

## 3. Using changes in both directions

Opening and restricting events can both inform the donation question, but they should initially be analyzed separately. An opening estimates response to greater prospective exposure; a restriction estimates response to less exposure, potentially after donors have already adapted or information has circulated. Symmetry of behavioral effects is a hypothesis, not a coding assumption. A restriction following a controversy may also have different selection and anticipation than a general statutory opening.

The most useful initial comparisons are listed below. They identify research opportunities, not endorsed causal designs. Citations and qualifications are in the linked entries.

| Sequence/event | Donor-facing change | Main qualification |
|---|---|---|
| [California 2012](#ca-2012) | New auxiliary access to amounts, dates and terms; identities for triggered donors. | Ordinary identity protection remains; multiple sectors and auxiliary definitions. |
| [Connecticut 2017](#ct-2017) | UConn donor-name report with opt-out. | Legacy gifts/commitments excluded; simultaneous funding and fundraising provisions. |
| [Iowa 2005–2006](#ia-2005) | Coverage ruling followed by requested anonymity and other protections; gift details preserved. | Earlier ruling reserved exemptions; no verified unrestricted donor-open interval. |
| [Texas 1991–2003](#tx-1991) | University-held names/amounts accessible under AG ruling, then identity exemption. | Institution-held route; intermediary language already present in 2003; one-day official date discrepancy. |
| [Georgia 2012](#ga-2012) | Business exception narrowed by monetary/ownership definitions. | Exemption predates 2012; treatment concentrated among donors affected by the trigger change. |
| [Kentucky 2008](#ky-2008) | Ordinary donor identities public, with narrow legacy anonymity. | Earlier coverage notice and prospective dicta issue; named foundation. |
| [Pennsylvania 2009–2010](#pa-2009) | Redacted gift amounts/dates accessible through university. | Identity protected; administrative order and appeal are one sequence. |
| [Virginia 2020](#va-2020-terms) | Documentation/access for gift terms imposing specified obligations. | Threshold/type-specific; identity and complete foundation books are separate. |

The coding intentionally withholds several tempting reversal claims. Oregon’s public university-used budgets and private foundation status are different objects. Indiana’s rejected audit theory does not prove a five-year public regime. North Dakota protected donor identity before 2017, and the new financial-information definition may partly clarify existing protection. Utah 2020 and North Carolina 2025 preserve important statutory-disclosure exceptions. Those events cannot become confirmed closings without resolving the earlier route and the exception’s application. The 2025 North Carolina event is outside both supplied panels.

Before estimation, match foundation EINs and public institutions to the named entities, sector, contract, funding/control test and custodians. Build separate histories for donor identity, gift-detail access and identity-to-gift linkage. Record partial-year exposure using institutional fiscal-year ends and a stated first-partial/first-full-year rule. Preserve enactment/decision dates for anticipation checks. Do not code known pre-panel exposure or unresolved onset as never treated. Avoid absorbing treatment coding for reversible or repeated exposure changes. In a stacked comparison, identify which later legal changes contaminate each event window rather than treating earlier appellate/trial rows as independent shocks.

Donation outcomes may mix gifts to the institution and foundation, new commitments and fulfillment of old pledges, or gift types outside the legal trigger. Donors may respond by requesting anonymity, changing restrictions, using intermediaries or shifting recipient rather than reducing total giving. Those margins should inform outcome selection and heterogeneity. Nothing in this inventory alone establishes exogeneity, donor awareness, parallel trends, or the absence of simultaneous policy changes.

## 4. Jurisdiction coverage map

The map distinguishes an inventoried rule from a completed legal history. Oversight-only states are not automatically unexposed controls. Jurisdictions without a defensible row remain in this map rather than receiving fabricated “no law” events.

| Jurisdiction | Inventory coverage and limits |
|---|---|
| Alaska (AK) | 1 rows: [AK-BASE](#ak-base). Oversight context only; donor-access history unresolved. |
| Alabama (AL) | 1 rows: [AL-1981](#al-1981). |
| Arkansas (AR) | AG 2010-136 is a reported conditional foundation exclusion; original not retrieved. No verified donor event assigned. [Source 1](https://splc.org/2010/10/access-to-university-foundation-records/) |
| Arizona (AZ) | 2 rows: [AZ-DONOR](#az-donor), [AZ-OVERSIGHT](#az-oversight). |
| California (CA) | 1 rows: [CA-2012](#ca-2012). |
| Colorado (CO) | 1 rows: [CO-2005](#co-2005). |
| Connecticut (CT) | 2 rows: [CT-2017](#ct-2017), [CT-AUDIT](#ct-audit). |
| District of Columbia (DC) | 1 rows: [DC-CONTRACTOR](#dc-contractor). |
| Delaware (DE) | The identified university statute does not establish separate-foundation donor access. Institution scope and donor rules remain unresolved. [Source 1](https://delcode.delaware.gov/title29/c100/index.html) |
| Florida (FL) | 1 rows: [FL-BASE](#fl-base). |
| Georgia (GA) | 3 rows: [GA-2003](#ga-2003), [GA-2005](#ga-2005), [GA-2012](#ga-2012). |
| Hawaii (HI) | The cited general private-entity analogy is not a gift-foundation application. No verified donor event assigned. [Source 1](https://www.courts.state.hi.us/wp-content/uploads/2015/11/2007-HAWAII-APPELLATE-COURT.html); [Source 2](https://www.hawaii.edu/policy/?action=viewPolicy&policyChapter=8&policyNumber=210&policySection=rp); [Source 3](https://www.hawaii.edu/news/article.php?aId=785) |
| Iowa (IA) | 2 rows: [IA-2005](#ia-2005), [IA-2006](#ia-2006). |
| Idaho (ID) | 1 rows: [ID-BASE](#id-base). Oversight context only; donor-access history unresolved. |
| Illinois (IL) | 2 rows: [IL-2016](#il-2016), [IL-2017](#il-2017). |
| Indiana (IN) | 2 rows: [IN-1990](#in-1990), [IN-1995](#in-1995). |
| Kansas (KS) | 1 rows: [KS-BASE](#ks-base). Oversight context only; donor-access history unresolved. |
| Kentucky (KY) | 3 rows: [KY-1992](#ky-1992), [KY-2008](#ky-2008), [KY-2008-LEGACY](#ky-2008-legacy). |
| Louisiana (LA) | 2 rows: [LA-1990](#la-1990), [LA-BASE](#la-base). |
| Massachusetts (MA) | 1 rows: [MA-BASE](#ma-base). |
| Maryland (MD) | 2 rows: [MD-COLLEGES](#md-colleges), [MD-USM](#md-usm). Oversight context only; donor-access history unresolved. |
| Maine (ME) | 1 rows: [ME-BASE](#me-base). Oversight context only; donor-access history unresolved. |
| Michigan (MI) | 1 rows: [MI-1996](#mi-1996). |
| Minnesota (MN) | 2 rows: [MN-DONOR](#mn-donor), [MN-OVERSIGHT](#mn-oversight). |
| Missouri (MO) | The general quasi-public-body definition does not establish the relevant foundation application or its historical onset. [Source 1](https://revisor.mo.gov/main/OneSection.aspx?section=610.010) |
| Mississippi (MS) | 2 rows: [MS-2016](#ms-2016), [MS-OVERSIGHT](#ms-oversight). |
| Montana (MT) | 1 rows: [MT-BASE](#mt-base). Oversight context only; donor-access history unresolved. |
| North Carolina (NC) | 3 rows: [NC-1990](#nc-1990), [NC-2005](#nc-2005), [NC-2025](#nc-2025). |
| North Dakota (ND) | 4 rows: [ND-2009](#nd-2009), [ND-2014-DICKINSON](#nd-2014-dickinson), [ND-2014-NDSU](#nd-2014-ndsu), [ND-2017](#nd-2017). |
| Nebraska (NE) | The cited nonprofit-entity litigation does not establish the university gift-foundation population or a donor event. [Source 1](https://law.justia.com/cases/nebraska/supreme-court/2015/s-13-275.html); [Source 2](https://www.nebraska.gov/apps-courts-epub/public/viewCertified?docId=N00003278PUB) |
| New Hampshire (NH) | University audit statute and observed foundation audit practice do not establish a separate-foundation public donor duty. [Source 1](https://gc.nh.gov/rsa/html/XV/187-A/187-A-25-a.htm); [Source 2](https://www.usnh.edu/system-office/finance-administration/internal-audit/audits-at-usnh) |
| New Jersey (NJ) | 2 rows: [NJ-2013](#nj-2013), [NJ-DONOR](#nj-donor). |
| New Mexico (NM) | 2 rows: [NM-2018](#nm-2018), [NM-2022](#nm-2022). |
| Nevada (NV) | 1 rows: [NV-1993](#nv-1993). |
| New York (NY) | 5 rows: [NY-1988](#ny-1988), [NY-2007](#ny-2007), [NY-2010](#ny-2010), [NY-2011](#ny-2011), [NY-OVERSIGHT](#ny-oversight). |
| Ohio (OH) | 2 rows: [OH-1992](#oh-1992), [OH-2018](#oh-2018). |
| Oklahoma (OK) | 2 rows: [OK-2007](#ok-2007), [OK-OVERSIGHT](#ok-oversight). |
| Oregon (OR) | 2 rows: [OR-1988](#or-1988), [OR-OVERSIGHT](#or-oversight). |
| Pennsylvania (PA) | 2 rows: [PA-2009](#pa-2009), [PA-2010](#pa-2010). |
| Rhode Island (RI) | 1 rows: [RI-DONOR](#ri-donor). |
| South Carolina (SC) | 2 rows: [SC-1991](#sc-1991), [SC-DONOR](#sc-donor). |
| South Dakota (SD) | 2 rows: [SD-BOR](#sd-bor), [SD-SDSU](#sd-sdsu). Oversight context only; donor-access history unresolved. |
| Tennessee (TN) | 3 rows: [TN-2007](#tn-2007), [TN-2011-CASE](#tn-2011-case), [TN-2011](#tn-2011). |
| Texas (TX) | 3 rows: [TX-1991](#tx-1991), [TX-2003](#tx-2003), [TX-OVERSIGHT](#tx-oversight). |
| Utah (UT) | 2 rows: [UT-2020](#ut-2020), [UT-DONOR](#ut-donor). |
| Virginia (VA) | 3 rows: [VA-2019](#va-2019), [VA-2020-REPORT](#va-2020-report), [VA-2020-TERMS](#va-2020-terms). |
| Vermont (VT) | 1 rows: [VT-BASE](#vt-base). Oversight context only; donor-access history unresolved. |
| Washington (WA) | 1 rows: [WA-2020](#wa-2020). |
| Wisconsin (WI) | 1 rows: [WI-OVERSIGHT](#wi-oversight). Oversight context only; donor-access history unresolved. |
| West Virginia (WV) | 1 rows: [WV-1989](#wv-1989). |
| Wyoming (WY) | 1 rows: [WY-2001](#wy-2001). Oversight context only; donor-access history unresolved. |

## 5. Detailed legal entries

Each entry links to the source actually supporting the stated proposition. Where the original was not recovered, the verification label and gap identify the weaker evidence. A linked later judgment or official summary is not presented as the missing original. The before/after code line uses the fixed order **identity · amount · date · terms · benefits · linkage**. For oversight-only entries the repeated `not_required` values mean the reviewed duty does not mandate those individual fields for the public.

<a id="ak-base"></a>

### AK-BASE — Alaska: Financial oversight and reporting baseline

**UA–UA Foundation Second Amended and Restated MOU, June 4, 2021, §§5(c)–(e), 6.** Observed version 2021-06-04; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UA and UA Foundation. Custodian: Foundation to university president/CFO. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Annual audited accounts, auditor communications and university inspection are required. The MOU establishes access for university officials. It does not establish a public right to a donor list or gift agreement. Earlier agreements exist, so the observed version cannot be used as first adoption.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** MOU §§5(c)–(e), 6. [Source 1](https://www.alaska.edu/swbudget/files/Distribution_Principles/FY22%20Distribution%20Principles%20Memo%20-%20revised%20v2.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="al-1981"></a>

### AL-1981 — Alabama: Stone: record-specific public-writing test

**Stone v. Consolidated Publishing Co., 404 So. 2d 678 (Ala. Oct. 2, 1981).** Decision/enactment 1981-10-02. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Jacksonville State University Foundation. Custodian: Foundation/public-record custodian. Route: `public_records_coverage`.

**Conditions.** Alter-ego status plus record reasonably necessary to public business

Jacksonville State foundation alter-ego status was unchallenged. The court remanded for a record-specific public-writing test; it did not open every foundation record. The court remanded for a record-specific inquiry; no blanket donor-name holding follows. The uncontested alter-ego premise limits transfer to other foundations.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `no_demonstrated_change`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** Opinion, public-writing definition and remand. [Source 1](https://law.justia.com/cases/alabama/supreme-court/1981/404-so-2d-678-1.html).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="az-donor"></a>

### AZ-DONOR — Arizona: University donor transaction information outside background exemption

**A.R.S. §15-1640(A)(3).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Arizona public universities; not automatic separate-foundation coverage. Custodian: University. Route: `university_records_request`.

**Conditions.** University-held donor records; other applicable exemptions require separate review.

The donor-background exemption excepts donor name, gift description, date, amount and conditions from its protection. The university route expressly preserves transaction information while allowing confidential donor-background material. That difference is central to the proposed construct. Neither this statute nor the board affiliation policy independently makes every foundation a public body. The CSV therefore codes the university-held transaction fields and leaves the first operative date unassigned.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `public · public · public · public · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** This provision does not permit a general opt-out for the listed transaction information.

**Hand-check source.** §15-1640(A)(3), university donor-record exemption and exceptions. [Source 1](https://www.azleg.gov/ars/15/01640.htm).

**Remaining gap.** Original enactment/version history and separate-foundation application not reconstructed.

<a id="az-oversight"></a>

### AZ-OVERSIGHT — Arizona: Financial oversight and reporting baseline

**Arizona Board of Regents Policy 1-125, University-Affiliated Organizations, approved Nov. 18, 2021; amended Nov. 20, 2025.** Observed version 2025-11-20; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** ABOR university-affiliated organizations. Custodian: Foundation to university/ABOR. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliation requires audited financial statements and tax reporting. The 2021 policy replaced earlier guidelines; the current reporting provisions were not traced to their first adoption. This route must be kept separate from university donor records under §15-1640.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Policy 1-125, financial reporting provisions. [Source 1](https://public.powerdms.com/ABOR/documents/1898832).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="ca-2012"></a>

### CA-2012 — California: Auxiliary records access with donor identity exceptions

**SB 8, Stats. 2011, ch. 247; Cal. Educ. Code §§72690–72701, 89913–89919, 92950–92961.** Effective 2012-01-01. Decision/enactment 2011-09-06. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Covered UC, CSU and California community-college auxiliary organizations. Custodian: Auxiliary organization. Route: `request_to_auxiliary`.

**Conditions.** Statutory auxiliary definition; record-specific exemptions remain.

Creates a statutory auxiliary-records route. Gift amount, date, purpose and restrictions remain accessible; donor identity is protected except specified quid-pro-quo or self-dealing situations. Noncompetitive contract awards within five years are another identity-disclosure trigger. SB8 establishes direct access to covered auxiliaries while protecting ordinary donor identities. This creates useful variation in gift detail even where names remain shielded. The $2,500 trigger measures the benefit received, not the donation’s size. Researchers should retain the three higher-education sectors and auxiliary definitions when matching institutions. Public terms and restrictions may expose influence without revealing a name; identity linkage becomes available only under the specified exceptions. Enactment in September 2011 can support an anticipation specification, while the operative access date is January 2012.

**Before → after.** `not_required · not_required · not_required · not_required · not_required · not_required` → `trigger_only · public · public · public · trigger_only · trigger_only`. Direction: `expansion`. The specific auxiliary disclosure regime introduced by SB8 did not previously exist; this is not proof that every record lacked all alternative public routes.

**Thresholds.** Benefit received in quid pro quo exceeds $2,500, inflation-adjusted; impermissible benefit and self-dealing alternatives. Also noncompetitively awarded university/auxiliary contracts within five years of gift/service.

**Anonymity.** Ordinary donor identity protected without requiring an opt-out request; statutory unmasking triggers apply.

**Existing gifts.** No gift-date grandfather clause identified in the reviewed donor provisions; separately check historical record retention.

**Hand-check source.** Educ. Code §§72696, 89916 and 92956, subdivisions (a)–(b); chaptered SB8. [Source 1](https://www.leginfo.ca.gov/pub/11-12/bill/sen/sb_0001-0050/sb_8_bill_20110906_chaptered.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="co-2005"></a>

### CO-2005 — Colorado: Foundation expenditure access excludes gift records

**C.R.S. §24-72-202(1.6), (6)(a)(IV), (6)(b)(VI)–(VII); HB05-1041.** Effective 2005-05-24. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Institutionally related foundations within C.R.S. definition. Custodian: Foundation/public institution for specified records. Route: `CORA_specified_foundation_records`.

**Conditions.** Record concerns expenditure to/on behalf of institution or employee

Specified expenditure records become accessible, but donor identifying information, gift amounts and gift agreements are excluded. The access law is positive for spending transparency while withholding the gift records most directly relevant to donor behavior. Its enactment should not be coded as an expansion of ordinary donor-name, amount or agreement exposure. Public expenditure records could still disclose uses of funds; linkage to a particular gift is not established by this provision. Earlier gift accessibility was not reconstructed, so the row does not assert a new gift-detail restriction.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · conditional · protected · unresolved · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Donor identifying information excluded without individual opt-out.

**Hand-check source.** §24-72-202(6)(a)(IV), (6)(b)(VI)–(VII); official 2005 digest HB1041. [Source 1](https://law.justia.com/codes/colorado/title-24/public-open-records/article-72/part-2/section-24-72-202/); [Source 2](https://leg.colorado.gov/sites/default/files/digest2005.pdf).

**Remaining gap.** Retrieve original HB1041 for complete clause comparison; the date is supported by the official session digest.

<a id="ct-2017"></a>

### CT-2017 — Connecticut: UConn public donor-name report with opt-out and grandfathering

**PA 16-93 §1; Conn. Gen. Stat. §4-37f(9).** Effective 2017-07-01. Decision/enactment 2016-05-31. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Foundation established for UConn under the specified endowment condition. Custodian: Foundation submits report to legislative committees. Route: `mandatory_public_annual_report`.

**Conditions.** §4-37f(9) applies to UConn foundation with endowment exceeding $1.5 million.

Public annual report includes donor names unless nonpublic treatment is requested; report also lists board-approved named positions/facilities. Does not require a donor-linked individual amount/date/agreement list. The relevant donor event is July 2017, not the older audit regime. The express grandfathering reaches commitments as well as completed gifts, making pledge dates potentially important for anticipation and sample construction. The report creates a donor-name exposure route with an avoidance option, but it does not guarantee public linkage of each name to an amount or agreement. PA 16-93 also changes university payments to the foundation and fundraising targets for student support. Those simultaneous provisions could affect fundraising directly and should be considered when interpreting donation outcomes.

**Before → after.** `not_required · not_required · not_required · not_required · not_required · not_required` → `opt_out · not_required · not_required · not_required · summary_only · unresolved`. Direction: `expansion`. Pre-existing public audits did not impose this particular donor-name report.

**Thresholds.** Foundation endowment >$1.5 million; no individual gift threshold for the name list.

**Anonymity.** Donor may request name not be made public.

**Existing gifts.** Donations or commitments made before July 1, 2017 are excluded from the new donor-name reporting requirement.

**New gifts.** Post-July 1, 2017 donations/commitments subject to report and donor opt-out.

**Hand-check source.** PA 16-93 §1, subdivision (9), donor-name and grandfather clauses; approval line. [Source 1](https://www.cga.ct.gov/2016/ACT/pa/2016PA-00093-R00SB-00333-PA.htm); [Source 2](https://www.cga.ct.gov/current/pub/chap_047.htm).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [CT-AUDIT](#ct-audit).

<a id="ct-audit"></a>

### CT-AUDIT — Connecticut: Financial oversight and reporting baseline

**Conn. Gen. Stat. §§4-37e–4-37l, especially §4-37f(8)–(10); PA 89-267; PA 16-93.** First operative date untraced. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Covered state-agency foundations. Custodian: Foundation to state agency and public audit recipients. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Public audit reporting exists separately from underlying foundation books. The 1989 regime is an audit-history marker. It does not date the UConn donor-name report that begins in 2017. Revenue thresholds and audit frequency changed subsequently; no individual gift list follows from an aggregate audit.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** §4-37f audit provisions; PA 89-267 history. [Source 1](https://law.justia.com/codes/connecticut/title-4/chapter-47/section-4-37f/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="dc-contractor"></a>

### DC-CONTRACTOR — District of Columbia: General contractor public-function records route

**D.C.Law13-283;§2-532(a-3).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** D.C. public-agency contractors; UDC Foundation application not established. Custodian: Public agency for contracted-function records. Route: `general_contractor_records`.

**Conditions.** As defined by cited authority; no additional condition coded

§2-532(a-3) reaches qualifying contractor public-function records; no specific foundation donor application established. The general route was added in 2001, but that date is not a verified UDC Foundation donor onset. Application requires the relevant contract and record relationship. The row preserves the potential route without assigning donor exposure.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** D.C. Code §2-532(a-3); Law13-283 history. [Source 1](https://code.dccouncil.gov/us/dc/council/code/sections/2-532); [Source 2](https://oig.dc.gov/sites/default/files/Reports/DCOIG_Report_25-1-10GG_ACFR_UDCFS.pdf); [Source 3](https://www.udc.edu/foundation/).

**Remaining gap.** UDC Foundation contracts, record scope and relevant donor exemptions.

<a id="fl-base"></a>

### FL-BASE — Florida: DSO confidentiality with audit and expenditure exceptions

**Fla. Stat. §1004.28(5)(a)–(b); college counterpart §1004.70.** Observed version 2025; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** University direct-support organizations under §1004.28. Custodian: DSO; public recipients of audit materials. Route: `public_audits_and_specified_expenditures`.

**Conditions.** State-fund expenditures or private-fund travel; specified audit reports

Other DSO records are confidential; audits and specified state-fund/private-travel expenditure records are exceptions. Individual gift detail is accessible only if present in a public exception and not otherwise protected. The Florida regime cannot be represented as either all foundation books open or all gift information inaccessible. Its public audit exception may expose information contained in those reports; it does not mandate a complete donor list. Confidentiality covers records outside the enumerated exceptions, while travel and state-fund spending have distinct public routes. Individual fields are therefore conditional in this combined DSO row. The college DSO counterpart requires its own statutory matching.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Anonymous donor identity protected in the public audit route.

**Hand-check source.** §1004.28(5)(a)–(b). [Source 1](https://www.flsenate.gov/Laws/Statutes/2025/1004.28).

**Remaining gap.** First dates of each exception and gift-level content of public audits untraced.

<a id="ga-2003"></a>

### GA-2003 — Georgia: Reported informal UGA Foundation coverage letter

**Attorney General Thurbert Baker letter to UGA Foundation counsel, reported Nov. 19, 2003 (unofficial); O.C.G.A. §50-18-72(a)(29).** Decision/enactment 2003. Evidence: `secondary_only`. Analysis tier: `candidate`.

**Scope and route.** UGA Foundation. Custodian: Foundation. Route: `claimed_foundation_records_request`.

**Conditions.** Associated foundation status; donor-business exception

Reported AG letter supports a foundation coverage theory; original letter and donor-specific holding not retrieved. The press report is a lead to an informal letter, not a retrieved binding donor-disclosure decision. It cannot establish a period of universal donor openness preceding the later donor exemption.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** RCFP report, November 19, 2003. [Source 1](https://www.rcfp.org/attorney-general-says-foundation-subject-state-sunshine-laws/); [Source 2](https://dlg.usg.edu/record/dlg_ggpd_y-ga-bl411-pr4-bs1-bh5-b2005-belec-p-btext).

**Remaining gap.** Original letter, its date and donor-record scope required.

<a id="ga-2005"></a>

### GA-2005 — Georgia: Earlier donor exemption and business-transaction exception

**HB340,2005 legislative highlights.** Decision/enactment 2005. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** Covered public postsecondary institutions and associated nonprofit foundations. Custodian: Institution/foundation. Route: `open_records_with_donor_exception`.

**Conditions.** Associated foundation status; donor-business exception

Official session summary describes protection of donor personal information, with donor name and donation amount accessible under a business-transaction exception. The official 2005 summary and pre-2012 code establish that the donor exemption predates the 2012 rewrite. The original 2005 act and operative date remain unverified, so this row records an earlier statutory candidate without assigning a clean pre/post donor treatment. The 2003 informal coverage report does not resolve whether each donor field was previously open.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `trigger_only · trigger_only · unresolved · unresolved · unresolved · trigger_only`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Protection is not described as depending on donor opt-out.

**Hand-check source.** 2005 Senate Research Office session highlights, HB340. [Source 1](https://dlg.usg.edu/record/dlg_ggpd_y-ga-bl411-pr4-bs1-bh5-b2005-belec-p-btext).

**Remaining gap.** Retrieve enrolled HB340 and reconstruct prior donor exemptions/effective date.

**Related entries.** [GA-2003](#ga-2003), [GA-2012](#ga-2012).

<a id="ga-2012"></a>

### GA-2012 — Georgia: Business-disclosure exception narrowed by monetary definition

**2012 HB397/AP; O.C.G.A. §50-18-72(a)(29).** Effective 2012-04-17. Decision/enactment 2012-04-17. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Covered Georgia public postsecondary institutions and associated nonprofit foundations. Custodian: Institution/foundation. Route: `open_records_with_business_trigger`.

**Conditions.** Donor or entity with donor substantial interest transacts qualifying business with recipient institution within three years.

Defines qualifying business as >$10,000 aggregate in a calendar year; substantial interest is >25% ownership. Names and amounts remain available for donors meeting the narrowed trigger. The categorical codes remain trigger_only on both sides, but the condition changes. The most defensible incremental restriction concerns donors whose business transactions fall at or below the new $10,000 cutoff, subject to prior interpretation. The original marked-up act supports the textual comparison. This is not the creation of the donor exemption and does not justify treating all Georgia donors as newly hidden in 2012. The monetary definition concerns business with the university, not gift size.

**Before → after.** `trigger_only · trigger_only · unresolved · unresolved · unresolved · trigger_only` → `trigger_only · trigger_only · unresolved · unresolved · unresolved · trigger_only`. Direction: `restriction`. 2010 §50-18-72(a)(19) contained the business-transaction exception without these express monetary/ownership definitions.

**Thresholds.** Business transactions >$10,000/calendar year; ownership >25%; three-year donation/business relation.

**Hand-check source.** HB397/AP printed pp.28–29, lines 994–1005; prior (a)(19). [Source 1](https://www.legis.ga.gov/Legislation/20112012/127646.pdf); [Source 2](https://law.justia.com/codes/georgia/2010/title-50/chapter-18/article-4/50-18-72/); [Source 3](https://law.georgia.gov/press-releases/2012-04-17/governor-deal-signs-hb-397-revamping-georgias-sunshine-laws).

**Remaining gap.** Historical administrative interpretation of the old trigger and affected donor/institution population; verify no alternative disclosure route.

**Related entries.** [GA-2005](#ga-2005).

<a id="ia-2005"></a>

### IA-2005 — Iowa: Contracted fundraising records subject to public-records route

**Gannon v. Board of Regents, 692 N.W.2d 31 (Iowa Feb. 4, 2005); Iowa Code §22.2(2).** Decision/enactment 2005-02-04. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** ISU Foundation governmental-function records under university contract; analogous contracts require matching. Custodian: University for contracted-function records. Route: `university_contractor_records`.

**Conditions.** Governmental function performed under university contract

Contracting fundraising cannot remove governmental-function records from chapter 22; individual confidentiality questions expressly reserved. Gannon establishes an enforceable records route, but its reservation of individual confidentiality questions prevents coding an exemption-free year of donor exposure. Treat the decision as a coverage event with conditional field availability. The later donor statute can be studied as a restriction of this route without assuming every requested record was actually released in the intervening period.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. ISU/Foundation contested the obligation to provide the requested contracted-function records.

**Hand-check source.** Gannon, analysis under §22.2(2), especially footnote 3. [Source 1](https://caselaw.findlaw.com/court/ia-supreme-court/1433071.html); [Source 2](https://ipib.iowa.gov/media/145/download?inline=).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [IA-2006](#ia-2006).

<a id="ia-2006"></a>

### IA-2006 — Iowa: Requested anonymity protected; gift details expressly preserved

**2006 Iowa Acts ch.1127 §1, HF2706; Iowa Code §22.7(52).** Effective 2006-07-01. Decision/enactment 2006-05-24. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Fundraising records of covered public institutions and governmental-function foundations. Custodian: Covered records custodian. Route: `chapter_22_request_with_52_exemptions`.

Adds protection for specified donor planning/solicitation information and requested anonymity while preserving amount, date, purpose, restrictions and specified consideration. The enacted chapter is 1127, not 1117. The legal restriction concerns selected information, especially identity when anonymity is requested; the law preserves substantial gift detail. Bonfield’s 2007 legislative presentation links the amendment to Gannon, supporting a legislative-response account without proving every legislator’s motive. Because the earlier opinion reserved exemptions, the pre-state remains conditional. A design can distinguish donor-name protection from continuing public terms, dates and amounts rather than code a total reversal.

**Before → after.** `conditional · conditional · conditional · conditional · conditional · conditional` → `opt_out · public · public · public · public · opt_out`. Direction: `restriction`. Gannon established a chapter 22 route but reserved record-specific exemptions; no unconditional identity baseline established.

**Anonymity.** Requested anonymity protected subject to statutory exceptions, including the publicly traded corporation qualification.

**Hand-check source.** Acts printed pp.322–323 / PDF pp.350–351; §22.7(52); official bill history. [Source 1](https://publications.iowa.gov/50856/1/2006_Iowa_Acts_GA_81_2.pdf); [Source 2](https://www.legis.iowa.gov/legislation/billTracking/billHistory?billName=HF+2706&ga=81); [Source 3](https://www.legis.iowa.gov/docs/publications/SD/6542.pdf).

**Remaining gap.** Historical anonymity requests, institution contracts, and prior exemption application; fiscal-year mapping.

**Related entries.** [IA-2005](#ia-2005).

<a id="id-base"></a>

### ID-BASE — Idaho: Financial oversight and reporting baseline

**Idaho State Board of Education Policy V.E, Gifts and Affiliated Foundations (Dec. 2025 version).** Observed version 2025; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Recognized Idaho public higher-education foundations. Custodian: Foundation to institution and board. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliation entails audit and activity reporting; public disclosure is encouraged rather than universally required. The board policy asserts foundations are outside public-records law and preserves donor confidentiality as requested and permitted by law. This is not a judicial resolution of every foundation’s status. Mandatory institutional oversight and an encouragement to publish do not require gift-level public disclosure.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Policy V.E §§1.b.ii, 2.a.x, 2.b. [Source 1](https://boardofed.idaho.gov/board-of-education/policies-rules/board-policies/section-v-financial-affairs/v-e-gifts-and-affiliated-foundations/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="il-2016"></a>

### IL-2016 — Illinois: Earlier trial order in College of DuPage litigation

**College of DuPage litigation,trial order described by2017 appellate opinion.** Decision/enactment 2016-03-17. Evidence: `later_primary_account`. Analysis tier: `candidate`.

**Scope and route.** College of DuPage/Foundation contract records. Custodian: College. Route: `university_contractor_records`.

**Conditions.** Contracted governmental function and directly related record

Later appellate opinion describes the earlier trial order concerning access to foundation records. The earlier trial date is retained as a possible notice or implementation event. Obtain the original order and any stay/compliance record before assigning first exposure in 2016 rather than 2017. The two rows represent one litigation sequence, not two independent policy shocks.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** 2017 appellate opinion, procedural history. [Source 1](https://law.justia.com/cases/illinois/court-of-appeals-second-appellate-district/2017/2-16-0274.html).

**Remaining gap.** Original trial order, stay and actual legal enforceability timeline.

**Related entries.** [IL-2017](#il-2017).

<a id="il-2017"></a>

### IL-2017 — Illinois: Contracted governmental-function records obtainable from college

**Chicago Tribune v. College of DuPage, 2017 IL App (2d) 160274 (May 9, 2017); 5 ILCS 140/7(2).** Decision/enactment 2017-05-09. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** College of DuPage Foundation contract records. Custodian: College. Route: `public_records_coverage`.

**Conditions.** Records directly relate to contracted governmental function under 5 ILCS 140/7(2)

Foundation records directly relating to a contracted governmental function are obtainable from the college. The foundation itself was not held a public body. Community-college origin; institutional contracts determine reach. The appellate decision sustains access through the college without declaring the foundation itself a public body. A 2016 trial order is separately retained to avoid assigning a second onset at affirmance.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** 2017 IL App (2d) 160274, governmental-function analysis. [Source 1](https://law.justia.com/cases/illinois/court-of-appeals-second-appellate-district/2017/2-16-0274.html).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [IL-2016](#il-2016).

<a id="in-1990"></a>

### IN-1990 — Indiana: Earlier disputed audit-based AG coverage theory

**1990 AG position described in State Board of Accounts v. IU Foundation, 647 N.E.2d 342 (1995).** Decision/enactment 1990. Evidence: `later_primary_account`. Analysis tier: `candidate`.

**Scope and route.** IU Foundation. Custodian: Foundation. Route: `claimed_audit_based_coverage`.

Later court opinion reports AG theory, noncompliance and contrary trial judgment; original AG document absent. This is evidence of a disputed legal position, not verified public donor access. The separate row preserves the historical lead without constructing a false treatment interval.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `disputed · disputed · disputed · disputed · disputed · disputed`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** 1995 opinion, procedural history. [Source 1](https://law.justia.com/cases/indiana/court-of-appeals/1995/28a01-9402-cv-52-8.html).

**Remaining gap.** Original AG opinion, trial judgment/date, stay and legal enforceability.

**Related entries.** [IN-1995](#in-1995).

<a id="in-1995"></a>

### IN-1995 — Indiana: Named-foundation public-records exclusion

**State Board of Accounts v.IU Foundation,647N.E.2d342.** Decision/enactment 1995-02-24. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Indiana University Foundation. Custodian: Foundation. Route: `rejected_direct_foundation_request`.

**Conditions.** Audit-jurisdiction route; fee-for-service rather than public subsidy

Audit-based public-agency theory rejected; other definitions not decided. The appellate court affirmed an existing trial-level exclusion. Its discussion of a 1990 AG position and the foundation’s refusal does not establish an uninterrupted 1990–1995 donor-open interval.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · protected · protected · protected · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion/order, public-body analysis and disposition. [Source 1](https://law.justia.com/cases/indiana/court-of-appeals/1995/28a01-9402-cv-52-8.html).

**Remaining gap.** Other custodians/routes and changing entity facts; no demonstrated prior donor-open state.

<a id="ks-base"></a>

### KS-BASE — Kansas: Financial oversight and reporting baseline

**K.S.A. §76-721; Kansas State PPM ch. 3270, revised May 26, 2020.** Observed version 2020-05-26; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** K-State affiliates; statutory controlled corporations separately. Custodian: Affiliates to K-State. Route: `financial_reporting_or_official_inspection`.

**Conditions.** Affiliation; general records access additionally requires substantial control

Affiliates supply annual CPA audits; controlled corporations have a separate statutory records rule. Independent endowments cannot be assumed to meet the statutory control test. Audit delivery alone supplies no affirmative donor-name or gift-agreement obligation; inspect each organization’s control and affiliation documents.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** PPM 3270; K.S.A. §76-721. [Source 1](https://www.k-state.edu/policies/ppm/3200/3270.html).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="ky-1992"></a>

### KY-1992 — Kentucky: KSU Foundation public-records coverage

**Frankfort Publishing Co. v. KSU Foundation, 834 S.W.2d 681 (Ky. June 25, 1992); 21-ORD-179; KSU Foundation v. Frankfort Newsmedia, No. 2023-CA-0320-MR (Ky. App. Mar. 1, 2024); KRS 42.540.** Decision/enactment 1992-06-25. Evidence: `later_primary_account`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Kentucky State University Foundation. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Named foundation public-agency status; analogous entities require their own legal/factual match

KSU Foundation is subject to the public-records law on the facts; record-specific donor exemptions require separate analysis. The case establishes foundation coverage, but does not by itself settle every donor privacy claim. An earlier 1989 AG opinion is a chronology lead. Later 2021/2024 proceedings reaffirm coverage and are not coded as repeated independent treatment adoptions.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** 834 S.W.2d 681; later 21-ORD-179 historical account. [Source 1](https://www.ag.ky.gov/Resources/orom/2021/21-ORD-179.pdf); [Source 2](https://law.justia.com/cases/kentucky/court-of-appeals/2024/2023-ca-0320-mr.html).

**Remaining gap.** Original 1992 opinion and earlier OAG89-92; donor-specific exemptions and named-entity matching.

<a id="ky-2008"></a>

### KY-2008 — Kentucky: Louisville donor identities public with narrow legacy-anonymity protection

**Cape Publications, Inc. v. University of Louisville Foundation, Inc., 260 S.W.3d 818 (Ky. 2008), No.2005-SC-000454-DG.** Decision/enactment 2008-08-21. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Louisville Foundation donors other than separately described legacy anonymous gifts. Custodian: Foundation. Route: `open_records_request`.

**Conditions.** Holding concerns donor privacy balancing and identified foundation; future-donor statement discussed separately from legacy gifts.

Rejects blanket privacy protection for ordinary individual donors; preserves a narrow legacy anonymous group. Majority says future donors cannot rely on requests for anonymity to defeat disclosure. This donor-specific decision is more informative than a foundation coverage flag. It distinguishes ordinary identities from a small legacy group promised anonymity before the foundation was found public. Future-donor language points toward prospective exposure, though its precedential status deserves care because the dissent calls it dicta. The earlier coverage determination may already have supplied notice; August 2008 should not automatically become the first date donors learned of possible disclosure.

**Before → after.** `disputed · unresolved · unresolved · unresolved · unresolved · disputed` → `public · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Court of Appeals had permitted withholding individual donor identities; foundation public-agency status had been litigated earlier.

**Anonymity.** Not a general prospective opt-out. Separate protected legacy cohort.

**Existing gifts.** 62 donors who requested anonymity before foundation public-agency status was established receive reliance-based protection after in-camera review.

**New gifts.** Majority states future donors should know records are public regardless of anonymity requests; dissent questions prospective discussion as dicta.

**Hand-check source.** Majority, privacy balancing, 62 anonymous donors and prospective discussion; dissent on prospective dicta. [Source 1](https://law.justia.com/cases/kentucky/supreme-court/2008/2005-sc-000454-dg.html).

**Remaining gap.** Original earlier coverage order/notice date, stays and interpretation of prospective language; donor-specific amount/agreement holdings remain limited.

**Related entries.** [KY-2008-LEGACY](#ky-2008-legacy).

<a id="ky-2008-legacy"></a>

### KY-2008-LEGACY — Kentucky: Reliance-based anonymity for older Louisville gifts

**Cape Publications, 260 S.W.3d 818 (Ky. 2008).** Decision/enactment 2008-08-21. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** 62 legacy Louisville Foundation donors expressly requesting anonymity before foundation public-status determination. Custodian: Foundation. Route: `legacy_exception_to_records_request`.

Anonymity preserved for this reliance cohort after review found no prohibited private benefit. This row isolates the legacy population from future donors. It is not a separate new restriction: anonymity was already protected in the preceding litigation. Its separate row permits an institution’s older commitments and new donations to be distinguished without turning the exception into an unlimited opt-out.

**Before → after.** `protected · unresolved · unresolved · unresolved · unresolved · protected` → `protected · unresolved · unresolved · unresolved · unresolved · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Majority, anonymous-donor reliance discussion. [Source 1](https://law.justia.com/cases/kentucky/supreme-court/2008/2005-sc-000454-dg.html).

**Remaining gap.** Exact date separating reliance cohort from later donors.

**Related entries.** [KY-2008](#ky-2008).

<a id="la-1990"></a>

### LA-1990 — Louisiana: Public-fund records accessible despite unresolved entity status

**State ex rel. Guste v. Nicholls College Foundation, 564 So. 2d 682 (La. June 28, 1990); La. R.S. 17:3390(C),(D),(F).** Decision/enactment 1990-06-28. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Nicholls College Foundation public-fund records. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Inspection limited to receipt/expenditure of the public funds at issue

Public-fund records at issue are inspectable without a universal holding that the foundation is a public body. The route concerns a subset of funds. Ordinary private gifts cannot be assumed to enter that subset. The decision’s spending/accountability rationale is insufficient to code all donors or agreements as public.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** Guste, 564 So.2d 682, public-funds discussion and disposition. [Source 1](https://law.justia.com/cases/louisiana/supreme-court/1990/90-c-0648-2.html); [Source 2](https://www.legis.la.gov/legis/LawPrint.aspx?d=80751).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="la-base"></a>

### LA-BASE — Louisiana: Private foundation status with public-fund and payment exceptions

**La. R.S. 17:3390(B)–(F).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Qualifying higher-education nonprofit corporations meeting statutory conditions. Custodian: Foundation/public recipients of required records. Route: `public_fund_records_and_reports`.

Private records are excluded under conditions; public-fund records, audits and specified public-employee payment documents have distinct access provisions. The section’s 1992 origin does not establish the date of every current exception. The current statute is therefore a baseline, not a reconstructed 1992 donor closing. An ordinary private gift and a transfer of public money must be kept separate; employee payments can be public without identifying the originating donor.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Thresholds.** Specified public-employee payments >$1,000 under subsection F; not a gift threshold.

**Hand-check source.** R.S. 17:3390(B)–(F). [Source 1](https://www.legis.la.gov/legis/LawPrint.aspx?d=80751).

**Remaining gap.** Original 1992 act and allocation of relevant clauses across 1998/2004/2008 amendments.

**Related entries.** [LA-1990](#la-1990).

<a id="ma-base"></a>

### MA-BASE — Massachusetts: Public foundation reports with requested anonymity

**Mass. Gen. Laws ch. 15A, §37(c),(f)–(h).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Certified foundations under Massachusetts ch.15A §37. Custodian: Foundation reports received by public trustees. Route: `public_financial_reports`.

**Conditions.** As defined by cited authority; no additional condition coded

Annual GAAP reports become public on trustee receipt; requested donor anonymity is protected. The statute does not require a complete donor list or every gift agreement. The opt-out right does not prove that every non-opting-out donor must appear in a public report. Exposure depends on report contents and trustee-requested information. This is why the field values are conditional rather than an unconditional public name list. The foundation’s statutory nonagency status coexists with this report route.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Solicitation must inform donors of the ability to request nonpublic identity.

**Hand-check source.** §37(e)–(h). [Source 1](https://malegislature.gov/Laws/GeneralLaws/PartI/TitleII/Chapter15A/Section37); [Source 2](https://www.cga.ct.gov/2014/rpt/2014-R-0217.htm).

**Remaining gap.** First clause date and actual report content obligations beyond general financial statements.

<a id="md-colleges"></a>

### MD-COLLEGES — Maryland: Community-college foundation public annual reports

**COMAR 13B.07.02.05.** First operative date untraced. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Maryland community-college foundations. Custodian: Foundation/college. Route: `public_annual_report`.

Audits and publicly available annual reports are required; individual gift fields are not specified. The regulation supplies a public report route for this sector. It should not be combined with the USM policy into a single donor treatment: the obligors differ and neither cited duty establishes an individual gift list.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Annual reports and audit requirements. [Source 1](https://regs.maryland.gov/us/md/exec/comar/13B.07.02.05).

**Remaining gap.** First operative date of public-report clause untraced.

<a id="md-usm"></a>

### MD-USM — Maryland: Financial oversight and reporting baseline

**USM Policy IX-2.00, Affiliated Philanthropic Foundations; COMAR 13B.07.02.05 (community-college foundations).** Observed version 2025; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** USM affiliated philanthropic foundations. Custodian: Foundation to USM university/board. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliation requires annual audits and reports. The policy originated earlier than the reviewed versions. Do not date present clauses from the first policy history entry or infer mandatory public donor detail from financial reporting.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** USM IX-2.00, reporting requirements. [Source 1](https://www.usmd.edu/regents/agendas/20260417-FullBoard-PublicSession.pdf); [Source 2](https://www.usmd.edu/regents/agendas/20250326-Audit-PublicSession.pdf); [Source 3](https://regs.maryland.gov/us/md/exec/comar/13B.07.02.05).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="me-base"></a>

### ME-BASE — Maine: Financial oversight and reporting baseline

**University of Maine System APL V-B, University Affiliated Organizations, Issue 3, effective Feb. 12, 2007.** Observed version 2007-02-12; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** University of Maine System affiliated organizations. Custodian: Affiliate to university/system. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliates provide financial statements and available Form 990 information, with institutional review. The correct title is Gift Administration. Issue 3 establishes an observed obligation, not the first adoption of all current reporting clauses. The cited requirement does not mandate individual donor information for the public.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** APL V-B, Gift Administration, Issue 3. [Source 1](https://www.maine.edu/apls/apl-v-b/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="mi-1996"></a>

### MI-1996 — Michigan: EMU Foundation public-body status based on public funding

**Jackson v. Eastern Michigan University Foundation, 215 Mich. App. 240, 544 N.W.2d 737 (Jan. 19, 1996).** Decision/enactment 1996-01-19. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Eastern Michigan University Foundation. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Primarily publicly funded on the record before court

EMU Foundation was a public body because it was primarily publicly funded on the record presented. Separate incorporation did not defeat FOIA; the decision also addressed open meetings. Funding/control facts cannot be assumed for every foundation. The finding depends on funding facts; independent incorporation does not defeat coverage. Donor-specific exemptions and the applicability of the funding test to other foundations remain separate questions.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** Opinion Part I, public funding at the time of the request; disposition reversing 1993 trial ruling. [Source 1](https://www.casemine.com/judgement/us/59148367add7b049344a69bd).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="mn-donor"></a>

### MN-DONOR — Minnesota: Public donor names and ranges; exact gift data protected

**Minn. Stat. §13.792.** Observed version 2025; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Named public higher-education bodies and related entities already subject to chapter 13. Custodian: Covered institution/entity. Route: `data_practices_request`.

Names and gift ranges are public; specified exact amounts, dates, payment schedules, gift forms and donor-planning/linking records are nonpublic/private. Names and ranges offer a different exposure from exact linked transactions. Acknowledgment and financial data that connect a donor to a specific amount receive protection. The related-entity phrase requires the entity already to be subject to chapter 13; it does not establish separate-foundation coverage by itself. The statute’s amendment history starts in 1988, but this review does not backdate every current clause to that year.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `public · range_only · protected · conditional · conditional · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** No general donor-name opt-out in the quoted public-data rule.

**Hand-check source.** §13.792 donor data paragraphs and final public-data sentence. [Source 1](https://www.revisor.mn.gov/statutes/cite/13.792).

**Remaining gap.** Trace original public-name/range clause and institution-specific chapter 13 coverage.

<a id="mn-oversight"></a>

### MN-OVERSIGHT — Minnesota: Financial oversight and reporting baseline

**Minnesota State Procedure 8.3.1 Part 4(C); Minn. Stat. §§13.02, 13.792.** Observed version 2025-03-04; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Minnesota State affiliated foundations. Custodian: Foundation to institution/system. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliate financial reporting is required, with audit/review tiers. The procedure’s 2000 origin does not date every subsequent reporting requirement. Statutory public donor names and ranges under §13.792 are a separate route with an independent coverage test.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Procedure 8.3.1 Part 4(C). [Source 1](https://www.minnstate.edu/board/procedure/803p1.html); [Source 2](https://www.revisor.mn.gov/statutes/cite/13.792).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="ms-2016"></a>

### MS-2016 — Mississippi: Named-foundation public-records exclusion

**Ethics CommissionR-16-006.** Decision/enactment 2016-04-01. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Jackson State University Development Foundation. Custodian: Foundation. Route: `rejected_direct_foundation_request`.

**Conditions.** As defined by cited authority; no additional condition coded

Named foundation records complaint dismissed for noncoverage. The commission order cites AG 98-0679, correcting the supplied number. The earlier AG original was not retrieved. The exclusion coexists with mandatory IHL financial reporting and does not establish all Mississippi foundations as legally identical.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · protected · protected · protected · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion/order, public-body analysis and disposition. [Source 1](https://www.ms.gov/msec/ethics/PublicRecord/Document/R-16-006_Order%20of%20Dismissal.pdf).

**Remaining gap.** Other custodians/routes and changing entity facts; no demonstrated prior donor-open state.

<a id="ms-oversight"></a>

### MS-OVERSIGHT — Mississippi: Financial oversight and reporting baseline

**IHL Policy 301.0806 / Miss. Admin. Code 8-3-5-301.0806; Ethics Commission R-16-006 (Apr. 1, 2016).** First operative date untraced. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** IHL affiliated entities. Custodian: Affiliate to institution/IHL. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliated entities submit audited accounts and governance information, subject to small-entity waiver provisions. A public-records exclusion for Jackson State’s foundation does not negate this oversight obligation. Neither route establishes a statewide public donor list.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Policy 301.0806. [Source 1](https://regulations.justia.com/states/mississippi/title-8/part-3/chapter-5/section-8-3-5-301-0806/); [Source 2](https://www.ms.gov/msec/ethics/PublicRecord/Document/R-16-006_Order%20of%20Dismissal.pdf); [Source 3](https://da.mdah.ms.gov/series-files/ihl/s0266/pdf/34.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="mt-base"></a>

### MT-BASE — Montana: Financial oversight and reporting baseline

**Montana Board of Regents Policy 901.9, Campus-Affiliated Foundations (history: Sept. 17, 1998; revisions through May 16, 2024).** Observed version 2024-05-16; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Montana recognized campus-affiliated foundations. Custodian: Foundation to university/regents; public financial statements. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Recognition agreements require financial oversight and public financial statements. The 2004 revision provides evidence of an earlier audit duty, but the 1998 original text was not recovered. Financial statement publicity is not a requirement to publish individual gift terms.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Regents Policy 901.9; 2004 predecessor revision. [Source 1](https://www.mus.edu/borpol/bor900/901-9.pdf); [Source 2](https://www.mus.edu/board/meetings/Archives/ITEM122-109-R0304.html).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="nc-1990"></a>

### NC-1990 — North Carolina: University process for obtaining and publishing foundation audits

**UNC Policy 600.2.5, adopted Feb. 9, 1990, amended Nov. 14, 1997; Regulation 600.2.5.2[R].** Decision/enactment 1990-02-09. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UNC system associated foundations under policy. Custodian: Chancellors/trustees/president. Route: `public_audit_process`.

**Conditions.** As defined by cited authority; no additional condition coded

Chancellors must request audits annually and forward those received; the audits are public records. A duty to request audits is not identical to an unconditional foundation duty to deliver them. The 1997 affiliation guidelines and 2005 statute add distinct requirements. None of these audit provisions alone establishes a donor identity or full gift-agreement list.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** UNC 600.2.5, 1990 resolution. [Source 1](https://www.northcarolina.edu/apps/policy/doc.php?id=756); [Source 2](https://www.northcarolina.edu/apps/policy/doc.php?id=758).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="nc-2005"></a>

### NC-2005 — North Carolina: Statutory foundation audit transmission

**N.C.G.S. §116-30.20; 2005-276 §9.22.** Decision/enactment 2005. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Covered UNC-associated nonprofit corporations. Custodian: Nonprofit board to Board of Governors. Route: `mandatory_audit_delivery`.

Nonprofit boards secure audits and transmit annual reports to the Board of Governors. The statute verifies a delivery obligation distinct from the earlier request process. It supplies governmental oversight but does not require an individual gift list. Its date is unsuitable as a donor-detail onset without an additional public-records analysis.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** §116-30.20, audit requirement and history. [Source 1](https://www.ncleg.gov/EnactedLegislation/Statutes/HTML/BySection/Chapter_116/GS_116-30.20.html).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [NC-1990](#nc-1990).

<a id="nc-2025"></a>

### NC-2025 — North Carolina: Nonprofit donor privacy with public-affiliate exception

**N.C. Session Law 2025-79, Personal Privacy Protection Act.** Effective 2025-12-01. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Nonprofit donor information subject to statute; public-agency-affiliate exceptions apply. Custodian: Public agency. Route: `restriction_on_donor_identifying_disclosure`.

Restricts specified nonprofit donor identifying disclosure, with enumerated exceptions including statutory public-affiliate disclosure. The enacted act supplies a new privacy rule, but earlier donor openness and the public-affiliate exception must be resolved before assigning a net restriction to a university foundation. The December 2025 effective date is outside both supplied outcome panels. It is retained for legal completeness, not used to alter earlier fiscal years.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · unresolved · unresolved · unresolved · unresolved · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** §§55A-18-03 through -06 and act §2. [Source 1](https://www.ncleg.gov/EnactedLegislation/SessionLaws/HTML/2025-2026/SL2025-79.html).

**Remaining gap.** Interaction with affiliate/public-records statutes and previous entitlement; outside FY2004–2024 and FY1989–2021 panels.

<a id="nd-2009"></a>

### ND-2009 — North Dakota: Foundation coverage with pre-existing donor exemption

**N.D. AG Op. 2009-O-08 (June 15, 2009); 2014-O-04; 2014-O-07; N.D.C.C. §44-04-18.15.** Decision/enactment 2009-06-15. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** UND Alumni Association/Foundation. Custodian: Foundation/public custodian under agency relationship. Route: `governmental_agency_records`.

**Conditions.** Governmental agency/delegation relationship

Covered governmental-function or expenditure records accessible subject to donor exemption already present in §44-04-18.15. Coverage does not eliminate the separate donor exemption. This named-entity application should be matched to the corresponding foundation rather than propagated to all North Dakota units. Amount/date/terms remain conditional because the pre-2017 financial-information exemption and its applications require a historical reading; no donor-name opening is established.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · conditional · conditional · conditional · conditional · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion, agency/records analysis and donor-exemption discussion. [Source 1](https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2009-O-08.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [ND-2017](#nd-2017).

<a id="nd-2014-dickinson"></a>

### ND-2014-DICKINSON — North Dakota: Foundation coverage with pre-existing donor exemption

**2014-O-04.** Decision/enactment 2014-04-24. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Dickinson State University Foundation. Custodian: Foundation/public custodian under agency relationship. Route: `governmental_agency_records`.

**Conditions.** Governmental agency/delegation relationship

Covered governmental-function or expenditure records accessible subject to donor exemption already present in §44-04-18.15. Coverage does not eliminate the separate donor exemption. This named-entity application should be matched to the corresponding foundation rather than propagated to all North Dakota units. Amount/date/terms remain conditional because the pre-2017 financial-information exemption and its applications require a historical reading; no donor-name opening is established.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · conditional · conditional · conditional · conditional · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion, agency/records analysis and donor-exemption discussion. [Source 1](https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2014-O-04.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [ND-2017](#nd-2017).

<a id="nd-2014-ndsu"></a>

### ND-2014-NDSU — North Dakota: Foundation coverage with pre-existing donor exemption

**2014-O-07.** Decision/enactment 2014-07-28. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** NDSU Development Foundation. Custodian: Foundation/public custodian under agency relationship. Route: `governmental_agency_records`.

**Conditions.** Governmental agency/delegation relationship

Covered governmental-function or expenditure records accessible subject to donor exemption already present in §44-04-18.15. Coverage does not eliminate the separate donor exemption. This named-entity application should be matched to the corresponding foundation rather than propagated to all North Dakota units. Amount/date/terms remain conditional because the pre-2017 financial-information exemption and its applications require a historical reading; no donor-name opening is established.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · conditional · conditional · conditional · conditional · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion, agency/records analysis and donor-exemption discussion. [Source 1](https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2014-O-07.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [ND-2017](#nd-2017).

<a id="nd-2017"></a>

### ND-2017 — North Dakota: Donor exemption defines financial information to include gift details

**2017 SB2195 §1; N.D.C.C. §44-04-18.15.** Effective 2017. Decision/enactment 2017. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Higher-education bodies/affiliated nonprofits and nonprofits that are public entities under the new subsection. Custodian: Covered public entity/nonprofit. Route: `open_records_with_donor_exemption`.

Adds public-entity nonprofit coverage to the exemption and defines financial information to include gift detail, payment schedule, form and specific amount. The original enrolled act is now retrieved, resolving the earlier source gap. It confirms an explicit gift-information definition, but does not establish that every enumerated item was formerly public: the old exemption already covered financial information. Consequently the row is a clarification with undetermined incremental direction, not a confirmed 2017 donor-name closing. The false 2013-to-2017 identity reversal must not be used in estimation.

**Before → after.** `protected · conditional · conditional · conditional · conditional · protected` → `protected · protected · protected · protected · conditional · protected`. Direction: `undetermined`. 2009-O-08 already applied the donor exemption; financial information was protected before the 2017 definition.

**Anonymity.** Private donor identity already protected before this amendment.

**Hand-check source.** Enrolled SB2195 §1(1)–(3), p.1. [Source 1](https://ndlegis.gov/assembly/65-2017/regular/documents/17-0731-03000.pdf); [Source 2](https://attorneygeneral.nd.gov/wp-content/uploads/2023/02/2009-O-08.pdf).

**Remaining gap.** Earlier interpretation of financial information and exact effective day; separate effect of expanding nonprofit population.

**Related entries.** [ND-2009](#nd-2009), [ND-2014-DICKINSON](#nd-2014-dickinson), [ND-2014-NDSU](#nd-2014-ndsu).

<a id="nj-2013"></a>

### NJ-2013 — New Jersey: NJCU Foundation covered by OPRA

**Dusenberry v. New Jersey City University Foundation, GRC Complaint 2012-82, final decision May 28, 2013.** Decision/enactment 2013-05-28. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** New Jersey City University Foundation. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Instrumentality/public-agency finding; particular request denied as overbroad

GRC held NJCU Foundation an OPRA public agency/instrumentality, but denied the particular request as overbroad. The complaint year 2012 is not the decision year. Donor/fundraising exemptions still apply. The foundation coverage holding is useful, but the actual request was denied. It is not evidence that a donor list was ordered released. Apply the historical donor/solicitation exemptions independently; the current baseline is documented separately.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `no_demonstrated_change`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** GRC 2012-82 final decision, findings and recommendations. [Source 1](https://www.nj.gov/grc/decisions/pdf/2012-82.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [NJ-DONOR](#nj-donor).

<a id="nj-donor"></a>

### NJ-DONOR — New Jersey: OPRA solicitation and conditional donor anonymity baseline

**N.J.S.A. 47:1A-1.1, higher-education records.** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Covered higher-education public agencies; foundation agency status independently required. Custodian: Public agency. Route: `OPRA_request`.

Pursuit-of-contribution records are excluded; donor identity protected when anonymity conditions and no-disqualifying-benefit requirements are met. This baseline should accompany a foundation coverage decision, not be backdated automatically from the current OPRA text. It distinguishes solicitation files from completed gift records and ordinary memorial recognition from other benefits. Gift agreements still require record-specific analysis because they can include both solicitation and donor-identifying information.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `opt_out · conditional · conditional · conditional · conditional · opt_out`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Donation anonymity condition; benefits beyond memorialization/dedication defeat the stated donor exception.

**Hand-check source.** 47:1A-1.1, records maintained by an institution of higher education. [Source 1](https://www.nj.gov/grc/act.html).

**Remaining gap.** Historical clause versions and donor/benefit facts.

<a id="nm-2018"></a>

### NM-2018 — New Mexico: UNM Foundation litigation: statutory exclusion rejected

**Libit v. UNM Foundation, No. D-202-CV-2017-01620 (2d Jud. Dist. Ct. June 26, 2018), affirmed in Libit v. UNM Lobo Club, No. A-1-CA-38255 (N.M. Ct. App. Apr. 21, 2022); NMSA §6-5A-1.** Decision/enactment 2018-06-26. Evidence: `later_primary_account`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** UNM Foundation in Libit I; separate Lobo Club/Libit II issues reserved. Custodian: Foundation. Route: `IPRA_litigation`.

**Conditions.** Public records/functional agency; record-specific exemptions

Later opinion reports the 2018 order and compliance; 2022 rejects blanket statutory exemption while reserving additional donor/coverage questions in separate proceedings. The 2018 order is supported by a later primary judicial account rather than the original order. The appeal should not be treated as the first access event. The record establishes a meaningful foundation-records litigation sequence while expressly leaving important donor and First Amendment questions unresolved. Consequently the donor fields remain unresolved and neither row is a complete donor-treatment assignment.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** April 21, 2022 opinion, background, discussion of §6-5A-1(D), reserved Libit II issues. [Source 1](https://coa.nmcourts.gov/wp-content/uploads/sites/43/2023/11/April-21-2022-Daniel-Libit-v.-University-of-New-Mexico-Lobo-Club-No.-A-1-CA-38255.pdf).

**Remaining gap.** Original 2018 order, record scope/compliance details and subsequent donor-specific rulings.

**Related entries.** [NM-2022](#nm-2022).

<a id="nm-2022"></a>

### NM-2022 — New Mexico: UNM Foundation litigation: statutory exclusion rejected

**Libit v.UNM Lobo Club,A-1-CA-38255.** Decision/enactment 2022-04-21. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** UNM Foundation in Libit I; separate Lobo Club/Libit II issues reserved. Custodian: Foundation. Route: `IPRA_litigation`.

**Conditions.** Public records/functional agency; record-specific exemptions

Later opinion reports the 2018 order and compliance; 2022 rejects blanket statutory exemption while reserving additional donor/coverage questions in separate proceedings. The 2018 order is supported by a later primary judicial account rather than the original order. The appeal should not be treated as the first access event. The record establishes a meaningful foundation-records litigation sequence while expressly leaving important donor and First Amendment questions unresolved. Consequently the donor fields remain unresolved and neither row is a complete donor-treatment assignment.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** April 21, 2022 opinion, background, discussion of §6-5A-1(D), reserved Libit II issues. [Source 1](https://coa.nmcourts.gov/wp-content/uploads/sites/43/2023/11/April-21-2022-Daniel-Libit-v.-University-of-New-Mexico-Lobo-Club-No.-A-1-CA-38255.pdf).

**Remaining gap.** Original 2018 order, record scope/compliance details and subsequent donor-specific rulings.

**Related entries.** [NM-2018](#nm-2018).

<a id="nv-1993"></a>

### NV-1993 — Nevada: Foundation records law with identity and amount exceptions from inception

**1993 Nev. Stats. ch.626, SB322 §1; NRS 396.405.** Effective 1993. Decision/enactment 1993-07-13. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** University foundations within NRS 396.405, including covered community-college foundations. Custodian: Foundation. Route: `foundation_public_records`.

**Conditions.** As defined by cited authority; no additional condition coded

Open-records coverage is enacted together with exceptions for donor identity, individual contribution amount and identifying information; other redacted gift detail may remain accessible. The original statute combines access and donor exceptions. It supplies no evidence of an earlier exemption-free donor regime. The phrase not required to disclose establishes an exception to compulsory access, not by itself a prohibition on voluntary release. Terms and dates are conditional because their release may reveal protected information; they are not expressly equivalent to the protected name/amount categories.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · conditional · conditional · conditional · protected`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Identity/amount exception does not require donor opt-out.

**Hand-check source.** 1993 ch.626 §1; NRS 396.405(1)–(2). [Source 1](https://www.leg.state.nv.us/statutes/67th/Stats199312.html); [Source 2](https://www.leg.state.nv.us/nrs/NRS-396.html).

**Remaining gap.** Exact effective day and earlier baseline; gift-level redaction applications.

<a id="ny-1988"></a>

### NY-1988 — New York: Quoted coverage decision

**Eisenberg v. Goldstein (Sup. Ct., Kings County, Feb. 26, 1988), quoted in COOG FOIL-AO-12685 (May 25, 2001); FOIL-AO-16851 (Oct. 30, 2007); SUNY Policy 9600.** Decision/enactment 1988-02-26. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** Kingsborough Community College Foundation. Custodian: Foundation. Route: `claimed_FOIL_foundation_access`.

**Conditions.** Institutional creation/control or university-held records; organization-specific

The 1988 Kingsborough Community College Foundation case is quoted by COOG; original order not retrieved. Later Farmingdale and Buffalo decisions rejected agency status on different facts. The cited 2001 advisory concerns SUNY Research Foundation, not CUNY; advisories are nonbinding. Different foundations and different legal instruments are involved. This row is a research candidate, not a verified statewide donor transition. The nonbinding advisory and official summaries must be distinguished from original court holdings. Donor-specific record scope and institutional facts remain to be recovered.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Identified COOG advisory or official case summary. [Source 1](https://docsopengovernment.dos.ny.gov/coog/ftext/f12685.htm); [Source 2](https://docsopengovernment.dos.ny.gov/coog/ftext/f16851.htm); [Source 3](https://opengovernment.ny.gov/freedom-information-law-case-summary); [Source 4](https://www.suny.edu/sunypp/documents.cfm?doc_id=140).

**Remaining gap.** Original court order where applicable, donor-specific disposition and comparison of coverage facts.

<a id="ny-2007"></a>

### NY-2007 — New York: Nonbinding coverage advisory

**COOGFOIL-AO-16851.** Decision/enactment 2007-10-30. Evidence: `primary_advisory`. Analysis tier: `candidate`.

**Scope and route.** Stony Brook Foundation. Custodian: Foundation. Route: `claimed_FOIL_foundation_access`.

**Conditions.** Institutional creation/control or university-held records; organization-specific

Stony Brook advisory dated2007, not2008; nonbinding. Different foundations and different legal instruments are involved. This row is a research candidate, not a verified statewide donor transition. The nonbinding advisory and official summaries must be distinguished from original court holdings. Donor-specific record scope and institutional facts remain to be recovered.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Identified COOG advisory or official case summary. [Source 1](https://docsopengovernment.dos.ny.gov/coog/ftext/f12685.htm); [Source 2](https://docsopengovernment.dos.ny.gov/coog/ftext/f16851.htm); [Source 3](https://opengovernment.ny.gov/freedom-information-law-case-summary); [Source 4](https://www.suny.edu/sunypp/documents.cfm?doc_id=140).

**Remaining gap.** Original court order where applicable, donor-specific disposition and comparison of coverage facts.

<a id="ny-2010"></a>

### NY-2010 — New York: Reported noncoverage decision

**Siani v.Farmingdale College Foundation,COOG case summary.** Decision/enactment 2010-11-03. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** Farmingdale College Foundation. Custodian: Foundation. Route: `claimed_FOIL_foundation_access`.

**Conditions.** Institutional creation/control or university-held records; organization-specific

Different foundation held outside FOIL; original order not retrieved. Not necessarily a reversal for Kingsborough. Different foundations and different legal instruments are involved. This row is a research candidate, not a verified statewide donor transition. The nonbinding advisory and official summaries must be distinguished from original court holdings. Donor-specific record scope and institutional facts remain to be recovered.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Identified COOG advisory or official case summary. [Source 1](https://opengovernment.ny.gov/freedom-information-law-case-summary).

**Remaining gap.** Original court order where applicable, donor-specific disposition and comparison of coverage facts.

<a id="ny-2011"></a>

### NY-2011 — New York: Reported noncoverage decision

**Quigley v.UB Foundation,COOG case summary.** Decision/enactment 2011-03-02. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** University at Buffalo Foundation. Custodian: Foundation. Route: `claimed_FOIL_foundation_access`.

**Conditions.** Institutional creation/control or university-held records; organization-specific

Buffalo foundation exclusion demonstrates entity-specific divergence; original order not retrieved. Different foundations and different legal instruments are involved. This row is a research candidate, not a verified statewide donor transition. The nonbinding advisory and official summaries must be distinguished from original court holdings. Donor-specific record scope and institutional facts remain to be recovered.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Identified COOG advisory or official case summary. [Source 1](https://opengovernment.ny.gov/freedom-information-law-case-summary).

**Remaining gap.** Original court order where applicable, donor-specific disposition and comparison of coverage facts.

<a id="ny-oversight"></a>

### NY-OVERSIGHT — New York: Financial oversight and reporting baseline

**SUNY9600.** Observed version 2020; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** SUNY state-operated campus foundations. Custodian: Foundation to campus officials/SUNY. Route: `financial_reporting_or_official_inspection`.

**Conditions.** Institutional creation/control or university-held records; organization-specific

Foundation audits and delivery to public officials are mandatory; university audit access is retained. Current SUNY oversight coexists with different FOIL outcomes for separate foundations. The 1982 audit resolution and later policy history are not donor-disclosure onsets. No claim is made that all CUNY foundations share this route.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** SUNY Policy 9600 §§2–4. [Source 1](https://docsopengovernment.dos.ny.gov/coog/ftext/f12685.htm); [Source 2](https://docsopengovernment.dos.ny.gov/coog/ftext/f16851.htm); [Source 3](https://opengovernment.ny.gov/freedom-information-law-case-summary); [Source 4](https://www.suny.edu/sunypp/documents.cfm?doc_id=140).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="oh-1992"></a>

### OH-1992 — Ohio: Toledo Foundation donor names subject to disclosure

**State ex rel. Toledo Blade Co. v. University of Toledo Foundation, 65 Ohio St.3d 258, 602 N.E.2d 1159 (1992).** Decision/enactment 1992-12-16. Evidence: `primary_excerpt_and_later_primary`. Analysis tier: `dated_access_ruling`.

**Scope and route.** University of Toledo Foundation on its public-office facts. Custodian: Foundation. Route: `Ohio_public_records`.

**Conditions.** Functional equivalent of public office or responsible for public records

Public-office ruling encompasses disclosure of donor names; prospective-donor profile information is a distinct issue. The donor-name holding makes this a promising identity-exposure event for the named foundation. It should not be transformed into an unrestricted statewide gift-agreement mandate. The accessible primary excerpt and later appellate account support the name holding, while a complete official historical original would improve manual verification and the treatment of other gift fields.

**Before → after.** `disputed · unresolved · unresolved · unresolved · unresolved · disputed` → `public · conditional · unresolved · unresolved · unresolved · conditional`. Direction: `expansion`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** 65 Ohio St.3d 258, syllabus/holding; Sheil historical discussion. [Source 1](https://case-law.vlex.com/vid/state-ex-rel-toledo-891364209); [Source 2](https://www.supremecourt.ohio.gov/rod/docs/pdf/8/2018/2018-Ohio-5240.pdf).

**Remaining gap.** Complete original opinion and exact donor transaction scope; entity matching and later exemptions.

<a id="oh-2018"></a>

### OH-2018 — Ohio: Tri-C Foundation functional-equivalence holding

**Sheil v.Horton,2018-Ohio-5240.** Decision/enactment 2018-12-20. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Cuyahoga Community College Foundation. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Functional-equivalence factors applied to named entity

Tri-C Foundation functional-equivalence holding reverses contrary2018Court of Claims decision; two-year-sector application. The court reversed the contrary Court of Claims outcome and ordered an unredacted speaker contract. That is transaction-level access, but not an order to disclose every donor record. Its two-year-sector origin should be preserved in matching.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** 2018-Ohio-5240, functional-equivalence analysis and judgment. [Source 1](https://www.leagle.com/decision/199232365ohiost3d2581272); [Source 2](https://www.supremecourt.ohio.gov/rod/docs/pdf/8/2018/2018-Ohio-5240.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="ok-2007"></a>

### OK-2007 — Oklahoma: Institution discretion to withhold donor information

**51 O.S. §24A.16a; Laws 2007 ch.170 §2.** Effective 2007-05-31. Decision/enactment 2007. Evidence: `codified_text_and_history`. Analysis tier: `candidate`.

**Scope and route.** Institutions/agencies of Oklahoma State System of Higher Education. Custodian: Institution/agency. Route: `institution_public_records`.

Institutions may keep confidential all information pertaining to donors/prospective donors to or for their benefit. This is broad discretionary withholding authority for institution-held donor information, not an independent ruling on every foundation. The codified text and history identify a 2007 addition; the enrolled act and prior entitlement still need comparison before labeling the event a demonstrated restriction. Because release is permissive rather than categorically prohibited by this provision, protected does not mean legally impossible to publish.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · protected · protected · protected · protected`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** No opt-out requirement stated.

**Hand-check source.** §24A.16a, sole paragraph and statutory history. [Source 1](https://law.justia.com/codes/oklahoma/title-51/section-51-24a-16a/).

**Remaining gap.** Original 2007 act, earlier exemptions, and subsequent amendments; 2026 introduced proposals are not coded as law.

<a id="ok-oversight"></a>

### OK-OVERSIGHT — Oklahoma: Institutional auditors may inspect foundation financial records

**70 O.S. §4306(C)–(D); §3907; 51 O.S. §24A.16a.** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Foundations meeting shared-officer/employee and benefit-transfer conditions. Custodian: Foundation to institutional auditors. Route: `official_inspection`.

**Conditions.** Shared officers/employees and provision of funds/services to institution

Covered foundation financial records and workpapers must be available to institutional auditors, excluding donor names. Auditor access is not a public right to obtain foundation books. The 1973 private-status opinion and 2019 settlement provide historical context but do not date this reporting obligation or establish a merits holding of public coverage.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** 70 O.S. §4306(C)–(D). [Source 1](https://law.justia.com/codes/oklahoma/title-70/section-70-4306/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="or-1988"></a>

### OR-1988 — Oregon: University-used foundation budgets public; foundation separately private

**Oregon AG Peter Murphy order, April 22, 1988, summarized in official manual.** Decision/enactment 1988-04-22. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** PSU Foundation budgets prepared/used by university officials. Custodian: University. Route: `university_used_documents`.

Official manual describes public status of specified budgets while foundation itself was not a public body. The two holdings already distinguish public university documents from private foundation books. They do not establish a blanket donor-open regime from 1988. The claimed 2010 closure remains an unverified lead and cannot be interpreted as a reversal of the earlier budget rule.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** 2019 AG manual, Appendix E p.E-4. [Source 1](https://www.doj.state.or.us/wp-content/uploads/2019/07/public_records_and_meetings_manual.pdf).

**Remaining gap.** Original 1988 order and alleged 2010 order; identical record/custodian comparison.

<a id="or-oversight"></a>

### OR-OVERSIGHT — Oregon: Financial oversight and reporting baseline

**Former OAR 580-046-0040; UO Policy I.01.02, University Foundation (July 1, 2014; revised June 30, 2015).** Observed version 2015-06-30; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Former Oregon university-system foundations; UO successor policy. Custodian: Foundation to public university. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Mandatory financial reporting and university inspection continue under the identified successor policy. Governance restructuring requires institution-specific mapping. The rule’s 1989 history entry and UO’s 2014 continuation do not prove when each donor-relevant record first became public.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Former OAR 580-046-0040; UO I.01.02. [Source 1](https://records.sos.state.or.us/ORSOSWebDrawer/Record/8051477/File/document); [Source 2](https://policies.uoregon.edu/vol-1-governance/ch-1-governance-board-affairs/university-foundation).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="pa-2009"></a>

### PA-2009 — Pennsylvania: OOR order requires redacted gift amounts and dates

**OOR order described in995A2d496.** Decision/enactment 2009-04-10. Evidence: `later_primary_account`. Analysis tier: `candidate`.

**Scope and route.** East Stroudsburg University/Foundation contracted fundraising records. Custodian: University. Route: `RTKL_contractor_records`.

**Conditions.** Agency contract for governmental function; directly related records

OOR ordered gift-related amounts, dates and other records disclosed with donor identities redacted; newspaper did not appeal identity redactions. The original OOR order was not independently retrieved. The appellate opinion establishes its date and describes the required redacted production. Use this row as an earlier implementation candidate while checking the original order, appeal and any stay; do not count it separately from the appeal as an independent adoption.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · public · public · conditional · conditional · protected`. Direction: `expansion`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** 2010 opinion, description of April 10, 2009 OOR order and footnote 9. [Source 1](https://law.justia.com/cases/pennsylvania/commonwealth-court/2010/886cd09-5-24-10.html).

**Remaining gap.** Original OOR order and enforceability/compliance before appeal.

**Related entries.** [PA-2010](#pa-2010).

<a id="pa-2010"></a>

### PA-2010 — Pennsylvania: Appeal sustains gift-record access with donor names redacted

**East Stroudsburg University Foundation v. OOR, 995 A.2d 496 (Pa. Commw. Ct. May 24, 2010); RTKL §506(d)(1).** Decision/enactment 2010-05-24. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** East Stroudsburg University/Foundation contracted fundraising; other institutions require statutory matching. Custodian: University. Route: `RTKL_506d_contractor_records`.

**Conditions.** Agency contract for governmental function; directly related records

Affirms governmental-function route for fundraising records; redacted gift amounts/dates remain public. Names protected subject to statutory public-official benefit exception. The requesting newspaper did not challenge the donor-name redactions. This is strong evidence for public gift amounts and dates, but not for public named gifts. The opinion also rejects the unsupported claim that amounts alone necessarily identify donors. Pennsylvania state-related universities have a different statutory regime; this state-system institution’s result must not be assigned mechanically to every university.

**Before → after.** `protected · public · public · conditional · conditional · protected` → `protected · public · public · conditional · conditional · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Ordinary donor identity protected; remuneration/personal tangible benefit to a named public official/employee is a statutory exception.

**Hand-check source.** 995 A.2d 496, discussion of §§506(d), 708(b)(13), and footnote 9. [Source 1](https://law.justia.com/cases/pennsylvania/commonwealth-court/2010/886cd09-5-24-10.html).

**Remaining gap.** Historical RTKL scope for other institutions; original order and gift-agreement redaction details.

**Related entries.** [PA-2009](#pa-2009).

<a id="ri-donor"></a>

### RI-DONOR — Rhode Island: Public-body donor anonymity baseline

**R.I. Gen. Laws §38-2-2(4)(G).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Covered public bodies; foundation applicability unresolved. Custodian: Public body. Route: `APRA_request`.

Donor identity protection applies under the statutory anonymity conditions for public-body gifts. The existence of a donor provision is established, while its application to a separate gift foundation is not. Neither an affirmative statewide donor zero nor a universal foundation opt-out can be inferred. The source does not settle all other transaction fields in this inventory.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `opt_out · unresolved · unresolved · unresolved · unresolved · opt_out`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Anonymity condition under the donor exemption.

**Hand-check source.** §38-2-2(4)(G). [Source 1](https://webserver.rilegislature.gov/Statutes/TITLE38/38-2/38-2-2.htm).

**Remaining gap.** Historical onset, exact covered foundation population and nonidentity gift fields.

<a id="sc-1991"></a>

### SC-1991 — South Carolina: Research foundation public-body coverage

**Weston v. Carolina Research & Development Foundation, 303 S.C. 398, 401 S.E.2d 161 (Feb. 11, 1991); S.C. Code §§30-4-20, 30-4-40(a)(11).** Decision/enactment 1991-02-11. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** Carolina Research and Development Foundation supporting USC. Custodian: Foundation. Route: `public_records_coverage`.

**Conditions.** Receipt/expenditure of public funds on facts

Research/development foundation is covered because of its receipt/expenditure of public funds; donor-specific exceptions are not adjudicated by this row. The research/development mission differs from a purely philanthropic gift foundation. This is a coverage precedent with conditional donor consequences, not a universal public-name rule. The donor anonymity baseline is recorded separately and should not be assumed historically identical.

**Before → after.** `disputed · disputed · disputed · disputed · disputed · disputed` → `conditional · conditional · conditional · conditional · conditional · conditional`. Direction: `expansion`. Public-records coverage or the requested access was disputed; ruling may interpret a pre-existing statute rather than create a new legal duty.

**Hand-check source.** Weston, 401 S.E.2d 161, public-body definition. [Source 1](https://law.justia.com/cases/south-carolina/supreme-court/1991/23341-2.html); [Source 2](https://www.scstatehouse.gov/code/t30c004.php).

**Remaining gap.** Original trial order/stay timeline before appellate affirmance; historical donor exemption and philanthropic-entity matching.

**Related entries.** [SC-DONOR](#sc-donor).

<a id="sc-donor"></a>

### SC-DONOR — South Carolina: Anonymous-gift identity exception with business unmasking

**S.C. Code §30-4-40(a)(11).** Observed version 2026; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Covered public bodies, including foundations meeting coverage tests. Custodian: Covered public body. Route: `FOIA_request`.

Anonymous private donor identity may be withheld, except where donor or immediate family engages in specified business with the public body within the statutory window. This exception is principally about identity. Its text does not make every gift amount or restriction confidential. The contemporary baseline is kept separate from Weston’s 1991 coverage holding because the first date of the donor clause was not reconstructed. Business-trigger evidence is needed to predict which otherwise anonymous donors face disclosure.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `opt_out · conditional · conditional · conditional · conditional · opt_out`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Thresholds.** Business transactions within three years before or after donation.

**Anonymity.** Donor requests anonymity; business exception can defeat identity protection.

**Hand-check source.** §30-4-40(a)(11). [Source 1](https://www.scstatehouse.gov/code/t30c004.php).

**Remaining gap.** Historical donor-clause version and individual trigger facts.

<a id="sd-bor"></a>

### SD-BOR — South Dakota: Board custody accounting for gifts held by approved foundations

**SDBOR Policy 5.9, Foundations.** First operative date untraced. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** SDBOR institutions and approved foundations holding university gifts. Custodian: Foundation to public university/board. Route: `financial_reporting_or_inspection`.

Separately audited accounting, annual custody reports and written agreements are required. Custody of university gifts and general affiliated-entity oversight are different obligations. Neither reviewed provision mandates public individual donor details. Policy history entries do not establish first adoption of the present clauses.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Accounting/reporting and agreement provisions. [Source 1](https://public.powerdms.com/SDRegents/documents/1722940).

**Remaining gap.** Original clause dates and agreement implementation.

<a id="sd-sdsu"></a>

### SD-SDSU — South Dakota: SDSU affiliate reporting and inspection

**SDSU Policy 5:38, Affiliated Entities.** First operative date untraced. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** South Dakota State University affiliated entities. Custodian: Foundation to public university/board. Route: `financial_reporting_or_inspection`.

Affiliate budgets, annual audits and inspection rights are required. Custody of university gifts and general affiliated-entity oversight are different obligations. Neither reviewed provision mandates public individual donor details. Policy history entries do not establish first adoption of the present clauses.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** Accounting/reporting and agreement provisions. [Source 1](https://www.sdstate.edu/sites/default/files/file-archive/2019-12/Affiliated%20Entities.pdf).

**Remaining gap.** Original clause dates and agreement implementation.

<a id="tn-2007"></a>

### TN-2007 — Tennessee: Public annual gift amount/use report and donor confidentiality

**Tenn. Code §49-7-140; 2007 Pub. Acts ch.113 §1.** Effective 2007. Decision/enactment 2007. Evidence: `codified_text_and_history`. Analysis tier: `candidate`.

**Scope and route.** Covered public higher-education institutions/foundations under §49-7-140. Custodian: Institution annual report; AG may inspect additional records. Route: `annual_report_on_request`.

**Conditions.** Annual report available to Tennessee citizens on request; personally identifying information withheld.

Gift report includes the amount of a gift and general description of its use; donor identifying information shall not be open. The report concerns gift amounts and uses, not merely a total foundation audit. That is donor-relevant exposure even with names protected. A general use description is coded summary_only rather than access to the full agreement. The AG’s broader inspection right does not make identities public. The addition year is supported by codified history, but the enrolled act and exact operative day remain to be checked, so the row stays in the candidate tier.

**Before → after.** `unresolved · not_required · not_required · not_required · not_required · unresolved` → `protected · public · not_required · summary_only · unresolved · protected`. Direction: `expansion`. Statutory history identifies the annual gift-report provision as added in 2007; the original act has not been independently read.

**Anonymity.** No donor opt-out needed for personally identifying protection.

**Hand-check source.** §49-7-140, gift confidentiality and annual report paragraphs; history. [Source 1](https://law.justia.com/codes/tennessee/title-49/chapter-7/part-1/section-49-7-140/).

**Remaining gap.** Enrolled ch.113 and exact effective date; report grouping/redaction practices.

<a id="tn-2011-case"></a>

### TN-2011-CASE — Tennessee: Named-foundation public-records exclusion

**Gautreaux v.Internal Medicine Education Foundation.** Decision/enactment 2011-02-28. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Internal Medicine Education Foundation. Custodian: Foundation. Route: `rejected_direct_foundation_request`.

**Conditions.** As defined by cited authority; no additional condition coded

Named foundation not a functional equivalent of a governmental agency. The foundation’s medical-education role and facts require careful matching to a donation panel. Separate gift-report and UT expenditure statutes are not nullified by this named-entity ruling.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · protected · protected · protected · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion/order, public-body analysis and disposition. [Source 1](https://law.justia.com/cases/tennessee/supreme-court/2011/e2008-01473-sc-r11-cv-25.html).

**Remaining gap.** Other custodians/routes and changing entity facts; no demonstrated prior donor-open state.

<a id="tn-2011"></a>

### TN-2011 — Tennessee: UT foundation expenditure records

**Tenn. Code §49-9-113(e)(2); 2011 Pub. Acts ch.59.** Effective 2011-04-11. Evidence: `codified_text_and_official_history`. Analysis tier: `context_only`.

**Scope and route.** University of Tennessee foundation under §49-9-113. Custodian: UT foundation. Route: `expenditure_records`.

**Conditions.** As defined by cited authority; no additional condition coded

Expenditure records are publicly inspectable; no new donor-name or gift-agreement right established by this provision. The expenditure rule is separate from the 2007 gift-report route. Its original chapter PDF was not retrieved, although official history confirms the act and April 11 effective date. It should not replace the gift-report event as a donor exposure onset.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** §49-9-113(e)(2); official bill history. [Source 1](https://law.justia.com/codes/tennessee/title-49/chapter-9/part-1/section-49-9-113/); [Source 2](https://wapp.capitol.tn.gov/apps/BillInfo/Default?BillNumber=HB0306&ga=107).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [TN-2007](#tn-2007).

<a id="tx-1991"></a>

### TX-1991 — Texas: University-held joint-campaign donor names and amounts accessible

**Texas Attorney General Open Records Decision 590, July 3, 1991.** Decision/enactment 1991-07-03. Evidence: `primary_text`. Analysis tier: `dated_access_ruling`.

**Scope and route.** West Texas State University-held joint-campaign records. Custodian: University. Route: `institution_records_request`.

**Conditions.** As defined by cited authority; no additional condition coded

AG rejected asserted withholding grounds for donor names/amounts in university-held joint campaign records. The retrieved original establishes an institution-held donor-information route. It is not a decision that every independent Texas foundation is a governmental body. The finding supports a scoped earlier disclosure baseline for comparison with the 2003 statute; a statewide panel still needs records-custodian and institutional matching.

**Before → after.** `disputed · disputed · unresolved · unresolved · unresolved · disputed` → `public · public · unresolved · unresolved · unresolved · public`. Direction: `expansion`. University sought to withhold requested fundraising records under the asserted exceptions.

**Hand-check source.** ORD-590, analysis and conclusion, pp.1–5. [Source 1](https://www.texasattorneygeneral.gov/sites/default/files/ord-files/ord/2020/ord19910590.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [TX-2003](#tx-2003).

<a id="tx-2003"></a>

### TX-2003 — Texas: Donor identity exemption includes intermediary gifts

**2003 Acts ch.1266, SB1652 §§4.07, 4.12; Gov. Code §552.1235.** Effective 2003-06-21. Decision/enactment 2003-06-21. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Covered institutional records of private gifts directly or through intended intermediaries. Custodian: Public institution/covered governmental custodian. Route: `public_information_request`.

Protects donor identifying information; preserves other gift information including amount/value. Intermediary language is already in the original 2003 act. The original act establishes the donor restriction and already includes gifts through an intended intermediary. It expressly reaches requests made before enactment, a useful contrast with Connecticut’s grandfathering. The code history gives June 20, while official bill history records signature and immediate effect June 21; the latter is retained with the discrepancy flagged. The 2011 enacted SB602 changes the heading; proposed SB375 did not become law. Neither supplies a verified 2011 extension to intermediary gifts.

**Before → after.** `public · public · unresolved · unresolved · unresolved · public` → `protected · public · conditional · conditional · conditional · protected`. Direction: `restriction`. ORD-590 rejected the asserted exemptions for university-held names/amounts; this is a scoped earlier baseline, not proof of universal foundation openness.

**Anonymity.** No written opt-out election required by enacted §552.1235.

**Existing gifts.** §4.12 applies to requests made before, on or after the effective date; no new-gifts-only limit stated.

**Date qualification.** Official bill history and comptroller compilation indicate June 21, 2003; code history prints June 20. June 21 is used provisionally; retain one-day discrepancy for hand audit.

**Hand-check source.** SB1652 §§4.07 and 4.12; bill-history signature/effective entries. [Source 1](https://capitol.texas.gov/tlodocs/78R/billtext/html/SB01652F.htm); [Source 2](https://capitol.texas.gov/billlookup/History.aspx?LegSess=78R&Bill=SB1652); [Source 3](https://tcss.legis.texas.gov/resources/GV/htm/GV.552.htm).

**Remaining gap.** Resolve official one-day effective-date discrepancy and the effect of the 2011 confidentiality heading on voluntary disclosure; historical institution/custodian matching.

**Related entries.** [TX-1991](#tx-1991).

<a id="tx-oversight"></a>

### TX-OVERSIGHT — Texas: Financial oversight and reporting baseline

**UH System SAM 08.A.02 §§4–5 (issued Oct. 15, 1990; revised Aug. 30, 2023); Tex. AG ORD-590 (July 3, 1991); Gov. Code §552.1235.** Observed version 2023-08-30; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UH System affiliated foundations. Custodian: Foundation to UH System. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Foundation financial reporting and university oversight are mandatory. The policy’s 1990 issue date cannot date every present clause. This route is separate from ORD-590’s university-held fundraising records and the 2003 donor exemption.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** SAM 08.A.02 §§4–5. [Source 1](https://uhsystem.edu/resources/compliance-ethics/uhs-policies/sams/08-advancement-and-alumni/08a02/index.php); [Source 2](https://www.texasattorneygeneral.gov/sites/default/files/ord-files/ord/2020/ord19910590.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="ut-2020"></a>

### UT-2020 — Utah: Nonprofit donor-privacy law with statutory-disclosure exceptions

**2020 SB171, Nonprofit Entities Amendments; former Utah Code ch.63G-24.** Effective 2020. Decision/enactment 2020. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** Public agencies including public higher education; nonprofit donor information within act. Custodian: Public agency. Route: `restriction_on_collection_or_release`.

Prohibits specified compelled collection/release of nonprofit donor identifying information, but preserves express legally required disclosure and other exceptions. The original act contains a material exception for disclosure expressly required by law, as well as other exceptions and auditor access. That interaction must be resolved before treating it as closing an existing university donor route. The row therefore records a verified new privacy law but leaves incremental exposure direction undetermined. Later renumbering to chapter 26 and later amendments must not be backfilled into the 2020 text.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `conditional · unresolved · unresolved · unresolved · unresolved · conditional`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** General nonprofit privacy protection; no individual opt-out election required.

**Hand-check source.** Enrolled SB171, §63G-24-103(1)–(3). [Source 1](https://le.utah.gov/~2020/bills/sbillenr/SB0171.htm).

**Remaining gap.** Exact effective day, original prior disclosure entitlement, interaction with GRAMA, and later amendment history.

**Related entries.** [UT-DONOR](#ut-donor).

<a id="ut-donor"></a>

### UT-DONOR — Utah: Government-held donor anonymity with terms exception

**Utah Code §63G-2-305(37), cited governmental-records provision.** Observed version 2025; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `baseline_only`.

**Scope and route.** Covered governmental entities, including qualifying public institutions; foundation coverage unresolved. Custodian: Governmental entity. Route: `GRAMA_request`.

Written requested anonymity protects donor identity; terms, conditions, restrictions and privileges relating to a donation are not protected under this donor paragraph. This provision preserves gift language even when a donor seeks anonymity. Other exemptions can still matter, so public here means the donor paragraph does not itself shield terms and privileges; it is not an exhaustive legal conclusion about every record. The separate-foundation coverage question remains open.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `opt_out · conditional · conditional · public · public · opt_out`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Anonymity.** Written request for anonymity, subject to stated statutory conditions.

**Hand-check source.** §63G-2-305, donor-anonymity paragraph (37) in cited version. [Source 1](https://law.justia.com/codes/utah/title-63g/chapter-2/part-3/section-305/).

**Remaining gap.** Original clause date and interaction with later nonprofit donor privacy law; numbering changes across versions.

<a id="va-2019"></a>

### VA-2019 — Virginia: Reported GMU Foundation exclusion

**Transparent GMU v.GMU,No181375.** Decision/enactment 2019-12-12. Evidence: `official_summary`. Analysis tier: `candidate`.

**Scope and route.** George Mason University Foundation. Custodian: Foundation. Route: `direct_foundation_FOIA`.

**Conditions.** As defined by cited authority; no additional condition coded

Official FOIA Council report describes the Supreme Court foundation exclusion; original opinion not retrieved. The reported exclusion concerns foundation-held books. The 2020 law’s university-held gift documentation is a different route, so the sequence should not be called a literal reversal of the same entity-status holding.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** FOIA Council 2019 annual report (HD4, 2020), Transparent GMU discussion. [Source 1](https://rga.lis.virginia.gov/Published/2020/HD4).

**Remaining gap.** Original Supreme Court opinion, prior trial timeline and remaining university-held routes.

**Related entries.** [VA-2020-TERMS](#va-2020-terms).

<a id="va-2020-report"></a>

### VA-2020-REPORT — Virginia: Annual foundation expenditure totals and category shares

**Va. Code §23.1-108; 2020 Acts ch.511.** Effective 2020-07-01. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** Covered Virginia public institutions excluding VCCS under this provision. Custodian: Public institution report. Route: `annual_aggregate_report`.

Annual report gives foundation expenditure total and category percentages; does not require individual donation details. This expenditure report should be separated from the same-year gift-terms law. Aggregate foundation spending is not a measure of the probability that a particular donor’s identity or agreement will be disclosed.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** §23.1-108. [Source 1](https://law.lis.virginia.gov/vacode/title23.1/chapter1/section23.1-108/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

**Related entries.** [VA-2020-TERMS](#va-2020-terms).

<a id="va-2020-terms"></a>

### VA-2020-TERMS — Virginia: Public documentation of specified gifts imposing university obligations

**Va. Code §23.1-1304.1; 2020 Acts ch.691.** Effective 2020-07-01. Evidence: `primary_text`. Analysis tier: `documented_statutory_change`.

**Scope and route.** Public institutions governed by the provision; gifts to institution or associated foundation meeting triggers. Custodian: Public institution retains gift documentation. Route: `required_documentation_subject_to_FOIA`.

Requires documentation of terms for gifts directing academic decisions or qualifying gifts imposing new obligations; retained documentation subject to FOIA. The mechanism is a duty to create and retain public-institution documentation of gift terms, including terms of qualifying foundation gifts. It does not declare all foundation books public. A gift below $1 million can still qualify through academic-control provisions. Exact donor names and amounts remain conditional on documentation and exemptions. The separate §23.1-108 report excludes the community-college system; that exclusion should not be transplanted into this terms provision.

**Before → after.** `unresolved · unresolved · unresolved · conditional · conditional · unresolved` → `conditional · conditional · conditional · trigger_only · trigger_only · conditional`. Direction: `expansion`. Existing university-held records could be subject to FOIA, but this specified gift-documentation duty is newly enacted.

**Thresholds.** Any gift with specified academic direction; gifts >=$1 million imposing a new obligation, excluding student financial aid.

**Hand-check source.** §23.1-1304.1(A)–(B); history 2020 ch.691. [Source 1](https://law.lis.virginia.gov/vacode/23.1-1304.1/).

**Remaining gap.** Map qualifying gift types, historical retained records and applicable identity exemptions; verify enactment/anticipation date.

<a id="vt-base"></a>

### VT-BASE — Vermont: Financial oversight and reporting baseline

**UVM Policy V.2.1.2, Affiliated Organizations (effective May 15, 2017; predecessor Apr. 7, 2011; reaffirmed Nov. 25, 2024).** Observed version 2024-11-25; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UVM affiliated organizations/component units. Custodian: Affiliate to UVM. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Affiliation agreements require financial reports and university inspection; component units supply audited statements. The policy identifies a 2017 effective version and a 2011 predecessor. The original reporting clauses were not traced. This is a UVM duty, not a finding covering every Vermont foundation.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** UVM V.2.1.2, agreement and financial reporting provisions. [Source 1](https://www.uvm.edu/policies/affiliated-organizations).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="wa-2020"></a>

### WA-2020 — Washington: Reported Clark College Foundation exclusion

**Clark College Foundation reported judgment.** Decision/enactment 2020-12-03. Evidence: `secondary_only`. Analysis tier: `candidate`.

**Scope and route.** Clark College Foundation. Custodian: Foundation. Route: `claimed_direct_foundation_PRA`.

**Conditions.** As defined by cited authority; no additional condition coded

Foundation account reports court exclusion; original court order not retrieved. The foundation’s account supplies a retrieval lead, not a verified donor-field judgment. RCW 42.56.320(4), concerning access restrictions on gifted materials, does not establish a general anonymity option for cash gifts. Neither source supports a statewide donor zero.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved`. Direction: `undetermined`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Foundation legal-ruling announcement. [Source 1](https://clarkcollegefoundation.org/legal-ruling/).

**Remaining gap.** Original judgment and scope; alternative public-college custody.

<a id="wi-oversight"></a>

### WI-OVERSIGHT — Wisconsin: Financial oversight and reporting baseline

**UW Regent Policy Document 21-9, adopted Dec. 7, 2017 (Res.10969), Appendix A; amended Feb. 8, 2019; implementation memo Aug. 21, 2026.** Observed version 2017-12-07; first onset not assigned from version alone. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UW affiliated foundations with required MOUs. Custodian: Foundation to UW institution. Route: `financial_reporting_or_official_inspection`.

**Conditions.** As defined by cited authority; no additional condition coded

Required agreements contain financial reports, tiered audit/review and institutional access. Board adoption is documented, but institution-specific agreement implementation may differ. The 2019 executive economic-interest filing provision and 2026 renewal guidance do not themselves create public access to donor names.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** RPD 21-9; Appendix A. [Source 1](https://www.wisconsin.edu/regents/policies/institutional-relationships-with-foundations/); [Source 2](https://www.wisconsin.edu/regents/download/policy_attachment/RPD-21-9-Appendix-A.pdf); [Source 3](https://www.wisconsin.edu/regents/download/RPD-21-9-Guidance-Memo---AUG-21-2026.pdf).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

<a id="wv-1989"></a>

### WV-1989 — West Virginia: Named-foundation public-records exclusion

**4-H Road,388S.E.2d308.** Decision/enactment 1989-12-20. Evidence: `primary_text`. Analysis tier: `rule_or_ruling_without_demonstrated_donor_change`.

**Scope and route.** WVU Foundation. Custodian: Foundation. Route: `rejected_direct_foundation_request`.

**Conditions.** Private creation and funding

Foundation excluded from FOIA on creation/funding facts. The exclusion supplies a scoped legal finding, not evidence that no donor details can reach a public university or other public custodian. No prior open regime is established, so it is not coded as a restriction event.

**Before → after.** `unresolved · unresolved · unresolved · unresolved · unresolved · unresolved` → `protected · protected · protected · protected · protected · protected`. Direction: `no_demonstrated_change`. Earlier donor-detail entitlement not established by this review.

**Hand-check source.** Opinion/order, public-body analysis and disposition. [Source 1](https://law.justia.com/cases/west-virginia/supreme-court/1989/18858-5.html).

**Remaining gap.** Other custodians/routes and changing entity facts; no demonstrated prior donor-open state.

<a id="wy-2001"></a>

### WY-2001 — Wyoming: Endowment matching-program reporting

**Wyo. Stat. §21-16-904(a)(vii); 2001 ch.197, SF0182/SEA71.** Decision/enactment 2001. Evidence: `primary_text`. Analysis tier: `context_only`.

**Scope and route.** UW Foundation state endowment matching program. Custodian: Foundation through university to treasurer/governor/legislature. Route: `program_financial_summary`.

**Conditions.** Participation in statutory matching program

Foundation supplies program financial summary and accomplishments report to state recipients. This is a state-enacted foundation reporting duty, but its content does not require donor names or individual gift agreements. The program’s matching incentives themselves affect fundraising. Any use of the event as a transparency shock must separate reporting from the matching subsidy and later program changes.

**Coding.** All six after-fields are `not_required`; direction `no_demonstrated_change` concerns donor detail, not the existence of the oversight obligation.

**Hand-check source.** 2001 enrolled SF0182, §21-16-904(a)(vii). [Source 1](https://wyoleg.gov/2001/enroll/sf0182.htm); [Source 2](https://wyoleg.gov/2001/index/subjdex.htm); [Source 3](https://law.justia.com/codes/wyoming/title-21/chapter-16/article-9/section-21-16-904/).

**Remaining gap.** Institution-level coverage and subsequent history require matching before estimation.

## 6. Audit trail and remaining historical work

The donor inventory preserves the earlier reconciliation outputs and source folder. It adds transaction-focused rules, splits donor rules from aggregate oversight, and merges enactment/effective-date duplicates. It omits duplicative affirmances, untraced amendment-history entries, general non-foundation analogies and voluntary publication practices as independent donor events. The supplied pass-B IDs remain where a row draws on that inventory; blank IDs denote new donor-focused additions. Thus this is a curated replacement for the donor-exposure purpose, not a claim that each of the old 96 event rows survives one-for-one.

The strongest additional corrections are substantive. Pennsylvania’s record-access decision does not make ordinary donor identities public. Kentucky’s 2008 decision does not grant a general prospective anonymity option. California’s statutory exceptions include noncompetitive contracts within five years as well as quid pro quo and self-dealing; the inflation-adjusted dollar trigger concerns a benefit, not gift size. Arizona’s donor rule is §15-1640(A)(3), and California’s CSU donor provision is §89916. These pinpoint distinctions are reflected in the dataset.

The original Texas SB1652 confirms that intermediary gifts were included in 2003 and applies the new section to earlier as well as later requests. This corrects the earlier audit’s suggestion of a later intermediary extension. Its legislative history records June 21, 2003 immediate effect, while codified history prints June 20; the event retains June 21 provisionally with the conflict explicit. SB602’s 2011 heading amendment is not coded as a new intermediary-gift restriction, and SB375’s proposed opt-out language is not enacted law. [Original act §§4.07, 4.12](https://capitol.texas.gov/tlodocs/78R/billtext/html/SB01652F.htm), [official 2003 history](https://capitol.texas.gov/billlookup/History.aspx?LegSess=78R&Bill=SB1652), [enrolled SB602 §15](https://capitol.texas.gov/tlodocs/82R/billtext/html/SB00602F.htm), [SB375 history](https://capitol.texas.gov/billlookup/History.aspx?Bill=SB375&LegSess=82R).

High-priority archival work is concentrated in identifiable places: Georgia’s original 2005 act and earlier business-trigger interpretation; Oklahoma and Tennessee’s original 2007 acts; earlier Louisville coverage/notice dates; trial-order/stay timelines in Illinois and Pennsylvania; New Mexico’s original 2018 order and reserved donor questions; full historical Ohio donor holdings; original Arkansas, New York, Virginia and Washington decisions; and first versions of baseline donor exemptions. A broader follow-up should also search general nonprofit donor-privacy enactments and subsequent constitutional decisions across all jurisdictions. The targeted review here cannot establish that unlisted cross-cutting laws are absent.

For manual verification, start with the event’s exact pinpoint, confirm that the linked text is enacted or judicially issued rather than proposed, check the date and recipient definition, and compare the earlier rule for the **same** entity, custodian and gift field. Then inspect anonymity conditions, thresholds, retention/redaction provisions, pending-request rules, grandfathering and later history. This is the evidentiary bridge from the event inventory to a defensible empirical treatment variable.

The accompanying files were checked for unique event IDs, complete disclosure codes, consistent date precision, valid related-event references, source links/pinpoints, agreement of CSV and appendix entries, and coverage of all 51 jurisdictions. These structural checks do not substitute for the legal research gaps identified above.
