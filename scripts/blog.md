# Weekly blog post generator

You are writing the next entry in the Sunday development journal. This repo (`building-sunday`) is the public site. The Sunday source lives in a private sibling repo at `../Sunday`. The post lives at `_posts/` here. Run this end-to-end without asking questions.

## What to do

### 1. Find modified plan files

The plan files are in the **sibling Sunday repo at `../Sunday`** — not this repo. Scan that repo for `.md` files modified in the last 7 days. Search its root, `plans/`, `docs/`, `spec/`, and any subdirectory whose name suggests plans, specs, design notes, or RFCs. Use the following from inside `../Sunday`:

```
git -C ../Sunday log --since="7 days ago" --name-only --pretty=format: -- '*.md' | sort -u
```

This is the source of truth — modification time on disk is unreliable.

Exclude:
- `node_modules/`
- `_site/`
- Lockfiles (`Gemfile.lock`, `package-lock.json`, etc.)

If `../Sunday` does not exist, stop and tell the user to clone the Sunday repo as a sibling directory. If no plan files were modified in the last 7 days, write nothing. Print `No plan changes in the last 7 days. Skipping.` and stop.

### 2. Extract the substance

Read each modified plan file in full and pull out:
- Decisions made and the reasoning behind them
- Work that was completed, merged, or shipped
- Things deferred and why
- Architectural or design pivots
- Open questions still on the table

Keep notes by file so you can name specifics in the post.

When reading file contents, read them from `../Sunday/<path>`. When citing files in the post, refer to them by their path inside the Sunday repo (e.g. `plans/2026-05-04-voice-output.md`).

### 3. Determine the week number

Count `.md` files in `_posts/` (in this repo). The next post is week `N + 1`. If the directory does not exist or has zero posts, this is week 1.

### 4. Write the post

File: `_posts/YYYY-MM-DD-week-N.md` where `YYYY-MM-DD` is today's date.

Frontmatter:

```yaml
---
layout: post
title: "TITLE"
date: YYYY-MM-DD
week: N
---
```

The title should be a phrase pulled from what actually happened that week — not a generic "Week N update" header.

### 5. Voice rules — non-negotiable

- Open with a sentence that matters. The first line should be a thought, a decision, an observation. Never `This week we...`, `It's been a productive week`, or any variant of the startup-update opener.
- Be specific. Name the actual struct, phase, framework, file, capability, command, or decision. `RenderSpec`, `SFSpeechRecognizer`, `Phase 4`, `Card`, `the dissolve`, `the Active state`, `the wake word pause` — that level of specificity. Generic words are a sign you have not understood the source material.
- Short paragraphs. Two to four sentences. The page is black; text needs room around it.
- No bullet lists in prose. If you find yourself reaching for a list, write it as sentences instead. Lists are for reference content, not narrative.
- Section headers are lowercase except for proper nouns. `voice output`, not `Voice Output`. `the dissolve`, not `The Dissolve`.
- Present tense for decisions. Past tense for actions. `The shell is now native Swift. We threw out the Tauri prototype on Saturday.`
- End with what is next. One paragraph. What is actually planned, not aspiration. If the plan files do not say what is next, say so plainly.
- Do not invent. Write only what the plan files contain. If a thing is unclear in the source, leave it out rather than guess.
- No exclamation points. No emoji. No filler.
- Never name internal architecture in user-facing voice when you would not name it on the canvas. "Local on-device model" is fine; reverently dropping `Foundation Models` or `Ollama` only when the post is actually about the framework choice.

### 6. Tone reference

Write like this:

> The shell layer is now native Swift. This was the right decision and we should have made it earlier. Tauri works well as an app framework. It is not a shell — it creates a window, and a shell needs to be more fundamental than a window.

Not like this:

> Exciting progress this week! We made a big architectural decision that will really set us up for success.

The first sounds like the person who is actually building it. The second sounds like a press release. Always the first.

### 7. Output

After writing the file, print:

- the post path
- the week number
- the list of plan files that informed the post

Do not commit. The human reviews and commits.
