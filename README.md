# building-sunday

The public development journal for [Sunday](https://github.com/joe-dakroub/Sunday) — a reimagined personal computer interface. Jekyll site, deploys to GitHub Pages from `main` via `.github/workflows/deploy-blog.yml`.

Published at: `https://joe-dakroub.github.io/building-sunday/`

## Repo layout

This repo is **only** the journal. The Sunday source is in a separate (private) repo. The weekly post generator expects them to be siblings on disk:

```
~/Documents/Personal/Code/
├── Sunday/             ← private app source
└── building-sunday/    ← this repo
```

## One-time setup

1. **Create the GitHub repo** as `building-sunday`, public.
2. **Push this directory** to `main`.
3. **Enable Pages.** Repo → Settings → Pages → Source: **GitHub Actions**.
4. **Custom domain (optional).** Add a `CNAME` file containing the domain and a matching DNS record at the registrar. If you do this, also drop the `baseurl` in `_config.yml` from `/building-sunday` to `""`.

## Local preview

```bash
bundle install
bundle exec jekyll serve
```

Open `http://localhost:4000/building-sunday/`.

## Weekly workflow

From inside this repo:

```bash
claude run scripts/blog.md
```

This reads `.md` files modified in the last 7 days from the **sibling Sunday repo** (`../Sunday`), extracts decisions and work completed, and writes `_posts/YYYY-MM-DD-week-N.md` here. Review the draft, edit if needed, then:

```bash
git add _posts/
git commit -m "Week N journal"
git push
```

The workflow deploys automatically.

## Visual rules

This site mirrors the Sunday app's visual discipline. Pure black background, white text, SF Pro via `-apple-system`, no decoration. The brand mark is `Sunday...` — the ellipsis is the wake word pause and is rendered in `#6e6e73` at weight 300.

Once a visual decision is made correctly, it is made permanently. Do not refresh, theme, or modernize. If a change is being justified by "what's current," the change does not belong.
