markhere_()
{
	printf "\n"
	for i in $(seq $(tput cols))
	do
		printf "_";
	done
	printf "\n"
}
alias markhere=markhere_
