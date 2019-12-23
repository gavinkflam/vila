usercfg_root="$(cd "$(dirname "$0")" && pwd)"

function UserCfgLog() {
  echo -e "====> UserCfg [$1]: $2"
}

function LinkFile() {
  if [[ -L "$HOME/$1" ]]; then
    UserCfgLog 'LinkFile' "$1 is present, skipping"
    return 0
  fi

  target_dir="$(dirname "$HOME/$1")"
  if [[ ! -d "$target_dir" ]]; then
    UserCfgLog 'LinkFile' "Create parent directories for $1"
    mkdir -p "$target_dir"
  fi

  if [[ -f "$HOME/$1" ]]; then
    UserCfgLog 'LinkFile' "$1 is a regular file, deleting"
    rm "$HOME/$1"
  fi

  UserCfgLog 'LinkFile' "Create symlink for $1"
  ln -s "$usercfg_root/home/$1" "$HOME/$1"
}
