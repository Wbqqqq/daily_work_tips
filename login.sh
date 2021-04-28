#!/usr/bin/expect
set timeout -1
spawn ssh root@xxx.xxx.xxx.xxx
expect "*password"
send "**********"
expect "Compute Service !"
send "df -Th\n"
interact
