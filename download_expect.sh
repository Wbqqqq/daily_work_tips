
#!/usr/bin/expect
set downloadPath [lindex $argv 0]
puts $downloadPath
set timeout -1
spawn scp -r root@xxx.xxx.xxx.xxx:/root/home/$downloadPath /Users/wangbingquan/Desktop/C++/
expect "password:"
send "*****"

expect eof

catch wait result
exit [lindex $result 3]
