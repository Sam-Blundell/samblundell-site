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

- Tailwind CLI standalone binary (included in repo)
- SSH access to your VPS

### Setup

1. Clone this repository
2. Download Tailwind CLI if not present:
   ```bash
   curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
   chmod +x tailwindcss-linux-x64
   ```

### Building

```bash
./build.sh
```

This compiles Tailwind CSS from `src/css/input.css` to `src/css/main.css`.

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