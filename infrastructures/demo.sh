time knife ec2 server create -r 'role[base], role[monitoring]'  \
  -N monitoring-1.dev.us-east-1.aws.911memorial.org             \
  -E dev                  \
  -G demo                 \
  -I ami-5e837b37         \
  -S id_rsa_affs          \
  -x root                 \
  -f m1.large             \
  -d el6-fullstack

time knife ec2 server create -r 'role[base], role[mysql]'   \
  -N mysql-1.dev.us-east-1.aws.911memorial.org              \
  -E dev                  \
  -G demo                 \
  -I ami-5e837b37         \
  -S id_rsa_affs          \
  -x root                 \
  -f m1.large             \
  -d el6-fullstack

