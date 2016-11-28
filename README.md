##Bash script - getting sysinfo with available Nginx sites and PostgreSQL databases 

Example of output:
```
Operating System: Ubuntu 16.04.1 LTS
            Kernel: Linux 4.4.0-47-generic
      Architecture: x86-64
===CPU===
model name : Intel(R) Core(TM) i5 CPU       M 460  @ 2.53GHz
cpu cores : 1
===MEMORY===
              total        used        free      shared  buff/cache   available
Mem:           992M        225M        102M         26M        663M        558M
Swap:          1.0G        448K        1.0G
Total:         2.0G        226M        1.1G
===DISKS===
/0/4/0.0.0      /dev/sda    disk        17GB VBOX HARDDISK
/0/4/0.0.0/1    /dev/sda1   volume      487MiB Linux filesystem partition
/0/4/0.0.0/2    /dev/sda2   volume      15GiB Extended partition
/0/4/0.0.0/2/5  /dev/sda5   volume      15GiB Linux LVM Physical Volume partition
===NETWORK INFO===
127.0.0.1/8
192.168.0.101/24
172.17.0.1/16
172.18.0.1/16
Gateway 192.168.0.1
DNS:
nameserver 192.168.0.1
===WEB SERVER===
nginx version: nginx/1.10.0 (Ubuntu)

Web-sites
config      DNS name         GET response
-----------------------------------------
site1.conf; site1.local:80; HTTP/1.1 200 OK
site2.conf; site2.local:80; HTTP/1.1 200 OK
===DATABASE SERVER===
PostgreSQL 9.5.5 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609, 64-bit
Databases
-----------------------------------------
template1 - 6984 kB
template0 - 6865 kB
postgres - 6984 kB
dbsite1 - 7016 kB
dbsite2 - 6865 kB
dbsite3 - 6865 kB
```
