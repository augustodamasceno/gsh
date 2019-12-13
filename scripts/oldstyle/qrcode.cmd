alias_qrcode()
{
	cat $1 | qrencode -o $2 -l M -s 5
}
alias qrcode=alias_qrcode
