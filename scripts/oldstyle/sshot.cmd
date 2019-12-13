alias_screenshot()
{
	xwd | xwdtopnm | pnmtopng > screenshot$(date +"%d%h%y_%H-%M-%S").png
}
alias sshot=alias_screenshot
