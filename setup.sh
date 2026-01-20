#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "=== Termux Agent Setup ==="

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Update packages
echo "[1/7] Updating package lists..."
pkg update -y

# Install dependencies
echo "[2/7] Installing nodejs, git, ripgrep, gh..."
pkg install -y nodejs git ripgrep gh

# Install Claude Code
echo "[3/7] Installing Claude Code via npm..."
npm install -g @anthropic-ai/claude-code

# Install Codex CLI
echo "[4/7] Installing Codex CLI via npm..."
npm install -g @openai/codex

# Setup shortcuts directory
echo "[5/7] Installing Termux shortcuts..."
mkdir -p ~/.shortcuts
cp "$SCRIPT_DIR/shortcuts/"* ~/.shortcuts/
chmod +x ~/.shortcuts/*

# Setup SSH config
echo "[6/7] Installing SSH config..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [ -f ~/.ssh/config ]; then
    echo "Backing up existing SSH config to ~/.ssh/config.bak"
    cp ~/.ssh/config ~/.ssh/config.bak
fi
cp "$SCRIPT_DIR/ssh_config" ~/.ssh/config
chmod 600 ~/.ssh/config

# Verify installation
echo "[7/7] Verifying installation..."
echo ""
echo "Installed versions:"
echo "  Node.js: $(node --version)"
echo "  npm: $(npm --version)"
echo "  git: $(git --version | cut -d' ' -f3)"
echo "  ripgrep: $(rg --version | head -1 | cut -d' ' -f2)"
echo "  gh: $(gh --version | head -1 | cut -d' ' -f3)"
echo ""
echo "AI Coding Agents:"
echo "  claude: $(claude --version 2>/dev/null || echo 'installed')"
echo "  codex: $(codex --version 2>/dev/null || echo 'installed')"
echo ""
echo "=== Setup complete! ==="
echo ""
echo "Next steps:"
echo "  1. Run 'gh auth login' to authenticate with GitHub"
echo "  2. Run 'claude' to start Claude Code"
echo "  3. Run 'codex' to start Codex CLI"
echo "  4. Add Termux:Widget to your home screen for shortcuts"
