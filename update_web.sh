#!/bin/bash

DIFFHTML=$(sudo diff /home/yyan/webpage/index.html /var/www/html/index.html)
DIFFCSS= $(sudo diff /home/yyan/webpage/style.css /var/www/html/style.css)

if [ "$DIFFHTML" != "" ]
then
	sudo cp /home/yyan/webpage/index.html /var/www/html/index.html
	echo "Webpage html get updated!" | mail -s "Web deployment" root
fi;

if [ "$DIFFCSS" != "" ]
then
	sudo cp /home/yyan/webpage/style.css /var/www/html/style.css
	echo "Webpage css get updated!" | mail -s "Web deployment" root
fi;

