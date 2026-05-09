---
name: work-summary
description: >
  Generate a concise weekly work summary by fetching all pull requests the user
  created under the GitHub org `stellar` for a given week, then grouping them
  into thematic bullets (no PR links, just patterns and themes). Trigger
  whenever the user asks for a weekly work summary, asks "what did I work on",
  references "work-summary {WEEK}", or asks to summarise their PRs for a time
  period. Always ask for {WEEK} before proceeding if it wasn't supplied.
---

# Work Summary Skill

Produces a short, theme-based weekly summary of the user's pull requests and
GitHub issues in the `stellar` GitHub org.

---

## Step 1 — Resolve the week

If `{WEEK}` was not supplied, ask:

> "Which week would you like a summary for? (e.g. _this week_, _last week_, _2
> weeks ago_)"

Map the answer to an ISO date range (Monday → Sunday, inclusive) relative to
today.

| Input         | Meaning                            |
| ------------- | ---------------------------------- |
| `this week`   | Monday of the current week → today |
| `last week`   | Monday–Sunday of the previous week |
| `2 weeks ago` | Monday–Sunday two weeks back       |
| `3 weeks ago` | … and so on                        |

---

## Step 2 — Fetch PRs via GitHub search API

Use the **GitHub Search API** (no auth token needed for public orgs, but if the
user has one connected, prefer it). Also, prefer using `gh` if available.

```
GET https://api.github.com/search/issues?q=is:pr+org:stellar+author:@me+created:{DATE_FROM}..{DATE_TO}&per_page=100
```

Substitute `{DATE_FROM}` and `{DATE_TO}` in `YYYY-MM-DD` format.

If you have access to a GitHub MCP tool, prefer that. Otherwise use `web_search`
or `web_fetch` against the API URL above.

**Extract from each PR:**

- `title`
- `repository_url` (repo name only, e.g. `stellar/horizon`)
- `body` (first 200 chars, for extra context)
- `labels[].name`

---

## Step 3 — Fetch GitHub Issues

Use the **GitHub Search API** to find issues the user created during the week.
Run both queries and deduplicate by issue number:

```
GET https://api.github.com/search/issues?q=is:issue+org:stellar+author:@me+created:{DATE_FROM}..{DATE_TO}&per_page=100
```

**Extract from each issue:**

- `title`
- `repository_url` (repo name only)
- `state` (`open` or `closed`)
- `labels[].name`
- `body` (first 200 chars)

---

## Step 4 — Cluster into themes

Group PRs and issues together by recurring topic/theme — they often relate to
the same work and should be merged into unified bullets where possible. Good
clustering signals:

- Keywords in titles (fix, bug, feat, chore, refactor, test, docs, ci, release,
  bump, upgrade)
- Shared domain words (keys, fees, transactions, accounts, rpc, sdk, horizon,
  core, soroban, cli, etc.)
- Label names
- Repo names

Do **not** list PR/issue numbers or URLs. Do **not** list individual titles
verbatim.

---

## Step 5 — Write a markdown file and print the path

Compose the summary in this format (adjust bullet count to what was found). Keep
PRs and issues in separate sections:

```markdown
## Pull Requests

- N PRs fixing bugs related to <theme>.
- N PRs implementing new features like <A>, <B>, <C>.
- N PR improving <theme> (e.g. CI, docs, tests).

## Issues

- N issues investigating <theme>.
- N issues filed for bugs related to <theme>.
- 1 issue tracking <one-off thing>.
```

Rules:

- Use **singular** "1 PR / 1 issue" and **plural** "N PRs / N issues".
- Keep each bullet to one concise sentence.
- Merge tiny lone items into an "other" bullet if they don't fit a theme.
- If there are zero PRs or zero issues for the week, omit that section.
- Never link to PRs or issues.
- Never list individual titles verbatim.

Then write the summary to a temp file using `bash_tool`:

```bash
FILE=$(mktemp /tmp/work-summary-{DATE_FROM}-{DATE_TO}.md)
cat > "$FILE" << 'EOF'
<summary content here>
EOF
echo "$FILE"
```

After writing the file, print the file path to the user like:

```
Summary saved to: /tmp/work-summary-2026-05-04-2026-05-08.md
```

---

## Example output

```
Summary saved to: /tmp/work-summary-2026-05-04-2026-05-08.md

## Pull Requests

- 5 PRs fixing bugs related to transaction signing and key management.
- 3 PRs implementing new features like fee-bump support, multi-sig improvements, and a new CLI command.
- 2 PRs upgrading dependencies and bumping SDK versions.
- 1 PR updating documentation for the Horizon API.

## Issues

- 3 issues investigating RPC timeout failures under load.
- 2 issues filed for bugs in the fee calculation logic.
- 1 issue tracking a follow-up on the multi-sig rollout.
```
