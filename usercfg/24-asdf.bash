# Install asdf configurations
LinkFile '.asdfrc'
LinkFile '.default-gems'
LinkFile '.default-npm-packages'
LinkFile '.tool-versions'

# Haskell
LinkFile '.ghci'

# asdf
asdf_path="$HOME/.asdf"

if [[ ! -d "$asdf_path" ]]; then
  UserCfgLog 'asdf' 'Clone asdf'
  git clone https://github.com/asdf-vm/asdf.git "$asdf_path"
else
  UserCfgLog 'asdf' 'asdf is present, fetching updates'
  cd "$asdf_path" && git fetch
fi

asdf_latest_version="$(cd "$asdf_path" && \
  git describe --abbrev=0 --tags origin/master)"
UserCfgLog 'asdf' 'Checkout latest version $asdf_latest_version'
cd "$asdf_path" && git checkout "$asdf_latest_version"

asdf_exe="$asdf_path/bin/asdf"

# Plugins
function UserCfgAsdfAddPlugin() {
  if ! "$asdf_exe" plugin-list | grep "$1"; then
    UserCfgLog 'asdf' "Add $1 plugin"
    "$asdf_exe" plugin-add "$1"
  else
    UserCfgLog 'asdf' "$1 plugin is present, pulling update"
    "$asdf_exe" plugin-update "$1"
  fi
}

UserCfgAsdfAddPlugin 'clojure'
UserCfgAsdfAddPlugin 'haskell'
UserCfgAsdfAddPlugin 'java'
UserCfgAsdfAddPlugin 'nodejs'
UserCfgAsdfAddPlugin 'ocaml'
UserCfgAsdfAddPlugin 'opam'
UserCfgAsdfAddPlugin 'python'
UserCfgAsdfAddPlugin 'ruby'
UserCfgAsdfAddPlugin 'sbt'

UserCfgLog 'asdf' 'Import NodeJS release key'
"$asdf_path/plugins/nodejs/bin/import-release-team-keyring"

UserCfgLog 'asdf' 'Install tools'
"$asdf_exe" install

UserCfgLog 'asdf' 'Initialize Opam'
"$("$asdf_exe" which opam)" init --disable-shell-hook
