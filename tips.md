#Tips for script with bash  

##Tip 1. Running the script just calling the name  

You first line in file should be the line bellow  
```
#!/bin/bash  
```

Put your script in /usr/bin and give execute permission  
```
chmod 755 /usr/bin/your-script  
```

You can put in /usr/sbin, but you have to call sudo first  

##Tip 2. Test if a file exist  
if (test -e the-file)  
then   
  echo "Do something!"  
fi  

## Tip 3. Wait n seconds  
sleep n  

## Tip 4. Ask the user Y/n  
read ok  
if [ "$ok" = "Y" ]; then ok="y";fi  
if [ "$ok" = "y" ]  
then  
	echo "Do something!"  
fi  


