# Agent Guide
**Build & Deploy**
- `./build.sh` compiles Tailwind `src/css/input.css` → `src/css/main.css`.
- `./deploy.sh` runs the build then `rsync`s `src/` to VPS; update user/host/path.
- Tailwind CLI `./tailwindcss-linux-x64` must exist; install via `README.md`.
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
