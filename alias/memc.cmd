alias_memc()
{
	valgrind --leak-check=full --track-origins=yes $1
}
alias memc=alias_memc

