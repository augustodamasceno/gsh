# Gin Shell or GSH   
 
## This project is a collection of bash scripts and bash programming examples.   

## How it works  
All scripts are added in the folder .gsh in the home directory, and this directory is  
appended in the PATH variable (in the bash and zsh rcfiles).
 
## Instalation  
```
$ git clone https://github.com/augustomatheuss/gsh.git 
$ cd gsh 
$ bash install.sh    
```
  
## Scripts  
| Script | Description |  
| -- | -- |  
| **cgd** | List directory contents when cd command is used. |  
| **gtop** | Display Linux processes by resources (the top 3) cpu stats needs sysstat |  
| **gdu** | Get the total size of the current repository |  
| **allusers** | List all users |  
| **airkiss** | Run aircrack-ng with bigger pcapdump file from Kismet and a wordlist (in ~/kismet) |  
| **getip** | Find IP of a machine from the network IP address and the MAC-ADDRESS |  
| **getnames** | Find names of hosts from the lan base IP |  
| **gkill** | Kill all process with the name |  
| **ikill** | Interative kill to a process with the string in name |  
| **gpsu** | Show all users with processes running |  
| **qrcode** | Generate a qrcode png image file from text on a file (needs qrencode) |  
| **gvalgrind** | Use memcheck from valgrind to search memory leaks |  
| **ggpg** | Encrypt and decrypt files whith gnupg |  
| **gvenvnew** | Create a new virtualenv with python in directory ~/virtualenv/virtualenv-name |  
| **gvenv** | source for a virtualenv in ~/.virtualenv/ |  
| **gps** | ps aux command with human readable sizes |  
| **gshot** | Take a screenshot, the output is a png file with the time and date of the screenshot |  
| **randstr** | Get a random string with n characters |  
| **ggitclone** | Clone a personal github or bitbucket repository |  
| **webimages** | Get all images on a website |  
| **glock** | Lock Screen (needs i3lock). For background image, copy a PNG image file to ~/.gsh/img/locks.png |  
| **pubip** | Get the public IP |  
| **grsync** | Rsync with progress bar using archive mode and skip based on checksum |   
| **gmonitor** | Visual monitoring the system (users, cpu and mem) |   
| **gmvpre** | Add prefix to all files in current folder |  
| **gmvpos** | Add postfix to all files in current folder |  
| **pubiplog** | Public IP log and access |   
| **gmv** | Rename all files with a pattern |    
  

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
