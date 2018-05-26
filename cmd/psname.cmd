alias_psname()
{
	ps aux | grep -i --color $1
}
alias psname=alias_psname
