#!/usr/bin/env bash
# Rebuild the Patchmanager2 patch archive (unified_diff.patch + main.png,
# flat at the archive root) into dist/.
set -euo pipefail
cd "$(dirname "$0")"

NAME="running-app-icon"
VER="1.0.0"
OUT="dist/${NAME}-${VER}.zip"

mkdir -p dist
rm -f "$OUT"

if command -v zip >/dev/null 2>&1; then
    zip -X "$OUT" unified_diff.patch main.png
else
    python3 -m zipfile -c "$OUT" unified_diff.patch main.png
fi

echo "built $OUT"
