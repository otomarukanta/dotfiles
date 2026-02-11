# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/). It contains shell configurations and development environment setup for a WSL2 environment.

## Setup and Installation

To install the dotfiles on a new machine:
```bash
chezmoi init --apply otomarukanta/dotfiles
```

To apply changes after editing:
```bash
chezmoi apply
```

To pull latest changes and apply:
```bash
chezmoi update
```

## Managed Files

- `dot_zshrc` → `~/.zshrc` — Shell configuration
- `dot_claude/CLAUDE.md` → `~/.claude/CLAUDE.md` — Claude Code configuration

## Key Components

### Shell Configuration (.zshrc)
- Uses Oh My Zsh framework with robbyrussell theme
- Integrates multiple development tools:
  - Homebrew (Linux version)
  - GitHub CLI with completion
  - NVM for Node.js version management
  - Deno runtime
  - DuckDB CLI
  - RISC Zero toolchain
- SSH key management via keychain (uses `id_ed25519`)
- Zellij terminal multiplexer with auto-attach functionality
- Sources `.env.keys` for sensitive environment variables

## Development Environment

### Package Managers and Tools
- **Homebrew**: Initialized at `/home/linuxbrew/.linuxbrew`
- **NVM**: Node Version Manager for switching Node.js versions
- **Deno**: JavaScript/TypeScript runtime
- **GitHub CLI**: Command-line interface for GitHub

### PATH Additions
- `/home/kanta/bin` - Personal binaries
- `/home/kanta/.duckdb/cli/latest` - DuckDB CLI
- `/home/kanta/.risc0/bin` - RISC Zero toolchain

## Important Notes

- This repository is designed for a WSL2 (Windows Subsystem for Linux) environment
- The `.env.keys` file (not tracked in git) must exist for proper functionality
- SSH keys are automatically loaded via keychain on shell startup
- The repository is minimal and focused on shell configuration only
