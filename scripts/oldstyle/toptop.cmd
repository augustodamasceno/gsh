alias_toptop()
{
	printf '\033[0;31m----------TOP CPU USE--------\033[0m\n'
	ps aux | head -1
	ps aux | sort -rn -k 3,6 | head -3
	printf '\033[0;31m----------TOP MEMORY USE--------\033[0m\n'
	ps aux | head -1
	ps aux | sort -rn -k 4,6 | head -3
}
alias toptop=alias_toptop


