alias_getip()
{
	sudo nmap -sn $1 > pinglan
	cat pinglan | grep -B 2 $2
}
alias getip=alias_getip
