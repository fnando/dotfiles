# PR Feedback Analyzer

Fetches all comments and review feedback from a pull request, evaluates each
piece of feedback on its merit, and produces a prioritized action plan.

You MUST follow the steps below **in order**. Do not skip, combine, or
anticipate steps. Each step that requires user input must STOP and wait.

---

## Arguments

- **PR** — A pull request URL (e.g. `https://github.com/owner/repo/pull/123`) or
  a PR number (assumed to be from the current repository if no URL given). If
  not provided, try to find the pr out of the current branch.

---

## Step 1: Fetch PR metadata and comments

Use the GitHub API to collect ALL of the following:

1. **PR metadata**: title, description, base branch, author, status
2. **Review comments** (inline code comments):
   `GET /repos/{owner}/{repo}/pulls/{pull_number}/comments`
3. **Issue-style comments** (top-level discussion):
   `GET /repos/{owner}/{repo}/issues/{pull_number}/comments`
4. **Review summaries** (approve/request changes + body):
   `GET /repos/{owner}/{repo}/pulls/{pull_number}/reviews`

Output a summary of what was fetched before continuing:

- PR title and status
- Number of reviewers
- Total comment count (inline + top-level)
- Review decisions (approved / changes requested / commented)

**Do NOT analyze or evaluate anything yet. Only report what was fetched.**

---

## Step 2: Categorize the feedback

Group every piece of feedback into one of these categories:

| Category                         | Description                                                             |
| -------------------------------- | ----------------------------------------------------------------------- |
| 🐛 **Bug / Correctness**         | Points to an actual defect, edge case, or incorrect logic               |
| 🏗️ **Architecture / Design**     | Suggests structural changes, pattern improvements, or approach rethinks |
| 🎨 **Style / Formatting**        | Nitpicks on naming, whitespace, conventions — no behavior change        |
| 📖 **Documentation**             | Missing or unclear comments, docstrings, README entries                 |
| ❓ **Question / Clarification**  | Reviewer is asking a question, not necessarily requesting a change      |
| 💡 **Suggestion / Nice-to-have** | Optional improvement, not blocking                                      |
| ✅ **Positive / Praise**         | Compliment or approval — no action needed                               |

For each comment, output:

- Reviewer name
- Category (from table above)
- One-sentence summary of the comment
- The relevant file + line number if it's an inline comment

**Do NOT evaluate merit yet. Only categorize.**

---

## Step 3: Evaluate merit of each piece of feedback

For every non-positive comment, evaluate whether the feedback is:

**✅ Valid** — The concern is correct and should be addressed. Explain _why_ it
is valid.

**⚠️ Partially valid** — The concern has merit but the suggested fix may be
wrong, overly broad, or based on incomplete context. Explain what the valid part
is and what to be cautious about.

**❌ Disagree** — The concern appears to be a misunderstanding, stylistic
preference without a real benefit, or incorrect. Explain the reasoning —
respectfully and specifically.

Be honest. Not all reviewer feedback deserves to be acted on. Reviewers can be
wrong, can miss context, or can conflate personal preferences with correctness.
Say so clearly when that is the case.

**Do NOT suggest fixes yet. Only evaluate.**

---

## Step 4: Produce an action plan

Output a prioritized action plan organized into three tiers:

### 🔴 Must Fix (blocking merge)

Items marked ✅ Valid in the Bug or Architecture categories. List each with:

- What to fix
- Why it matters
- Suggested approach

### 🟡 Should Fix (recommended before merge)

Items marked ✅ Valid or ⚠️ Partially valid in other categories. Same format.

### 🟢 Optional / Defer

Items marked ❌ Disagree, ✅ Positive, or 💡 Suggestion. For each:

- Brief reason it's not being acted on (or can be deferred)
- If disagreeing with a reviewer, suggest a polite response they can leave on
  the PR

End with:

> **Summary**: X items to fix (Y must-fix, Z recommended), W items deferred.

---

## Step 5: Confirm before doing anything

**STOP. Do not make any code changes, create branches, or modify files.**

Ask the user:

1. Does the action plan look right?
2. Are there any items they want to move between tiers?
3. Should any items be dropped or escalated?

Wait for explicit confirmation (e.g. "looks good", "confirmed", "yes go ahead")
before proceeding to Step 6.

---

## Step 6: Implement the fixes (optional)

Only begin this step after receiving explicit user confirmation in Step 5.

For each must-fix and should-fix item (in priority order):

1. Switch to the correct branch
2. Make the code change
3. Note which reviewer comment it addresses
4. After all changes, use the `/commit` skill to commit with a clear message

Do NOT address items the user marked as deferred or dropped.
