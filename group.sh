# -*- coding:utf-8 -*-
#!/bin/bash

#gam update group operations@rekic.me add member user don@rekic.me

gam_command() {
  $HOME/bin/gam/gam update group $group_email add member user "$email"
  }

IFS=,
while read email firstname lastname password org title; do
  email=${email//\"/}
  group_email=$1
  gam_command $group_email $email  &
  while (( $(jobs | wc -l) >= 20 )); do
    sleep 0.1
    jobs > /dev/null
    done
done < users.csv

wait
