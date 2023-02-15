# -*- coding:utf-8 -*-
#!/bin/bash

gam_command() {
  $HOME/bin/gam/gam create user "$email" firstname "$firstname" lastname "$lastname" password "$password" org "$org" changepassword on gal off organization title "$title" primary
  }

IFS=,
while read email firstname lastname password org title; do
  email=${email//\"/}
  firstname=${firstname//\"/}
  lastname=${lastname//\"/}
  title=${title//\"/}
  gam_command $email $firstname $lastname $title $org $x &
  while (( $(jobs | wc -l) >= 20 )); do
    sleep 0.1
    jobs > /dev/null
    done
done < users.csv

wait
