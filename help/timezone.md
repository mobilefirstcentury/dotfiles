#Timezone data files are stored in the /usr/share/zoneinfo directory tree.
#Each continent has a corresponding subdirectory, e.
#Each continent subdirectory contains timezone files named by cities in the continent, e.g., /usr/share/zoneinfo/America/Vancouver.



$ sudo -s  sh -c 'echo America/Vancouver > /etc/timezone'
$ sudo dpkg-reconfigure -f noninteractive tzdatak # reconfigure after modifying /etc/timezon
