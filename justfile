set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

# Validate required files, frontmatter, names, and UI metadata.
check:
    @for dir in skills/*; do test -d "$dir" || continue; test -f "$dir/SKILL.md"; test -f "$dir/agents/openai.yaml"; name="$(sed -n 's/^name: //p' "$dir/SKILL.md" | head -n 1)"; test "$name" = "${dir##*/}" || { echo "name mismatch: $dir -> $name" >&2; exit 1; }; done
    @git diff --check

list:
    @for dir in skills/*; do test -d "$dir" && basename "$dir"; done
