alias_pshuman()
{
	ps aux | numfmt --header --to=iec --field 5,6 --padding 6
}
alias psh=alias_pshuman
