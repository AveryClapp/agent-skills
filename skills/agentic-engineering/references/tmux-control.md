# Robust tmux Control

Address panes by stable pane ID (`%42`), not by a human-readable location that
can change after windows are reordered.

Send literal text through a named tmux buffer:

```bash
buffer="agent-send-$$"
tmux set-buffer -b "$buffer" -- "$prompt"
tmux paste-buffer -b "$buffer" -t '%42' -d
tmux send-keys -t '%42' Enter
```

Use `agent-send` for this operation. It verifies that the target pane exists and
is alive before sending.

Capture output as evidence:

```bash
agent-capture %42 200
```

For automation, use tmux hooks, `wait-for`, pane user options, or control mode.
Do not synchronize agent startup with arbitrary sleeps or infer completion only
from screen text.

When NTM is installed, prefer its status, activity, health, dashboard, and robot
surfaces for fleet-level observation. Continue to use workmux for worktree
lifecycle and stable pane IDs for low-level recovery or evidence capture. NTM
must not become a competing task store beside Beads.
