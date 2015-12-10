you can use another tool named multitail to tail multiple files. Multitail divides the console into multiple windows: one for each file. 
multitail  /var/log/messages  /var/log/mail.log



To scroll back, type b. Then, select the file to scroll. The selected file will be displayed in a new window. Now, you can use the arrow keys as well as the PageUp/PageDown keys to scroll. To exit the scroll window, type x.

I find multitail a bit clumsy to use. For simple log file viewing I tend to stick with tail -f.
