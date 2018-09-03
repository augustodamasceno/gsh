alias_aptu()
{
	sudo apt-get update
}
alias aptu=alias_aptu
alias_aptup()
{
	sudo apt-get upgrade
}
alias aptup=alias_aptup
alias_apti()
{
	sudo apt-get install $1
}
alias apti=alias_apti
alias_apts()
{
	aptitude search $1
}
alias apts=alias_apts

