# Generate completion files before Zim runs compinit through Sheldon.
# Check executable metadata without running the commands on every startup.
() {
  emulate -L zsh

  # Commands that provide Zsh completion scripts.
  local -a completion_tools=(chezmoi mise gh)

  local completion_dir=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/site-functions
  fpath=("$completion_dir" $fpath)
  zmodload -F zsh/stat b:zstat || return

  local tool executable completion_file temporary_file
  local executable_signature cached_signature compdef_header
  local -A executable_metadata

  for tool in "${completion_tools[@]}"; do
    # Resolve symlinks so switching installed versions also triggers regeneration.
    executable=$(whence -p "$tool") || continue
    executable=${executable:A}
    zstat -H executable_metadata -- "$executable" || continue

    executable_signature="# executable: $executable"
    executable_signature+=" ${executable_metadata[device]} ${executable_metadata[inode]}"
    executable_signature+=" ${executable_metadata[size]} ${executable_metadata[mtime]} ${executable_metadata[ctime]}"

    # The first line registers the completion; the second records its executable.
    completion_file=$completion_dir/_$tool
    cached_signature=''
    if [[ -r $completion_file ]]; then
      {
        IFS= read -r compdef_header
        IFS= read -r cached_signature
      } < "$completion_file"
    fi
    [[ $cached_signature == "$executable_signature" ]] && continue

    # Only the first startup or a changed executable needs to run the generator.
    command mkdir -p -- "$completion_dir" || continue
    temporary_file=$(command mktemp "$completion_dir/.${tool}.XXXXXX") || continue

    # Publish a complete file atomically; retain the last good file on failure.
    if {
      print -r -- "#compdef $tool"
      print -r -- "$executable_signature"
      case $tool in
        gh) "$executable" completion --shell zsh ;;
        *) "$executable" completion zsh ;;
      esac
    } > "$temporary_file"; then
      command mv -f -- "$temporary_file" "$completion_file"
    else
      print -u2 -- "Failed to generate $tool completions; retrying next shell startup."
    fi
    [[ ! -e $temporary_file ]] || command rm -f -- "$temporary_file"
  done
}
