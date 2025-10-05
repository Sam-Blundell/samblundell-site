# Agent Guide
**Build & Deploy**
- Build: `./build.sh` compiles Tailwind `src/css/input.css` → `src/css/main.css`.
- Deploy: `./deploy.sh` builds then rsyncs `src/` to VPS (configure user/host/path).
- Tailwind CLI: download `./tailwindcss-linux-x64` (v3.4.17) locally; gitignored to keep the repo lean; README covers refresh steps and system fallback.
**Lint & Test**
- Optional linting: `npx htmlhint "src/**/*.html"` and `npx stylelint "src/**/*.css"`.
- Tests absent; when added, run `npm test -- my.spec -t "name"` for single cases.
**Code Style**
- HTML: semantic structure, `<html lang>`, double-quoted attrs, 4-space indent.
- Tailwind utilities first; keep custom CSS minimal in `src/css/input.css`, order classes layout → spacing → typography → color.
- Assets live in `src/assets/` with relative links; files/folders, IDs, CSS custom props all kebab-case.
- Imports: prefer relative paths within `src/`; use ES modules, no globals.
- Formatting: UTF-8, trailing newline, <120 chars per line.
- Error handling: scripts exit non-zero on failure and echo actionable messages.
- Accessibility: alt text, logical headings, maintain focus-visible styles.
- Secrets: never commit VPS credentials; rely on env vars or ignored config.
**Rules**
- No Cursor rules in `.cursor/...`; no Copilot rules in `.github/copilot-instructions.md`.
