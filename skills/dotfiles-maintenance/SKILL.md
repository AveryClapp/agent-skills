---
name: dotfiles-maintenance
description: Audit, change, synchronize, and verify Avery's portable dotfiles and agent workstation. Use for shell startup or completion problems, Git latency, directory navigation, install profiles and flags, terminal/tmux/Neovim config, shared skill publication, hooks, machine-local overrides, or credential-safe dotfiles maintenance.
---

# Dotfiles Maintenance

Treat the dotfiles checkout as source and the home-directory files as deployed
state. Preserve unrelated work and never push or commit unless explicitly asked.

## Establish Scope

1. Read repository instructions and `git status --short` before editing.
2. Use `rg` to locate the owning source file. Do not patch generated home copies.
3. Keep host paths, private helper functions, and credentials in documented local
   override files. Never inspect or print secret values.
4. Select the smallest installation profile that satisfies the machine:
   `ssh`, `agent`, `full`, or `agent-workstation`.

## Diagnose Performance

- Benchmark a fresh interactive shell, not the current long-lived process.
- Separate local Git work (`git status`) from transport (`git ls-remote origin
  HEAD`); never use a real push as a benchmark.
- Inspect prompt hooks, completions, filesystem monitors, and Git hooks before
  changing global Git behavior.
- Keep prompt and directory navigation paths free of repeated subprocesses.

## Change And Sync

1. Edit the repository source with narrowly scoped patches.
2. Run `./update.sh --profile <profile> --dry-run` before a broad sync.
3. Apply config with `./update.sh --profile <profile>` only when deployment was
   requested. Sync must preserve machine-local files and non-symlink client
   skills.
4. Author personal skills in sibling `../agent-skills/skills`, then sync their shared
   catalog links. Do not copy them back into the dotfiles repository.
5. Keep generated MCP client configs and tokens ignored. Use templates or
   machine-local installers instead of versioning credentials.

## Verify

Run the narrow checks first, then the repository contract:

```bash
bash -n bashrc aliases setup_config.sh update.sh bin/*
just check
dotfiles-doctor
agent-doctor
```

For installer changes, cover at least a workstation dry run and an SSH or
no-sudo dry run. For shell changes, verify command resolution and completion in
a fresh interactive Bash. For Git hooks, invoke the hook with Lefthook and
confirm there is no hidden pre-push test suite.
