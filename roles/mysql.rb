name "mysql"
description "mysql role"
run_list [
  "recipe[selinux::off]",
#  "recipe[mysql::server]"
]
