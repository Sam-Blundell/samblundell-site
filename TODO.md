# TODO

- [x] Nginx: move gzip settings to conf.d
  - Create `infra/nginx/conf.d/gzip.conf` (on, vary, proxied any, level 5, min_length 512, types incl css/js/svg/wasm)
  - Remove gzip block from `infra/nginx/nginx.conf`
- [x] Nginx: clean site config + extensionless URLs
  - In `infra/nginx/sites-available/samblundell.co.uk`, set `location /` → `try_files $uri $uri/ $uri.html =404`
  - Add static caching: `location ~* \.(css|js|svg|ico|webp|avif)$ { add_header Cache-Control "public, max-age=31536000, immutable"; }`
- [x] Nginx: simplify HTTP redirect
  - Replace `if` rules with a port 80 server returning `301 https://$host$request_uri`
- [x] Deploy script
  - Add `scripts/deploy-nginx.sh`: rsync infra/nginx → /etc/nginx; create symlink; `sudo nginx -t && sudo systemctl reload nginx`
- [x] Verify on server
  - [x] `curl -I -H 'Accept-Encoding: gzip' https://samblundell.co.uk/css/main.css` → `Content-Encoding: gzip`
  - [x] `curl -I https://samblundell.co.uk/about` → 200 (via about.html); check `Cache-Control` on CSS/JS
  - [x] `sudo nginx -T` (syntax ok; test successful)
- [ ] Investigate Brotli to see if it's worth it
  - Check `ngx_brotli` availability; add `brotli on` + types if present; test with `Accept-Encoding: br`
- [ ] Further refine styling
  - Extend indigo accents to nav/links, spacing rhythm, border palette; polish skeleton loaders
