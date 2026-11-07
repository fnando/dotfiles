---
description: Manage to-do lists
---

This skill allows managing to-do items in a `TODO.md` file.

---

## Arguments

- **OPERATION** — An **optional** operation that will be performed. Can be
  `list` or `add`. By default it adds the entry.
- **PRIORITY** — An **optional** value that indicates the priority of the task.
  If not provided, assume `regular`. The possible values are: `high`, `regular`,
  `low`. If not provided, assume `normal`.
- **DESCRIPTION** — A task description that will help implement this item.

---

### Step 1: Create or load the file

- If project doesn't have `TODO.md` file, create one. The overall template must
  look like this:

  ```markdown
  # To-do

  - [ ] ({priority}) {description} (<date>)
  ```

- **DO NOT CACHE FILE**. If file exists, load it. ALWAYS process this step
  because files may have been edited manually, so you may have a stale cache.

### Step 2: Process the entry

- Tasks must be sorted by priority+date (oldest first).
- `<date>` must use `yyyy-mm-dd` format.
- When screenshots are provided, save them to a local `tmp/todo` directory, and
  add the path to the description. Use the template
  `[ ] ({priority}) {description} (ref: {path}) ({date})` E.g.
  `[ ] (regular) improve something (ref: tmp/todo/screenshot1.png, tmp/todo/screenshot2.png) (2026-10-25)`
- Before adding the item, check if a similar item is on the todo list; if there
  is, show the previous entry and ask for confirmation before re-adding it. If
  the entry is exactly the same, with similar or slightly different wording,
  ignore task entirely, but store screenshots if provided.
- Format the item so it fits 80-char line length.

### Step 3: Feedback

- After saving the task, show a summary with the number of items:

  ```
  On your to-do: {count} high, {count} regular, {count} low
  ```

- Omit slots that have `count` equals to zero.
