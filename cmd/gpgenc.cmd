alias_gpgenc()
{
	gpg --recipient $1 --output $3 --encrypt $2
}
alias gpgenc=alias_gpgenc
