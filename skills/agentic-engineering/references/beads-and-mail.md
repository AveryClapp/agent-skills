# Beads And Agent Mail Contract

Beads and Agent Mail have separate ownership:

| Concern | Authority |
|---|---|
| Task status, priority, dependencies, durable project memory | Beads |
| Messages, decisions, acknowledgements, file reservations | Agent Mail |
| Source changes and integration history | Git |

Use one identifier across systems:

```text
bd-a1b2
  worktree: bd-a1b2
  branch:   bd-a1b2
  thread:   bd-a1b2
  commit:   "bd-a1b2: ..."
```

## Worker Protocol

1. Run `bd ready` and inspect the task.
2. Atomically claim it with `bd update <id> --claim`.
3. Register an Agent Mail identity for the absolute repository path.
4. Reserve the narrowest practical file globs with a finite TTL.
5. Announce the task, ownership, and expected interface changes in thread `<id>`.
6. Implement and verify in an isolated worktree.
7. Send blockers and contract changes to the thread as they occur.
8. Close the Bead only after acceptance criteria pass.
9. Release reservations and send a final evidence summary.

Reservations are advisory coordination leases. They do not replace Git
isolation, tests, review, or process sandboxing.

