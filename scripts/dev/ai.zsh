#!/usr/bin/env zsh
#
# AI tools
#
# Normally only need to run this once.
###########################################
source ./scripts/utility/_utils.zsh
source ./scripts/utility/_brew.zsh

echo "This script will install AI tools"
echo "Press any key to continue... "
read -k 1 -s

# Claude - code and desktop app
print_info "Installing Claude code..."
curl -fsSL https://claude.ai/install.sh | bash
claude --version
claude login
install_cask claude

# Install helper tools
npx ccstatusline@latest

# Claude Code settings (statusline, effort level, UI preferences)
print_info "Configuring Claude Code settings..."
python3 - <<'PY'
import json
from pathlib import Path

settings_path = Path.home() / ".claude" / "settings.json"
settings = json.loads(settings_path.read_text()) if settings_path.exists() else {}

settings.update({
    "statusLine": {
        "type": "command",
        "command": "npx -y ccstatusline@latest",
        "padding": 0,
    },
    "effortLevel": "high",
    "tui": "fullscreen",
    "autoCompactEnabled": True,
    "remoteControlAtStartup": False,
})

settings_path.parent.mkdir(parents=True, exist_ok=True)
settings_path.write_text(json.dumps(settings, indent=2) + "\n")
PY
print_success "Claude Code settings configured"

# Claude Code plugin marketplace + plugins
print_info "Installing Claude Code plugins..."
claude plugin marketplace add anthropics/claude-plugins-official

CLAUDE_PLUGINS=(
  superpowers
  context7
  pr-review-toolkit
  serena
  skill-creator
  frontend-design
  swift-lsp
  playwright
)
for plugin in "${CLAUDE_PLUGINS[@]}"; do
  claude plugin install "${plugin}@claude-plugins-official"
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    print_success "Installed Claude plugin: ${plugin}"
  else
    print_error "Failed to install Claude plugin: ${plugin}"
  fi
done

# NOTE: the context7, serena and playwright plugins each bundle an MCP server.
# The first time Claude Code loads one of these, it prompts interactively in
# the session to trust/enable that MCP server - this approval can't be
# scripted, so open Claude Code once after this script finishes and accept
# the prompts. serena's MCP server also relies on `uvx` (installed via
# scripts/shared/python.zsh) being available on PATH.
print_info "Some plugins need manual approval on first use - see NOTE above the plugin install loop."

# OpenAI - codex and desktop app
print_info "Installing OpenAI Codex..."
install codex
codex --version
codex login
install_cask chatgpt

# Codex settings (model, reasoning effort, personality, feature flags)
print_info "Configuring Codex settings..."
python3 - <<'PY'
import re
from pathlib import Path

config_path = Path.home() / ".codex" / "config.toml"
text = config_path.read_text() if config_path.exists() else ""

# Scalar top-level keys must be inserted before any [table] header.
scalars = {
    "model": '"gpt-5.5"',
    "model_reasoning_effort": '"high"',
    "personality": '"friendly"',
}
prefix = ""
for key, value in scalars.items():
    if not re.search(rf"(?m)^{key}\s*=", text):
        prefix += f"{key} = {value}\n"
text = prefix + text

if not re.search(r"(?m)^\[features\]", text):
    text += "\n[features]\nmulti_agent = true\n"

config_path.parent.mkdir(parents=True, exist_ok=True)
config_path.write_text(text)
PY
print_success "Codex settings configured"

# Codex plugins (from the built-in "openai-curated" marketplace)
print_info "Installing Codex plugins..."
CODEX_PLUGINS=(
  github
  superpowers
)
for plugin in "${CODEX_PLUGINS[@]}"; do
  codex plugin add "${plugin}@openai-curated"
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    print_success "Installed Codex plugin: ${plugin}"
  else
    print_error "Failed to install Codex plugin: ${plugin}"
  fi
done

# Codex skills (curated skills from github.com/openai/skills, installed on top
# of the .system skills that ship with Codex by default)
print_info "Installing Codex skills..."
CODEX_SKILL_INSTALLER="$HOME/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py"
if [ -f "$CODEX_SKILL_INSTALLER" ]; then
  python3 "$CODEX_SKILL_INSTALLER" --repo openai/skills --path \
    skills/.curated/pdf \
    skills/.curated/playwright \
    skills/.curated/playwright-interactive \
    skills/.curated/gh-fix-ci
else
  print_error "Codex skill-installer not found - run 'codex login' first, then re-run this section"
fi

# Register context7 key:
#   codex mcp add context7 -- npx -y @upstash/context7-mcp --api-key "CONTEXT7_API_KEY"

# Cursor
print_info "Installing Cursor..."
install_cask cursor

# Copilot
print_info "Installing Copilot..."
install copilot-cli
