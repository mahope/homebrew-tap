# homebrew-tap

Homebrew tap for mahope tools.

## Install deskuptime

```bash
brew install mahope/tap/deskuptime
```

Website uptime monitor CLI — uptime, SSL expiry & content change alerts from your terminal or CI. Zero dependencies (Node runtime required). https://deskuptime.com

## Install clean-copy

```bash
brew install mahope/tap/clean-copy
```

Copy/paste text as clean Markdown from your terminal. https://cleancopy.tools

## Install transmute

```bash
brew install mahope/tap/transmute
```

Cross-platform data transformer CLI: JSON, CSV, YAML, XML, SQL and table output. https://github.com/mahope/transmute

## How formulas are updated

This tap is the canonical one (`mahope/homebrew-clean-copy` is deprecated).
Formulas are bumped automatically by a `homebrew-bump` / `release-cli` workflow
in each source repo, which downloads the release tarball, computes the sha256
and pushes the updated formula here using a `TAP_TOKEN` secret.

## Author

Built by Mads Holst Jensen — developer and technical partner for small businesses, Odense, Denmark. https://mahoje.dk
