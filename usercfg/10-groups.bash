username="$(whoami)"

declare -a groups
groups=(
  docker
  # Bluetooth
  lp
  # Brightnessctl
  video
  input
  # Libvirt
  libvirt
  # Sudo
  wheel
)

declare -a groups_to_add
groups_to_add=()

username="$(whoami)"
current_groups="$(id -nG "$username")"

for g in "${groups[@]}"; do
  found="$(echo "$current_groups" | grep -q "\\b$g\\b" || echo 'no')"
  if [[ "$found" == 'no' ]]; then
    groups_to_add+=("$g")
  fi
done

if [[ $(echo "${groups_to_add[@]}" | wc -w) -gt 0 ]]; then
  UserCfgLog 'UserGroups' "Add $(echo "${groups_to_add[@]}" | wc -w) groups to user $username"
  groups_expr="$(echo "${groups_to_add[@]}" | tr ' ' ',')"
  sudo usermod -aG "$groups_expr" "$username"
else
  UserCfgLog 'UserGroups' "All groups were added, skipping"
fi
