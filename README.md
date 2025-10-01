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

- Tailwind CLI available: system `tailwindcss` preferred (ideal); alternatively place the standalone binary at `./tailwindcss-linux-x64`
- SSH access to your VPS

### Setup

1. Clone this repository
2. Optional: if you don’t have a system Tailwind CLI (`tailwindcss`), download the standalone binary:
   ```bash
   curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
   chmod +x tailwindcss-linux-x64
   ```

### Building

```bash
./build.sh
```

This compiles Tailwind CSS from `src/css/input.css` to `src/css/main.css`, using content scanning (a.k.a. purge/treeshake) over `src/**/*.html` and minification to minimize payload. The script prefers a system `tailwindcss` and falls back to `./tailwindcss-linux-x64` if present.

### Deployment

```bash
./deploy.sh
```

This builds the site and deploys to your VPS using rsync.

## Customization

- Edit HTML files in `src/` to update content
- Modify `src/css/input.css` to add custom styles
- Update `deploy.sh` with your VPS details

## License

MIT