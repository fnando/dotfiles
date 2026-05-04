---
description: Implement features based on Github issues
---

# Implement features based on Github issues

You MUST follow the steps below **in order**. Do not skip, combine, or
anticipate steps. Each step that requires user input must STOP and wait for a
response.

## Arguments

- **ISSUE** — A Github issue URL or number. If a number is provided, it will be
  assumed to be from the current repository.

## Step 1: Fetch the issue details

Use the Github API to fetch the issue title, description, labels, and comments.
Output the fetched details before continuing.

## Step 2: Analyze the issue

Output an analysis covering ALL of the following before continuing:

- [ ] The goal of the issue in one sentence
- [ ] Any ambiguities or missing requirements
- [ ] Dependencies or related issues

## Step 3: Design the solution

1. Propose a solution design based on your analysis.
2. Ask any clarifying questions about requirements or uncertainties.
3. **STOP. Do not write any code or begin Step 4 until the user explicitly
   confirms the design with an approval like "confirmed" or "looks good".**

## Step 4: Implement the feature

Only begin this step after receiving explicit user confirmation in Step 3.

1. Create a new branch for the feature. **No prefixes** (`fix/`, `feat/`, etc.).
2. Follow TDD: write a failing test first, then implement to make it pass.
3. Ensure code is well-structured and follows project conventions.
4. Update relevant documentation.
5. Commit using the `/commit` skill.
