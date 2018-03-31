# Tips for script with bash  

## Tip 1. Running the script just calling the name  

You first line in file should be the line bellow  
```
#!/bin/bash  
```

Put your script in /usr/bin and give execute permission  
```
chmod 755 /usr/bin/your-script  
```

You can put in /usr/sbin, but you have to call sudo first  

## Tip 2. Test if a file exist  
```
if (test -e the-file)  
then   
  echo "Do something!"  
fi  
```

## Tip 3. Wait n seconds  
```
sleep n  
```

## Tip 4. Ask the user Y/n  
```
read ok  
if [ "$ok" = "Y" ]; then ok="y";fi  
if [ "$ok" = "y" ]  
then  
	echo "Do something!"  
fi  
```

## Tip 5. Get largest file in a directory  
```
'$(ls the-directory --sort=size | head -n 1)'
```  

## Tip 6. Get number of columns in terminal  
```
$(tput cols)
```

## Tip 7. Get n lines above every result with grep  
```
grep -B n "the-pattern"  
```

## Tip 8. Cut columns  
```
awk '{print $5}' 
or
awk '{print $1, $2}'
```

## Tip 9. Get text between the parentesis  
```
grep -Po '(?<=\().*(?=\))' 
```

## Tip 10. Find file with expression inside current directory or subs  
```
grep -r . -e "the-expression"
```

## Tip 11. Tip 10 with types of file in specific (C code in example)  
```
grep --include=\*.{c,h} -r . -e "the-expression"
```

## Tip 12. See all users  
```
awk -F':' '{ print $1}' /etc/passwd
```


