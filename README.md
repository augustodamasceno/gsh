# Scripts for bash.   
 
## This project is a collection of bash scripts and bash programming examples.   
 
## Instalation  
*	Add all alias scripts in the individual per-interactive-shell startup file (~/.bashrc)
*	Add all scripts in the directory ~/.s4bash and add this directory to the PATH variable
```
$ git clone https://github.com/augustomatheuss/scripts4bash.git 
$ cd scripts4bash 
$ bash install.sh    
```
 
### [What is an alias?](https://wiki.archlinux.org/index.php/Bash)  
> Alias is a command, which enables a replacement of a word with another string. It is often used for abbreviating a system command, or for adding default arguments to a regularly used command.
Personal aliases are preferably stored in ~/.bashrc, and system-wide aliases (which affect all users) belong in /etc/bash.bashrc.  

### [The PATH variable](https://www.linux.com/answers/what-purpose-path-variable)  
  
## Alias scripts  
| Alias Script | Description  |    
| --- |  -- |  
| **cd** | List directory contents when cd command is used. |  
| **markhere** | Simple mark, LINE. |  
| **showGitBranch** | Show the git branch when inside of a git repository, for Fedora comment the line 1 (.cmd) and uncomment 3 and 4. |  
| **toptop** | Display Linux processes by resources (the top 3) cpu stats needs sysstat |  
| **dzise** | Get the total size of the current repository |  
| **allusers** | List all users |  
| **airkiss** | Run aircrack-ng with bigger pcapdump file from Kismet and a wordlist (in ~/kismet) |  
| airkiss USAGE | airkiss WORDLIST |  
| **getip** | Find IP of a machine from the network IP address and the MAC-ADDRESS |  
| getip USAGE | getip NETWORK-IP MAC-ADDRESS |  
| **getnames** | Find names of hosts from the lan base IP |  
| getnames USAGE | getnames BASE-IP |  
| **namekill** | Kill all process with the name |  
| namekill USAGE | namekill name-of-process |  
| **ikill** | Interative kill to a process with the string in name |  
| ikill USAGE | ikill name-of-process |  
| **psname** | Show a process with a string in name, without sensitive case. |  
| psname USAGE | psname name-of-process |  
| **psusers** | Show all users with processes running |  
| **qrcode** | Generate a qrcode png image file from text on a file (needs qrencode) |  
| qrcode USAGE | qrcode file-with-text image-filename |  
| **apts** | Short names to APT commands |  
| apts USAGE | aptu for update, aptup for upgrade, apti for install and apts for search with aptitude |  
| **memc** | Use memcheck from valgrind to search memory leaks |  
| memc USAGE | memc ./YOUR-PROGRAM |  
| **gpgenc** | encrypt file whith gnupg |  
| gpgecn USAGE | gpgenc KEY-ID FILE OUTPUT-ENCRYPTED-FILENAME |  
| **gpgdec** | decrypt file whitih gnupg |  
| gpgdec USAGE | gpgdec KEY-ID ENCRYPTED-FILE OUTPUT-FILENAME |  
| **venv-new.cmd** | Create a new virtualenv with python 2.7 in directory ~/virtualenv/virtualenv-name |  
| venv-new USAGE | venv-new virtualenv-name |  
| **venv.cmd** | Source for a virtualenv in ~/.virtualenv/ |  
| venv USAGE | venv virtualenv-name |  
| **infile.cmd** | Print all lines in order in a file or directory with a expression (insensitive matching) |  
| infile USAGE | infile expression file-or-directory |  

## Scripts  
| Script | Description |  
| -- | -- |  
| **monitor** | Visual monitoring the system (users, cpu and mem) |   
| **recover-grub** | Recover grub partition from live-cd |   
| **renamePre** | Add prefix to all files in current folder |  
| **renamePos** | Add postfix to all files in current folder |  
| **ip-public** | Public IP log and access |   
| **bye-mysql** | Complete mysql remove |  
| **renaming** | Rename all files with a pattern, need to be configured first!! |   

# Bash programming examples  
| File | Description |
| -- | -- |  
| **examples/run-by-name.md**  | Install and run a command just by the name |  
| **examples/tests.md**  | Tests Command |  
| **examples/search.md** | Search files and expressions |  
| **examples/ask-the-user.md**  | Interactions with the user |  
| **examples/awk.md**  | Awk command |  
| **examples/users.md**  | Users, login and auth examples |  
| **examples/general.md**  | General examples |  
| **examples/wait.md**  | Wait and sleep examples |   
| **examples/arithmetic.md**  | Arithmetic examples |   

### Software Reference  

* https://www.gnu.org/software/bash/  
* https://wiki.archlinux.org/index.php/Bash)  
* https://www.linux.com/answers/what-purpose-path-variable  
* https://github.com/kennethreitz/httpbin  
* http://www.aircrack-ng.org/  
* https://nmap.org/  
* https://fukuchi.org/works/qrencode/  
* https://dev.mysql.com/  
* http://www.valgrind.org/  
* https://www.gnu.org/software/bc/  
 
