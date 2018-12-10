alias_githubclone()
{
	git clone git@github.com:"$(git config user.name)"/"$1".git
}
alias githubclone=alias_githubclone

