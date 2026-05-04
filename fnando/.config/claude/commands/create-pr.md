---
name: create-pr
description:
  Creates a new GitHub pull request from the current branch, or opens the
  existing one if it already exists. Use this skill whenever the user says
  "create a PR", "open a pull request", "make a PR", "submit a PR", "push a PR",
  or any variation. Also trigger when the user asks to "open a PR", "raise a
  PR", or mentions wanting to get their branch reviewed. This skill handles PR
  template detection, branch state checks, and clean PR creation without
  boilerplate footers.
---

# Create PR

Creates a pull request from the current branch. If a PR already exists for the
branch, surfaces its URL instead of creating a duplicate.

---

## Step 1 — Gather context

Run all of these in parallel:

```bash
# Current branch name
git branch --show-current

# Check for uncommitted changes
git status --short

# Commits ahead of the default base branch (try main, then master, then develop)
git log origin/main..HEAD --oneline 2>/dev/null \
  || git log origin/master..HEAD --oneline 2>/dev/null \
  || git log origin/develop..HEAD --oneline 2>/dev/null

# Remote URL (to confirm GH repo)
git remote get-url origin

# PR template (may not exist)
cat .github/pull_request_template.md 2>/dev/null || echo "__NO_TEMPLATE__"

# Check if a PR already exists for this branch
gh pr view --json url,title,state 2>/dev/null || echo "__NO_PR__"
```

---

## Step 2 — Early exits

| Condition                                          | Action                                                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------- |
| Branch is `main`, `master`, or `develop`           | Stop. Tell the user PRs should come from a feature branch, not the base branch. |
| `gh pr view` returned a valid PR (not `__NO_PR__`) | Stop. Show the existing PR's title, state, and URL. No duplicate creation.      |
| No commits ahead of base                           | Stop. Tell the user there are no new commits to open a PR for.                  |

---

## Step 3 — Push branch if needed

If the branch has no upstream tracking reference yet, push it:

```bash
git push -u origin HEAD
```

If the push fails (e.g. protected branch, auth error), report the error clearly
and stop.

---

## Step 4 — Compose the PR body

### If a template was found (`.github/pull_request_template.md` exists and is non-empty, searching from project's root dir):

Read it carefully. Fill in every section as completely as possible using:

- The commit messages (`git log origin/<base>..HEAD --pretty=format:"%s%n%b"`)
- Diff summary (`git diff origin/<base>..HEAD --stat`)
- Any context already provided by the user in the conversation

Leave checkboxes unchecked unless you have clear evidence they're done. Preserve
all headings and section structure from the template. Do not add, remove, or
reorder template sections.

### If no template exists:

Write a concise body covering:

- **What** changed (brief summary)
- **Why** (motivation / problem solved)
- Any notable implementation details or trade-offs

Keep it factual and grounded in the actual diff. Don't pad with filler.

---

## Step 5 — Determine a title

Use the most descriptive single-sentence summary of the change. Good sources:

1. The user's own description from the conversation
2. The first commit message if it's descriptive
3. A short synthesis of all commit subjects

Avoid generic titles like "Update files" or "Fix bug".

---

## Step 6 — Confirm with the user

Before creating anything, show the user a preview and ask for explicit
confirmation:

```
**Title:** <title>
**Base:** <base-branch> ← <current-branch>

**Body:**
<full PR body>

---
Shall I create this PR? (yes / no, or suggest edits)
```

Wait for the user's response. Do not call `gh pr create` until they confirm.

- If they say **yes** (or equivalent), proceed to Step 7.
- If they **suggest edits** to the title or body, apply them and re-show the
  preview. Repeat until confirmed.
- If they say **no**, stop and let them know they can ask again when ready.

---

## Step 7 — Create the PR

```bash
gh pr create \
  --title "<title>" \
  --body "<body>" \
  --base <base-branch>
```

**Critical rules:**

- **Do NOT** add `--body` content that includes "Generated with Claude Code",
  "Co-authored-by: Claude", or any AI-attribution footer. The PR body must
  contain only content derived from the template and the actual code changes.
- Do not add labels, assignees, reviewers, or milestones unless the user
  explicitly asked for them.
- Use `--draft` only if the user explicitly asked for a draft PR.

---

## Step 8 — Report back

After successful creation, reply with:

- The PR title
- The PR URL (from `gh pr view --json url`)
- One sentence summarising what the PR does

Keep it short — the user can open the URL for details.

---

## Error handling

| Error                                   | Response                                                                                                                |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `gh` not installed or not authenticated | Explain that the GitHub CLI (`gh`) is required. Link to `https://cli.github.com` and suggest `gh auth login`.           |
| Push rejected                           | Show the exact error. Suggest force-push only if the branch is clearly a personal feature branch and the user confirms. |
| No remote configured                    | Tell the user to add a GitHub remote first.                                                                             |
| Ambiguous base branch                   | Default to `main`; if that doesn't exist, try `master`, then `develop`. If none exist, ask the user which base to use.  |
