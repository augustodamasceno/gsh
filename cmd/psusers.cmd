alias_psusers()
{
	ps aux | awk '{print $1}' | uniq -u
}
alias psusers=alias_psusers
