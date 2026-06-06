# ColorGuide Viewer

This project uses `index.html` to render zipper-to-thread mappings from `data.json`.

## Run locally

Because browsers block `fetch()` for local `file://` pages, open the page through a local HTTP server.

### Python 3

```powershell
cd g:\colorguide
python -m http.server 8000
```

Then open:

```text
http://localhost:8000/index.html
```

### Node.js

If you have Node installed, you can use `npx`:

```powershell
cd g:\colorguide
npx serve .
```

Then open the URL shown in the terminal.

## Maintenance

- Keep your data in `data.json`
- Edit `index.html` only for presentation logic
- The page will automatically load the latest data on refresh
