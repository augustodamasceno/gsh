# Gin Shell or GSH   

## This project is a collection of bash scripts.   

## How it works  
All scripts are added in the folder .gsh in the home directory, and this directory is  
appended in the PATH variable (in the bash and zsh rcfiles).

## Installation and Update  
```
$ git clone https://github.com/augustomatheuss/gsh.git
$ cd gsh
$ bash install.sh    
```

## Uninstall
```
bash remove.sh
```

## Miscellaneous Scripts  
| Script | Description |  
| -- | -- |  
| **cdl** | This script runs "cd" and "ls -lhat" between horizontal lines. |  
| **gshot** | Take a screenshot, the output is a png file with the time and date of the screenshot |  
| **webimages** | Get all images on a website |  
| **glock** | Lock Screen (needs i3lock) for Window managers. For background image, copy a PNG image file to ~/.gsh/img/locks.png |  
| **qrcode** | Generate a qrcode png image file from text on a file (needs qrencode) |  
| **ggif** | Creates a gif from a list of images |    

## DEV and DEVOPS Scripts  
| Script | Description |  
| -- | -- |  
| **ggithelp** | Git cheat sheet  |  
| **ikill** | Interative kill to a process with a string in name |  
| **gtop** | Display Linux processes by resources (the top 3) - needs: sysstat |  
| **gdu** | Get the total size of the current repository |  
| **allusers** | List all users |  
| **gkill** | Kill all process with the name |  
| **gpsu** | Show all users with processes running |  
| **gvalgrind** | Use memcheck from valgrind to search memory leaks |  
| **gvenvnew** | Create a new virtualenv with python in directory ~/virtualenv/virtualenv-name |  
| **gvenv** | source for a virtualenv in ~/.virtualenv/ |  
| **gps** | ps aux command with human readable sizes |  
| **ggitclone** | Clone a personal github or bitbucket repository |  
| **grsync** | Rsync with progress bar using archive mode and skip based on checksum |   
| **gmonitor** | Visual monitoring the system (users, cpu and mem) |   
| **gmvpre** | Add prefix to all files in current folder |  
| **gmvpos** | Add postfix to all files in current folder |  
| **gmv** | Rename all files with a pattern |    
| **gfree** | Runs free with -wht command |   
| **gdocker** | Display a list of Docker commands |   

## Security and Networking Scripts  
| Script | Description |  
| -- | -- |  
| **pubip** | Get the public IP |    
| **pubiplog** | Public IP log and access |   
| **glookup** | Return the IPv4 or IPv6 from a name |
| **getnames** | Find names of hosts from the lan base IP |  
| **getip** | Find IP of a machine from the network IP address and the MAC-ADDRESS |  
| **airkiss** | Run aircrack-ng with bigger pcapdump file in ~/kismet and a wordlist  |   
| **ggpg** | Encrypt, encrypt and sign, and decrypt files with gnupg |  
| **ghmac** | Derivates key from secure password hashing with openssl. |  
| **grand** | Get a random string with n characters |  
| **getsonicwallconfig** | Export CLI configuration of a Sonicwall via SSH to a FTP server |  
| **sonicwallconfigure** | Configure Sonicwall via SSH and CLI commands from file  |


## [Bash programming examples](https://github.com/augustomatheuss/adlabs/tree/master/bash-notebook)


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
