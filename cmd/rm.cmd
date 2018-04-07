alias_rm()
{
	shred $1
	rm $1
}
alias rm=alias_rm
