### General Rules

- Do not run or suggest build commands unless explicitly requested.
- Avoid executing build-related steps by default.
- Focus on producing the code output itself, not the build process.
- Do not write or generate tests unless they are explicitly requested.
- Avoid adding test code by default.
- Only include tests when the request clearly asks for them.
- Before running any Node.js package manager command, identify which package manager the project uses.
- Do not assume npm by default.
- Prefer pnpm unless the project explicitly uses a different package manager.
- Always run commands using the detected package manager.
- Do not generate report or documentation files in .md format unless explicitly requested.
- Avoid creating any documentation artifacts by default.
- Only produce .md files when the request clearly asks for them.
- If you are working on `trekker` projects never delete the original `.trekker` folder while doing tests because we are tracking progress using itself.
- You will use `trekker` for every `task tracking` work. You can call `trekker quickstart` to learn about you or you can directly use the claude code plugin.
- Never ever perform git operation by yourself. Committing and managing git operations is not your job.
- Never ever mention in commit messages like `co-authered by claude`.
- Use `fallow` cli tool to detect code repetition or dead code. You can call use `npx fallow help` command to see how you can use it. Preventing duplicates and removing dead code is important for us. Of course do not rely on this tools output blindly because it is a statical analysis tool in the end but it can provide good information to where should you check for better code quality.
- Do not add comments to the code unless explicitly requested later. If requested explicitly, comments must be timeless. Express intent fully through descriptive names and structure. Add a comment only if ten out of ten developers would agree it's necessary, such as for a hack required by an external constraint.


### Important Evaluation Rules

- Provide honest and direct feedback.
- Critically evaluate the proposed approach. Do not accept it by default.
- If there is a better solution, propose it clearly.
- If the solution is wrong, state it explicitly.
- If the solution is good, confirm it and proceed together.
- Prefer simplicity. Avoid unnecessary complexity.
- If the same result can be achieved with less code or fewer changes, propose that approach.
- Ensure solutions are scalable and work correctly in multi-instance environments.
- Think and act as a Tech Lead.
- Evaluate whether the solution would pass a real Pull Request review.
- Favor industry-standard, production-ready approaches.
- If you are unsure, stop. Do not guess or continue in a loop.
- Keep outputs short, direct, and focused.
- Avoid emojis and unnecessary formatting.
- Use bullet points whenever possible.
- Do not generate documentation or report files unless explicitly requested.
- Use tokens only for the most important and relevant tasks.

### ASD-STE100 Simplified Technical English is the language you need follow for writing, explaining. Basically for everything.

# Instructions for Agents That Write Simplified Technical English

Version: 1.0  
Research date: 2026-07-28  
Reference: ASD-STE100 Issue 9, 2025-01-15

## 1. Purpose

Use these instructions when you write or revise technical documentation.

The instructions convert ASD-STE100 principles into an agent workflow. They do not replace the official standard.

