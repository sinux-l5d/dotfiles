---
name: chezmoi-dotfiles
description: Update this user's dotfiles through chezmoi. Use when asked to add to, modify, fix, or manage dotfiles or a home configuration file. Keep all dotfile edits in ~/.local/share/chezmoi; never apply changes to the home directory. Check work/personal purpose branches and summarize chezmoi diff before handing changes back.
---

# Edit chezmoi dotfiles

- Treat `~/.local/share/chezmoi` as the only writable dotfile source. Read live files for context, but never edit them. Do not run `chezmoi apply`, including dry-run or indirect apply commands.
- Find the target's managed source path (for example with `chezmoi source-path <target>`), and inspect nearby source conventions before editing. Keep unrelated source changes intact.
- If asked to **modify** an unmanaged target, warn that chezmoi does not manage it and offer to add it. Do not edit the live file or silently add it. If explicitly asked to **add** it, create the corresponding source entry using this repository's naming, template, and privacy conventions; avoid committing plaintext secrets.
- Check `.chezmoi.toml.tmpl`, `.chezmoiignore`, and relevant templates for `purpose`. It is chosen as `work` or `personal`: Git identity/signing, ignored files, tools, shell config, and OpenCode configuration differ. Put purpose-specific changes behind a multiline Go template branch such as `{{- if eq .purpose "work" }}`. Put each `if`, `else`, and `end` action on its own line, with settings on separate lines; do not add inline conditionals. Preserve the source's whitespace-trimming dashes: use `{{- if ... }}`, `{{- else }}`, and `{{- end }}` (with a space after the dash), and check both rendered purposes for stray blank lines. Keep shared settings shared and preserve the other purpose's behavior. If the destination purpose is unclear and changes differ by purpose, ask which one before editing.
- After editing, run `chezmoi diff` for affected target paths. This repo has a `read-source-state` hook that may install Homebrew; the owner permits it. Never run `chezmoi apply`. If a target is ignored for the current purpose or diff cannot run, say so instead of claiming verification.
- Finish with brief diff highlights and warnings: what will change on apply, any unverified purpose or secrets risk, and that no apply was run. Do not paste credentials or decrypted secret values from diff output.
