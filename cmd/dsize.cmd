alias_dsize()
{
	du -csbh ./* | tail -n 1 
}
alias dsize=alias_dsize
