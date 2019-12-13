alias_gpgdec()
{
	gpg --recipient $1 --output $3 --decrypt $2
}
alias gpgdec=alias_gpgdec
