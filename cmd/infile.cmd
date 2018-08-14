alias_infile()
{
	grep -nri --color $1 $2
}
alias infile=alias_infile
