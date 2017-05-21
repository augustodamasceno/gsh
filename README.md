## Scripts for bash.  
 
### This project is a collection of bash scripts, some scripts you can install and use with an alias.    
  
### What is an alias? (From:https://wiki.archlinux.org/index.php/Bash)
> Alias is a command, which enables a replacement of a word with another string. It is often used for abbreviating a system command, or for adding default arguments to a regularly used command.
Personal aliases are preferably stored in ~/.bashrc, and system-wide aliases (which affect all users) belong in /etc/bash.bashrc. 
  
### Run install.sh to add all alias scripts from .cmd commands in cmd/    
  
| Alias Script | Description  |    
| --- |  -- |  
| cd | List directory contents when cd command is used. |  
| markhere | Simple mark, LINE. |  
| showGitBranch | Show the git branch when inside of a git repository, for Fedora comment the line 1 (.cmd) and uncomment 3 and 4. |  
| toptop | Display Linux processes by resources (the top 3) cpu stats needs sysstat |  
| airkiss | Run aircrack-ng with bigger pcapdump file from Kismet and a wordlist (in ~/kismet) |  
| airkiss USAGE | airkiss WORDLIST |  
| getip | Find IP of a machine from the lan base IP and MAC-ADDRESS |  
| getip USAGE | getip BASE-IP MAC-ADDRESS |  
| getnames | Find names of hosts from the lan base IP |  
| getnames USAGE | getnames BASE-IP |  
| namekill | Kill all process with the name |  
| namekill USAGE | namekill name-of-process |  
| qrcode | Generate a qrcode png image file from text on a file (needs qrencode) |  
| qrcode USAGE | qrcode file-with-text image-filename |  
  
| Script | Description |  
| -- | -- |  
| monitor | Visual monitoring the system (users, cpu and mem) |   
| renamePre | Add prefix to all files in current folder |  
| renamePos | Add postfix to all files in current folder |  
| ip-public | Public IP log and access |   
| bye-mysql | Complete mysql remove |  
| renaming.sh | Rename all files with a pattern, need to be configured first!! |  


### Tips for script with bash  
* File tips.md

### Software Reference  

* https://www.gnu.org/software/bash/  
* https://github.com/kennethreitz/httpbin
* http://www.aircrack-ng.org/  
* https://nmap.org/  
* https://fukuchi.org/works/qrencode/  
* https://dev.mysql.com/
