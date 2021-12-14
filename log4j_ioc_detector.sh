#!/bin/bash
############################################################
# A basic Bash script to detect log4j Indicator of Compromise (IoC) in Linux.
# Author: Omar Santos (@santosomar)
# Version: 0.0.1                                              
############################################################

Banner()
{
    echo "A basic Bash script to detect log4j Indicator of Compromise (IoC) in Linux."
    echo "Author: Omar Santos (@santosomar)"
    echo "+------------------------------------------+"
    echo "Scan Started:"
    printf "| %-40s |\n" "`date`"

}

Banner
sleep 2

echo "Searching for exploitation attempts in uncompressed files in folder /var/log and all sub folders"
sudo egrep -I -i -r '\$(\{|%7B)jndi:(ldap[s]?|rmi|dns|nis|iiop|corba|nds|http):/[^\n]+' /var/log

echo "Searching for  exploitation attempts in compressed files in folder /var/log and all sub folders"
sudo find /var/log -name \*.gz -print0 | xargs -0 zgrep -E -i '\$(\{|%7B)jndi:(ldap[s]?|rmi|dns|nis|iiop|corba|nds|http):/[^\n]+'


echo "Searching for obfuscated variants"
sudo find /var/log/ -type f -exec sh -c "cat {} | sed -e 's/\${lower://'g | tr -d '}' | egrep -I -i 'jndi:(ldap[s]?|rmi|dns|nis|iiop|corba|nds|http):'" \;
sudo find /var/log/ -name '*.gz' -type f -exec sh -c "zcat {} | sed -e 's/\${lower://'g | tr -d '}' | egrep -i 'jndi:(ldap[s]?|rmi|dns|nis|iiop|corba|nds|http):'" \;

