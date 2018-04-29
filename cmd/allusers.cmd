alias_allusers()
{
	cut -d: -f1 /etc/passwd
}
alias allusers=alias_allusers
