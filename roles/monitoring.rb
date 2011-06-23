name "monitoring"
description "monitoring role"
run_list [
  "recipe[munin::server]",
]
