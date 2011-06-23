name "base"
description "base role"
run_list [
  "recipe[selinux::off]",
  "recipe[etchosts]",
  "recipe[base-debug-tools]",
  "recipe[munin::client]",
]
