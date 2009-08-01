Listen 8080
ServerName localhost.example.org:8080
ServerRoot /home/seltsam/tmp
DocumentRoot /var/www/

User www-data
Group www-data

MaxClients 150
StartServers 5
MinSpareServers 5
MaxSpareServers 10
MaxRequestsPerChild 100
ErrorLog logs/error_log
TransferLog logs/access_log
HostnameLookups Off

<Directory /pl/>
  Options ExecCGI FollowSymLinks
  AllowOverride None
</Directory>

LoadModule mime_module /usr/lib/apache2/modules/mod_mime.so
LoadModule cgi_module /usr/lib/apache2/modules/mod_cgi.so

<IfModule mod_mime.c>
TypesConfig /etc/mime.types
AddHandler cgi-script .cgi .pl .php
</IfModule>
