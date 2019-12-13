alias_allimages()
{
  wget -r -A jpeg,jpg,bmp,gif,png $1
}
alias allimages=alias_allimages
