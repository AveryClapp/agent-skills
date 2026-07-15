---
name: agentic-engineering
description: Coordinate substantial engineering work with Beads, Git worktrees, workmux, tmux, Agent Mail, independent review, and verification. Use when planning or running parallel agents, delegating tasks, resuming long work, reviewing an agent branch, or landing completed work.
---

# Agentic Engineering

Use the repository's local instructions first. This skill supplies the common
coordination workflow, not project-specific commands.

## Choose The Smallest Workflow

1. Use one agent in the current checkout for a small, isolated change.
2. Use one workmux worktree for substantial work that should not disturb the
   current checkout.
3. Use multiple worktrees only when tasks have independent file ownership or can
   be sequenced through explicit dependencies.
4. Add Agent Mail when two or more agents may touch the same repository.

Multi-agent execution costs more context and coordination. Do not parallelize a
tightly coupled change merely because more agents are available.

## Start Work

When `.beads/` exists:

```bash
bd prime
bd ready
bd show <id>
bd update <id> --claim
```

Create an isolated worktree with the Bead ID as its handle:

```bash
agent-new <id>
```

For work without a Bead:

```bash
agent-new <branch> --prompt "Concrete objective and acceptance criteria"
```

## Coordinate

- State the files or modules the task owns.
- Reserve those paths through Agent Mail when it is running.
- Use the Bead ID as the Agent Mail thread ID.
- Send decisions, blockers, and interface changes to the thread.
- Release reservations when work stops or ownership changes.

See [references/beads-and-mail.md](references/beads-and-mail.md) for the
coordination contract.

## Verify And Review

Run the repository's checks, or use `agent-check` to select a conventional check
command. It prefers a repository-owned `just check` contract when available.
Review the resulting diff from a separate worktree:

```bash
agent-review <branch>
```

The reviewer should report concrete findings with file and line references. It
must not edit the implementation branch unless explicitly asked.

## Finish

Record relevant evidence, close the Bead, release reservations, and land only
after review issues are resolved:

```bash
bd close <id> "Implemented and verified"
agent-land
agent-gc
```

Do not push or merge unless the user requested it. `agent-land` is an explicit
operator command and must never be invoked as an implicit cleanup step.

For robust pane messaging and evidence capture, see
[references/tmux-control.md](references/tmux-control.md).

For the portable skill packs, CASS, structural search, browser verification, and
fast Git hooks, see [references/tooling.md](references/tooling.md).
