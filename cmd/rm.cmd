alias_cd()
{
	shred $1
	rm $1
}
alias rm=alias_rm
