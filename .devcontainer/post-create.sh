#!/bin/bash

set -euo pipefail

# All paths need to be made absolute since it runs in the context of a devcontainer.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

### pnpm setup

echo "🔓 Fixing permissions of ${PNPM_STORE}..."

sudo chown -R node:node "${PNPM_STORE}"
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
pnpm config set store-dir "$PNPM_STORE" # This comes from devcontainer.json, and is mounted as a volume in docker-compose.yaml

grep -qxF 'export PNPM_HOME="$HOME/.local/share/pnpm"' ~/.zshrc || \
  echo 'export PNPM_HOME="$HOME/.local/share/pnpm"' >> ~/.zshrc
grep -qxF 'export PATH="$PNPM_HOME:$PATH"' ~/.zshrc || \
  echo 'export PATH="$PNPM_HOME:$PATH"' >> ~/.zshrc

echo "⬇️  Installing pnpm packages..."

pnpm add wrangler --silent --allow-build=esbuild --allow-build=sharp --allow-build=workerd
pnpm --silent install

### Aliases
echo "🪄  Shell magic: creating developer-friendly aliases..."
grep -qxF "alias npm='pnpm'" ~/.zshrc || \
  echo "alias npm='pnpm'" >> ~/.zshrc