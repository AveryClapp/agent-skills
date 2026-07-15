# Agent Skills

Curated, personalized Agent Skills shared across Claude Code and Codex. This
repository owns personal workflow knowledge; third-party skills stay managed by
their upstream repositories.

## Catalog

| Skill | Purpose |
|---|---|
| `agentic-engineering` | Beads, workmux, worktrees, tmux, Agent Mail, review, and landing |
| `dotfiles-maintenance` | Safe dotfiles audits, profile changes, sync, performance diagnosis, and verification |

## Install

The agent profiles in the dotfiles repository clone this repo to
the sibling `../agent-skills` path and publish each `skills/*` directory through
`~/.agents/skills` to Claude and Codex.

Manual bootstrap:

```bash
git clone https://github.com/AveryClapp/agent-skills.git ../agent-skills
~/Documents/Coding/GitProjects/dotfiles/update.sh --profile agent-workstation
```

Edit skills here, run `just check`, then rerun the dotfiles sync. The deployed
paths are symlinks, so content edits are visible immediately; sync is only needed
when adding or renaming a skill.

The dotfiles installer clones only when the sibling repo is absent. It never
auto-pulls or overwrites local skill work; update this repository with normal Git
commands when you choose.

Fresh-machine installation requires the GitHub repository to exist and contain
an initial branch. Creating or pushing that remote remains an explicit operator
action.

## Policy

- Keep skill metadata specific enough to trigger only on relevant work.
- Keep `SKILL.md` concise and move detailed material into `references/`.
- Never put machine paths, credentials, generated MCP tokens, or project secrets
  in a skill.
- Do not vendor third-party skills here. Install them with the dotfiles skill
  packs so upstream updates remain available.
