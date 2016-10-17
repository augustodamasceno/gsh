alias_namekill()
{
	name=$1
	ps aux | awk '{ print $2, $11}' | grep $name | awk '{print $1}' | xargs kill -9
}
alias namekill=alias_namekill
