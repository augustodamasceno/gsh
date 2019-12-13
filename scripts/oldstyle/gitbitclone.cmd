alias_gitbitclone()
{
	git clone git@bitbucket.com:"$(git config user.name)"/"$1".git
}
alias gitbitclone=alias_gitbitclone

