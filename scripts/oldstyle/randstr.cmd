alias_randstr()
{
	cat /dev/urandom | base64 | head -c $1
}
alias randstr=alias_randstr
