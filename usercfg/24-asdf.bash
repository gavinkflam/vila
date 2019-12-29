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
UserCfgAsdfAddPlugin 'ocaml'
UserCfgAsdfAddPlugin 'opam'
UserCfgAsdfAddPlugin 'python'
UserCfgAsdfAddPlugin 'ruby'
UserCfgAsdfAddPlugin 'sbt'

UserCfgLog 'asdf' 'Import NodeJS release key'
"$asdf_path/plugins/nodejs/bin/import-release-team-keyring"

UserCfgLog 'asdf' 'Install tools'

opam_version='2.0.5'

UserCfgAsdfInstallTool 'direnv'
"$asdf_exe" install java adopt-openjdk-11+28
"$asdf_exe" install clojure 1.10.1
"$asdf_exe" install ocaml 4.09.0
"$asdf_exe" install opam "$opam_version"
"$asdf_exe" install haskell 8.6.3
"$asdf_exe" install nodejs 12.14.0
"$asdf_exe" install ruby 2.6.1

UserCfgLog 'asdf' 'Initialize Opam'
"$HOME/.asdf/installs/opam/$opam_version/bin/opam" init --disable-shell-hook

# Language server path
lsp_path="$HOME/.lsp"
mkdir -p "$lsp_path"

# ReasonML language server
rlsp_version='1.7.4'

if [ -f "$lsp_path/reason-language-server" ] && \
  [ -f "$lsp_path/reason-language-server-version" ] && \
  [ "$(cat "$lsp_path/reason-language-server-version")" = "$rlsp_version" ]; then
  UserCfgLog 'asdf' 'ReasonML LSP is already up to date, skipping'
else
  UserCfgLog 'asdf' 'Install ReasonML LSP'

  rm -f "$lsp_path/reason-language-server"
  wget -O "$lsp_path/rls-linux.zip" \
    "https://github.com/jaredly/reason-language-server/releases/download/$rlsp_version/rls-linux.zip"
  unzip -j "$lsp_path/rls-linux.zip" rls-linux/reason-language-server -d "$lsp_path"

  echo "$rlsp_version" > "$lsp_path/reason-language-server-version"
  rm -f "$lsp_path/rls-linux.zip"
fi
