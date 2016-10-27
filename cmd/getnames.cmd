alias_getnames()
{
	sudo nmap -sn $1 > pinglan
	ips=$(cat pinglan | grep "Nmap scan report for" | awk '{print $5}')
	
	# Use this if you need to cut '(' and ')'  
	# ips=$(cat pinglan | grep "Nmap scan report for" | grep -Po '(?<=\().*(?=\))' | awk '{print $5}')

	red='\033[0;31m'
	nc='\033[0m'

	for i in ${ips[@]}
	do
		echo -e "${red}host in IP${nc} "$i
		sudo host $i
	done
}
alias getnames=alias_getnames

