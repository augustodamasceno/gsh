alias_venv-new()
{
	if ! [ -d ~/.virtualenv/ ]
	then
		mkdir ~/.virtualenv/
	fi
	virtualenv -p `which python2.7` "~/.virtualenv/$1"
}
alias venv-new=alias_venv-new
