#!/bin/bash

expect -c "
spawn ssh -o StrictHostKeyChecking=no <user>@<IP>

expect \"*password: *\"
send \"<password>\r\"
expect \"*:*\"
sleep 2
send \"configure\r\"
expect \"*#*\"
send \"<command>\r\"
expect \"*#*\"
send \"commit\r\"
expect \"*#*\"
send \"exit\r\"
expect \"*$*\"
send \"exit\r\"
interact
"