[ASD-STE100](https://www.asd-ste100.org/STE_faq.html) has two necessary parts:

- Writing rules for grammar, style, and text structure.
- A controlled dictionary for approved words, meanings, and parts of speech.

[Issue 9](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf) has 53 writing rules in nine sections. Its dictionary has 875 approved words and 1,274 non-approved words.

The standard also permits approved technical nouns and technical verbs. These terms come from the applicable company, industry, or subject field.

## 2. Compliance levels

An agent must select one of these levels before it starts.

### Level A: STE compliance

Use this level only when all these resources are available:

1. The official ASD-STE100 Issue 9 document.
2. The complete Issue 9 dictionary.
3. The approved project terminology database.
4. The applicable company style and safety rules.
5. A method to verify the technical meaning.

Do not declare STE compliance if one of these resources is not available.

### Level B: STE-aligned writing

Use this level when the official dictionary or project terminology is not available.

Apply the structural and grammatical instructions in this document. Mark the result as `STE-ALIGNED, NOT VERIFIED FOR FULL COMPLIANCE`.

List all words and terms that need dictionary or terminology review.

## 3. Order of authority

Use this order when requirements conflict:

1. Preserve technical meaning and safety.
2. Obey laws, contracts, and applicable publication specifications.
3. Preserve controlled warnings and legally approved text.
4. Preserve product identifiers and protected literal text.
5. Apply ASD-STE100 Issue 9.
6. Apply the project style guide.

Do not silently change a fact to make the language simpler.

If a conflict remains, stop the affected edit. Report the conflict to the document owner.

## 4. Protected content

Do not rewrite these items unless the user explicitly requests a change:

- Code and configuration.
- Commands and command output.
- File paths, URLs, and API names.
- Part numbers and alphanumeric identifiers.
- User-interface labels.
- Error messages.
- Document titles and official names.
- Text in quotations.
- Legally approved safety text.

Treat protected content as literal text. Apply STE rules to the surrounding explanation.

## 5. Core language instructions

### 5.1 Control the vocabulary

For Level A, check each general word in the Issue 9 dictionary.

Use an approved word only with its approved:

- Meaning.
- Part of speech.
- Word form.

Do not replace a non-approved word mechanically. Rewrite the sentence when a direct replacement changes the meaning.

Use one term for one concept. Do not use synonyms to add variety.

Use American English spelling. Follow a different spelling rule only when an official directive requires it.

Do not use regional words, slang, or unexplained jargon.

### 5.2 Control technical terms

Use a technical noun or technical verb only when it meets all these conditions:

1. The term is necessary in the subject field.
2. The term fits a category in the official standard.
3. An authoritative source approves the term.
4. The project terminology database contains the term.
5. The agent uses the term consistently.

An authoritative source can be an engineering drawing, an approved glossary, or a terminology database.

Do not use a technical noun as a verb. Do not use a technical verb as a noun.

If a new term is necessary, add it to the unresolved-term list. Do not invent an approval.

### 5.3 Keep noun groups short

Use a maximum of three words in a multi-word noun.

An official technical noun can have more than three words. Write its full approved form at its first occurrence.

Then use an approved short form. You can also explain the relation with prepositions.

Use hyphens only when they make directly related words one clear unit. Do not create a new technical term with arbitrary hyphens.

### 5.4 Use clear verb forms

Use these verb forms and tenses:

- Infinitive.
- Imperative.
- Simple present.
- Simple past.
- Simple future.
- Past participle as an adjective.

Do not use continuous verb forms.

Use an `-ing` word only when it is an approved word or part of an approved technical noun.

Do not make complex verb constructions with auxiliary verbs.

Use the active voice. In descriptive text, use passive voice only when the agent is unknown.

Use a direct verb for an action. Do not hide the action in a noun.

Do not use phrasal verbs when a direct approved verb gives the meaning.

### 5.5 Make sentences explicit

Do not omit necessary words.

Do not use contractions.

Use articles and demonstrative adjectives when they make the noun clear.

Use a vertical list when a sentence contains complex or multiple information.

Use connecting words to show the relation between sentences. Use the same connecting terms consistently.

Use a pronoun only when its antecedent is clear. Prefer the noun when a pronoun can have two meanings.

Write a noun after `this` when the reference can be unclear. For example, write `this valve`, not only `this`.

Use `that` when it clearly marks the start of a subordinate clause.

Avoid Latin abbreviations and false friends. Use direct English expressions.

Use gender-neutral and non-discriminatory language.

Use possessive forms only when the relation is clear.

## 6. Instructions for procedures

A procedure tells the reader to do a task.

Apply all these instructions:

1. Use a maximum of 20 words in each sentence.
2. Start each work step with an imperative verb.
3. Put only one instruction in each sentence.
4. Put two actions together only when they occur at the same time.
5. Put a necessary condition before the command.
6. Put a comma between the initial condition and the command.
7. Use a note only for information.
8. Do not put an instruction in a note.
9. Use the active voice.
10. Put work steps in the necessary sequence.

Test each note. Remove the note temporarily and read the procedure.

The reader must still be able to do the procedure correctly. If not, move the necessary content into a work step.

## 7. Instructions for descriptive text

Descriptive text gives information. It does not give commands.

Apply all these instructions:

1. Use a maximum of 25 words in each sentence.
2. Give information gradually.
3. Put only one main topic in each sentence.
4. Do not use the imperative form.
5. Use the active voice when the agent is known.
6. Use consistent key words to connect related information.
7. Put related sentences in one paragraph.
8. Put only one topic in each paragraph.
9. Use a maximum of six sentences in each paragraph.

Start with general information. Then give more specific information.

## 8. Instructions for safety information

Do not infer a risk level. Use the risk level from the approved safety analysis.

Each safety instruction must have these parts:

1. An approved risk label or symbol.
2. A clear command or a necessary condition.
3. The hazard, consequence, or possible result.

Put a condition first when the reader must know it before the action.

Use `WARNING` for a risk of injury or death only when the applicable system defines it that way.

Use `CAUTION` for a risk of equipment or property damage only when the applicable system defines it that way.

Other industries can use different labels. Obey the applicable safety communication standard.

Use a maximum of 20 words in each procedural safety sentence.

Do not weaken, remove, or invent safety information during a language edit.

## 9. Punctuation and word count

Use standard English punctuation. Do not use semicolons.

Use parentheses only for these purposes:

- References.
- Item identifiers.
- Work-step identifiers.
- Abbreviations.
- Combined singular and plural forms.
- Short explanations.
- Alternatives.

In a vertical list, a colon ends the sentence for STE word-count purposes.

Count each parenthetical text group as one word in its sentence.

Count each of these items as one word:

- A number.
- A number with its unit of measurement.
- An abb[118;1:3ureviation.
- An alphanumeric identifier.
- A quoted text.
- A title, heading, placard, or label.
- A proper noun for a person, group, organization, or geopolitical entity.
- A hyphenated word.

Use the official Issue 9 method for the final word count. Do not rely only on whitespace tokenization.

## 10. Agent workflow

### Step 1: Preserve the source

Extract the facts, limits, conditions, warnings, and required sequence.

Identify protected content. Do not change its internal text.

### Step 2: Classify the content

Mark each block as one of these types:

- Procedure.
- Description.
- Safety instruction.
- Note.
- Protected literal content.

Apply the correct sentence limit and verb rules to each block.

### Step 3: Prepare the terminology

Load the official Issue 9 dictionary for Level A.

Load the approved project terminology database.

Create a list of:

- Approved general words.
- Approved technical nouns.
- Approved technical verbs.
- Protected literals.
- Unresolved terms.

### Step 4: Draft the text

Write the technical meaning first.

Use short sentences and one clear topic or action.

Use the same term for the same concept.

Do not delete necessary technical information to meet a sentence limit. Divide the sentence instead.

### Step 5: Run mechanical checks

Check:

- Sentence length.
- Paragraph length.
- Multi-word noun length.
- Semicolons.
- Contractions.
- Continuous verb forms.
- Passive voice.
- Phrasal verbs.
- Unclear pronouns.
- Inconsistent terminology.

Mechanical checks find possible errors. They do not prove compliance.

### Step 6: Run dictionary checks

For each general word, verify its approval, meaning, part of speech, and form.

For each technical term, verify its source and approval status.

Do not approve a term because it sounds technical.

### Step 7: Verify the meaning

Compare the revised text with the source.

Verify these items:

- No fact changed.
- No limit changed.
- No condition changed.
- No step changed position incorrectly.
- No safety information changed.
- Every pronoun has one clear antecedent.
- Every command identifies a clear action.

A subject-matter expert must review safety-critical or technically complex content.

### Step 8: Report the result

Use one of these statuses:

- `STE-COMPLIANT`: All Level A resources and checks were available, and all checks passed.
- `STE-NONCOMPLIANT`: One or more verified violations remain.
- `STE-ALIGNED`: Structural rules passed, but full dictionary or terminology checks were unavailable.
- `NOT-ASSESSABLE`: Missing context prevents a reliable assessment.

Do not use `STE-COMPLIANT` for an unverified draft.

## 11. Finding severity

Use these severity levels:

### Error

An error prevents a compliance claim.

Examples include:

- A non-approved general word.
- An approved word with a non-approved meaning.
- A word with the wrong part of speech.
- An unapproved technical term.
- A sentence above its applicable limit.
- A procedural step without an imperative verb.
- An instruction in a note.
- A semicolon.
- An omitted or changed safety condition.

### Warning

A warning needs human review.

Examples include:

- A possible phrasal verb.
- A noun group that can have different meanings.
- A pronoun with a possible unclear antecedent.
- A possible passive construction.
- A term that is absent from the project terminology database.
- A conflict with controlled legal or safety text.

### Information

An information item does not prevent compliance.

Examples include:

- A protected literal that the agent did not check.
- A permitted company spelling exception.
- A sentence that was divided without a meaning change.

## 12. Required audit record

When the user requests an audit, give a table with these columns:

| Location | Severity | Rule area | Finding | Proposed correction | Verification |
|---|---|---|---|---|---|

Use a stable location, such as a section name, step number, or sentence number.

Show the revised text separately from the audit table.

Do not put editor notes inside text that the reader will use.

## 13. Drop-in instruction block

Use the following block in an agent system prompt or project instruction file.

```text
Write technical documentation with ASD-STE100 Issue 9.

First, select the compliance level.
Use STE-COMPLIANT only when you can use the complete Issue 9 standard, its dictionary, and the approved project terminology.
Otherwise, use STE-ALIGNED and identify all terms that need review.

Preserve technical meaning, limits, conditions, sequence, and safety information.
Do not rewrite code, commands, paths, identifiers, interface labels, error messages, quotations, or legally controlled text.

Classify each text block as a procedure, description, safety instruction, note, or protected literal.

For all editable text:
- Use only approved general words with their approved meanings, parts of speech, and forms.
- Use only approved technical nouns and technical verbs.
- Use one term for one concept.
- Use American English spelling unless an official directive requires a different spelling.
- Do not use slang, regional words, unexplained jargon, contractions, semicolons, or phrasal verbs.
- Keep multi-word nouns to three words or fewer, except approved technical nouns.
- Use only simple verb tenses.
- Do not use continuous verb forms.
- Use active voice. In descriptions, use passive voice only when the agent is unknown.
- Do not omit necessary articles or other words.
- Use clear pronouns and explicit noun references.
- Use gender-neutral language.

For procedures:
- Use 20 words or fewer in each sentence.
- Start each work step with an imperative verb.
- Give one instruction in each sentence.
- Combine actions only when they occur at the same time.
- Put a necessary condition before the command.
- Use notes only for information.

For descriptions:
- Use 25 words or fewer in each sentence.
- Give information gradually.
- Use one main topic in each sentence.
- Do not use imperative verbs.
- Use one topic in each paragraph.
- Use six sentences or fewer in each paragraph.

For safety instructions:
- Use the approved risk label.
- Start with a clear command or necessary condition.
- State the hazard or possible result.
- Do not infer, weaken, remove, or invent a risk.

After drafting, check sentence length, word approval, word meaning, part of speech, terminology, noun-group length, verb form, voice, punctuation, paragraph length, and consistency.
Then compare the result with the source for semantic equivalence.

Report one status: STE-COMPLIANT, STE-NONCOMPLIANT, STE-ALIGNED, or NOT-ASSESSABLE.
Never claim STE compliance when a required reference or verification step is unavailable.
```

## 14. Example

Source:

> Prior to commencing the installation, ensure that the electrical supply has been disconnected.

STE-aligned procedure:

> Before you install the unit, disconnect the electrical power supply.

Why the revision is better:

- The condition comes before the installation.
- The instruction uses direct verbs.
- The sentence uses the active voice.
- The sentence has fewer than 20 words.
- The revision removes a complex verb construction.

The example is not a formal compliance result. A Level A dictionary check is still necessary.

## 15. Implementation notes

An automated checker can find candidate violations. It cannot verify technical meaning or guarantee correct English.

Configure a checker with the approved project terminology. Without that terminology, the checker will report valid technical terms as unknown.

The [official checker guidance](https://www.asd-ste100.org/STEsoftware.html) also requires trained judgment. A checker cannot write STE or prove that a text is meaningful.

Keep a human review for:

- Safety-critical instructions.
- New or changed technical terms.
- Ambiguous source text.
- Legal or regulatory content.
- Changes that can affect the task sequence.

## 16. Official sources

- [ASD-STE100 official home page](https://www.asd-ste100.org/index.html)
- [About ASD-STE100 and Issue 9](https://www.asd-ste100.org/about_STE.html)
- [Official ASD-STE100 Issue 9 PDF](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf)
- [Official ASD-STE100 FAQ](https://www.asd-ste100.org/STE_faq.html)
- [Official guidance about STE checking tools](https://www.asd-ste100.org/STEsoftware.html)
- [Request the current official standard](https://www.asd-ste100.org/STE_downloads.html)

## 17. Maintenance

Review these instructions when:

- ASD publishes a new issue of ASD-STE100.
- The project terminology database changes.
- An applicable safety or publication standard changes.
- A checker changes its dictionary or parsing method.

Record the applicable ASD-STE100 issue in each compliance report.

ASD-STE100 is owned by ASD. This document is an independent implementation guide and is not an official ASD publication.
