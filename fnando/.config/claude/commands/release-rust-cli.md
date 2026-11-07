---
name: release-rust-cli
description:
  Release the next patch version of the Rust CLI in the current repo (gatefold,
  dotshell, tidepool, …). Bumps the latest released version's patch number,
  asks for confirmation, then runs the Release workflow, approves and watches
  the release PR's CI, merges it, waits for the Publish workflow and the GitHub
  release, and summarizes. Use when the user says /release, "make a release",
  "cut a release", or "release v0.0.x".
---

# Release a Rust CLI

Works on the repo in the current directory. Releases go through GitHub Actions:

- `.github/workflows/release.yml` (`workflow_dispatch`, input `version` without
  the `v`) bumps the version and opens the PR `Release vX.Y.Z` from the branch
  `release/vX.Y.Z`.
- `.github/workflows/ci.yml` runs on that PR. Because the bot opened it, the run
  waits for approval (`action_required`).
- `.github/workflows/publish.yml` runs when the PR is merged. It builds one
  binary per target, signs `SHA256SUMS` and creates the GitHub release
  `vX.Y.Z`.

Use `gh` for everything. Keep the user posted with one short line at each step.

## 0. Learn about the project

Work these out before anything else, and use them in every step below:

- `ROOT`: `git rev-parse --show-toplevel`.
- `REPO`: `gh repo view --json nameWithOwner -q .nameWithOwner` (e.g.
  `fnando/gatefold`).
- `NAME`: the binary name. It's `package.name` in `Cargo.toml`; if Cargo.toml
  has `[[bin]]` entries, use the binary that `publish.yml` packages.
- `TARGETS`: the `target:` entries in the build matrix of `publish.yml`. The
  release must end up with one `NAME-<target>.tar.gz` per target.
- `KEY`: the public signing key, `ROOT/NAME-signing-key.asc`. If it's missing,
  look for another `*-signing-key.asc` in the repo root.
- `MERGE`: the merge method the repo allows. Check
  `gh repo view --json squashMergeAllowed,mergeCommitAllowed,rebaseMergeAllowed`
  and prefer squash, then merge commit, then rebase.

Stop and explain what's missing if any of the three workflow files don't exist,
or if `KEY` can't be found while `publish.yml` signs the checksums. This command
only works with that setup.

## 1. Pick the version and confirm

1. Get the latest release: `gh release list -L 1 --json tagName -q '.[0].tagName'`
   (e.g. `v0.0.6`). If there's none, use the `version` in `Cargo.toml` as the
   starting point instead, and say so.
2. Increment the patch number: `v0.0.6` → `0.0.7`. Keep any major or minor part
   as it is. If `Cargo.toml` on `origin/main` already has that version, the
   Release workflow will refuse it; mention that and suggest the next one.
