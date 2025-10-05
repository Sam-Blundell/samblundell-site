# Sam Blundell's Personal Website

A clean, modern personal website built with HTML, CSS, and Tailwind. Served by Nginx with SSL certificates from Let's Encrypt.

## Structure

```
src/
├── index.html          # Homepage
├── about.html          # About page
├── links.html          # Links/contact page
├── blog/
│   └── index.html      # Blog listing
├── projects/
│   └── index.html      # Projects showcase
├── css/
│   ├── input.css       # Tailwind source file
│   └── main.css        # Compiled CSS (gitignored)
└── assets/             # Images, fonts, etc.
```

## Development

### Prerequisites

- Tailwind CLI v3.4.17 placed at `./tailwindcss-linux-x64` (not committed to GitHub due to size) or a matching Tailwind v3 system binary
- Tailwind v3 keeps the CSS payload small and supports older browsers without relying on CSS custom properties
- SSH access to your VPS

### Setup

1. Clone this repository
2. Download the Tailwind v3.4.17 standalone CLI (not checked in) and place it at `./tailwindcss-linux-x64`:
   ```bash
   curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/download/v3.4.17/tailwindcss-linux-x64
   chmod +x tailwindcss-linux-x64
   ```
   > If you already have Tailwind v3.4.x installed globally as `tailwindcss`, you can skip this step.

### Building

```bash
./build.sh
```

This runs the Tailwind v3 CLI to compile `src/css/input.css` into `src/css/main.css`. Purge/treeshake paths are defined in `tailwind.config.cjs` to keep the bundle lean, and `--minify` ensures the output stays under the ~14 KB gzip budget. The script uses the vendored `tailwindcss-linux-x64` for a consistent version and falls back to a system `tailwindcss` if the binary is missing.

### Deployment

```bash
./deploy.sh
```

This builds the site and deploys to your VPS using rsync.

## Customization

- Edit HTML files in `src/` to update content
- Modify `src/css/input.css` to add custom styles
- Tweak `tailwind.config.cjs` for additional content paths, theme tokens, or safelisted utilities
- Update `deploy.sh` with your VPS details

## License

MIT
