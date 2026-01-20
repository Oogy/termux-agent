#!/data/data/com.termux/files/usr/bin/bash
# Stable wrapper - clones repo to get latest setup.sh
set -e
TEMP_DIR="${TMPDIR:-/data/data/com.termux/files/usr/tmp}/termux-agent-$$"
git clone --depth 1 https://github.com/Oogy/termux-agent.git "$TEMP_DIR"
bash "$TEMP_DIR/setup.sh"
rm -rf "$TEMP_DIR"
