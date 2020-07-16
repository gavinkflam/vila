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
UserCfgLog 'asdf' "Checkout latest version $asdf_latest_version"
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

function UserCfgAsdfInstallTool() {
  tool_version="$(grep "$1" "$HOME/.tool-versions" | awk '{print $2}')"
  "$asdf_exe" install "$1" "$tool_version"
}

UserCfgAsdfAddPlugin 'clojure'
UserCfgAsdfAddPlugin 'direnv'
UserCfgAsdfAddPlugin 'haskell'
UserCfgAsdfAddPlugin 'java'
UserCfgAsdfAddPlugin 'nodejs'
UserCfgAsdfAddPlugin 'python'
UserCfgAsdfAddPlugin 'ruby'

UserCfgLog 'asdf' 'Import NodeJS release key'
"$asdf_path/plugins/nodejs/bin/import-release-team-keyring"

UserCfgLog 'asdf' 'Install tools'

UserCfgAsdfInstallTool 'direnv'
"$asdf_exe" install java adopt-openjdk-11+28
"$asdf_exe" install clojure 1.10.1
"$asdf_exe" install haskell 8.6.3
"$asdf_exe" install nodejs 12.14.0
"$asdf_exe" install ruby 2.6.1