3. Check what would ship:
   - `git fetch -q --tags`
   - `git log --oneline <latest tag>..origin/main` (or the last 20 commits if
     there's no tag). If it's empty, say there's nothing new since the last
     release, and still ask.
   - `git status --short` and `git status -sb`. If there are uncommitted changes
     or unpushed commits, mention that they won't be in the release. Don't
     commit or push them yourself.
4. Ask with AskUserQuestion before doing anything else. Show the project
   (`REPO`), the version (`vX.Y.Z`, up from the latest tag) and the commits that
   would ship. Offer "Release vX.Y.Z" and "Cancel". If the user picks "Other"
   with a different version, use that one. Stop if they cancel.

## 2. Run the Release workflow

1. `gh workflow run release.yml -R REPO -f version=X.Y.Z`
2. Find its run, the newest `workflow_dispatch` run of `release.yml`:
   `gh run list -R REPO --workflow=release.yml -L 1 --json databaseId,status,event`.
   Retry for a few seconds if it isn't listed yet.
3. Wait: `gh run watch <id> -R REPO --exit-status`.
4. If it fails, show the failed step's log
   (`gh run view <id> -R REPO --log-failed | tail -50`) and stop. Don't retry
   this workflow: a common cause is a `release/vX.Y.Z` branch that already
   exists, and retrying won't help.
5. Find the PR: `gh pr list -R REPO --head release/vX.Y.Z --json number,url`.

## 3. Get the PR green

1. Find the CI runs for the PR branch:
   `gh run list -R REPO --branch release/vX.Y.Z --json databaseId,status,conclusion,workflowName`.
   It can take a few seconds for them to show up.
2. Approve each run whose conclusion is `action_required`:
   `gh api -X POST repos/REPO/actions/runs/<id>/approve`.
3. Wait for the checks: `gh run watch <id> -R REPO --exit-status` for each run,
   or `gh pr checks <number> -R REPO --watch`.
4. Watches can outlast the 10-minute command limit. Run long waits in the
   background (`run_in_background`) or in chunks with `timeout 590`. Re-check
   the state between waits; don't assume.
5. Then apply the **retry rule** below.

## 4. Merge

1. Check `gh pr view <number> -R REPO --json mergeStateStatus,statusCheckRollup`.
   Every check must have passed and the state must be `CLEAN`.
2. Merge with `gh pr merge <number> -R REPO --<MERGE> --delete-branch`.

## 5. Wait for the release

1. Find the Publish run for the PR branch:
   `gh run list -R REPO --workflow=publish.yml --branch release/vX.Y.Z -L 1 --json databaseId,status`.
2. Wait for it as in step 3. The macOS builds often wait a long time for a
   runner. Apply the **retry rule**.
3. When it succeeds, check the release:
   `gh release view vX.Y.Z -R REPO --json url,assets -q '.url, (.assets[].name)'`.
   It must have a `NAME-<target>.tar.gz` for every target in `TARGETS`, plus
   `SHA256SUMS` and `SHA256SUMS.sig`.
4. Verify the signature in a temporary directory, with a throwaway keyring:
   ```sh
   d=$(mktemp -d) && cd "$d"
   gh release download vX.Y.Z -R REPO -p 'SHA256SUMS*'
   gpg --no-default-keyring --keyring ./k.kbx --import KEY
   gpg --no-default-keyring --keyring ./k.kbx --verify SHA256SUMS.sig SHA256SUMS
   ```
   `KEY` must be an absolute path, since you're no longer in the repo. The
   output should say "Good signature".
5. Update local `main` with `git pull -q`, but only if it's clean and on `main`.

## Retry rule

Applies to jobs in the PR's CI and in the Publish workflow.

- When a job ends as `cancelled`, `failure` or `timed_out`, rerun the failed
  jobs once: `gh run rerun <id> -R REPO --failed`. That also reruns jobs that
  were skipped because of them, such as Publish's final step.
  - Before rerunning, look at what happened: the job's start and end times, and
    the failed log if there is one (`gh run view <id> -R REPO --log-failed`). A
    job cancelled about 15 minutes after it was queued, with no logs, usually
    never got a runner.
  - Tell the user what you're retrying and why.
- A job that ends as `cancelled`, `failure` or `timed_out` again after its one
  rerun: stop. Don't merge, and don't retry again. Report the job, its run URL,
  what the log shows (or that there's none), and what's left to do (e.g. "PR #N
  is open and not merged", or "merged, but the release wasn't published").
- Count reruns per run, not per job: one rerun per workflow run.

## Final summary

End with a short report:

- the project, the version and the release URL, plus the assets and whether the
  signature checked out
- the PR number and how it was merged
- each step and anything that went off script: approvals, reruns and why, how
  long the waits took
- the local `main` commit after pulling, or why you didn't pull
- any follow-ups the project needs, such as a Homebrew formula in
  `fnando/homebrew-tap` that still points at the previous version

If you stopped early, say where it stopped and what state things are in.
