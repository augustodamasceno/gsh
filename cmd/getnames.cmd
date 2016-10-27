alias_getnames()
{
	sudo nmap -sn $1 > pinglan
	ips=$(cat pinglan | grep "Nmap scan report for" | awk '{print $5}')
	
	# Use this if you need to cut '(' and ')'  
	# ips=$(cat pinglan | grep "Nmap scan report for" | grep -Po '(?<=\().*(?=\))' | awk '{print $5}')

	for i in ${ips[@]}
	do
		echo "nslookup in IP "$i
		sudo nslookup $i
	done
}
alias getnames=alias_getnames
