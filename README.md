# Gin Shell or GSH   
## This project is a collection of bash scripts.   
> # Copyright (c) 2015-2023, Augusto Damasceno.  
> All rights reserved.  
> SPDX-License-Identifier: GPL-3.0


## How it works  
All scripts are added in the folder .gsh in the home directory, and this directory is  
appended in the PATH variable (in the bash and zsh rcfiles).

## Installation and Update  
```
$ git clone https://github.com/augustodamasceno/gsh.git
$ cd gsh
$ bash install.sh    
```

## Uninstall
```
bash remove.sh
```

## DEV and DEVOPS Scripts  
| Script | Description |  
| -- | -- |  
| **bulkcp** | Copy all files from a list as relative paths of a source folder to a destination folder with the same subfolders |    
| **ikill** | Interative kill to a process with a string in name |  
| **gkill** | Kill all process with the name |  
| **gtop** | Display Linux processes by resources (the top 3) - needs: sysstat |  
| **gmonitor** | Visual monitoring the system (users, cpu and mem) |   
| **gps** | ps aux command with human readable sizes |  
| **gpsu** | Show all users with processes running |  
| **allusers** | List all users |  
| **gdu** | Get the total size of the current repository |  
| **gservice** | Add a new service to the systemd |  
| **gservice-conf** | Generates a systemd unit configuration |  
| **gvalgrind** | Use memcheck from valgrind to search memory leaks |  
| **ggitclone** | Clone a personal github or bitbucket repository |  
| **grsync** | Rsync with progress bar using archive mode and skip based on checksum |   
| **gmvpre** | Add prefix to all files in current folder |  
| **gmvpos** | Add postfix to all files in current folder |  
| **gmv** | Rename all files with a pattern |    
| **gtargz** | Creates a tar.gz file with the contents of a folder |    
| **gfree** | Runs free with -wht command |   
| **gclock** | Update time (using an official brazilian server) |
| **genv** | Manage python virtualenvs |  

## Security and Networking Scripts  
| Script | Description |  
| -- | -- |  
| **gnet** | See all network connections |    
| **pubip** | Get the public IP |    
| **pubiplog** | Public IP log and access |   
| **glookup** | Return the IPv4 or IPv6 from a name |
| **getnames** | Find names of hosts from the lan base IP |  
| **getip** | Find IP of a machine from the network IP address and the MAC-ADDRESS |  
| **airkiss** | Run aircrack-ng with bigger pcapdump file in ~/kismet and a wordlist  |   
| **ggpg** | Encrypt, encrypt and sign, and decrypt files with GnuPG |  
| **gpghelp** | GnuPG cheat sheet |  
| **ghmac** | Derivates key from secure password hashing with openssl |  
| **grand** | Get a random string with n characters |  
| **grandmac** | Get a random MAC address locally assigned and unicast |
| **getsonicwallconfig** | Export CLI configuration of a Sonicwall via SSH to a FTP server |  
| **sonicwallconfigure** | Configure Sonicwall via SSH and CLI commands from file  |

## Miscellaneous Scripts  
| Script | Description |  
| -- | -- |  
| **cdl** | This script runs "cd" and "ls -lhat" between horizontal lines. |  
| **glock** | Lock Screen (needs i3lock) for Window managers. For background image, copy a PNG image file to ~/.gsh/img/locks.png |  
| **gpdf** | Utilities for pdf (merge or create from images) |  
| **gshot** | Take a screenshot, the output is a png file with the time and date of the screenshot |  
| **webimages** | Get all images on a website |  
| **qrcode** | Generate a qrcode png image file from text on a file (needs qrencode) |  
| **ggif** | Creates a gif from a list of images |    
| **gfeh-grid** | Makes a squared image grid using feh |   

## [My Bash Courseware](https://github.com/augustodamasceno/adlabs/blob/main/nix/nix001.md)

### Software Reference  

* https://www.gnu.org/software/bash/  
* https://wiki.archlinux.org/index.php/Bash  
* https://www.linux.com/answers/what-purpose-path-variable  
* https://github.com/kennethreitz/httpbin  
* http://www.aircrack-ng.org/  
* https://nmap.org/  
* https://fukuchi.org/works/qrencode/  
* https://dev.mysql.com/  
* http://www.valgrind.org/  
* https://www.gnu.org/software/bc/  
* https://www.debian.org/CD/verify  
* https://wiki.debian.org/ScreenShots  
* https://www.archlinux.org/  
* https://www.openssl.org/docs/manmaster/man1/openssl.html  
* https://www.kismetwireless.net/  
* https://gnupg.org/  
* https://www.ietf.org/rfc/rfc1035.txt 
* https://tools.ietf.org/html/rfc7042
* https://systemd.io/
* https://imagemagick.org/index.php
* https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/
* Aho, A., Kernighan, B. and Weinberger, P. (2023). The Awk Programming Language. Addison-Wesley Professional  
* https://www.gnu.org/software/gawk/manual/gawk.html  
