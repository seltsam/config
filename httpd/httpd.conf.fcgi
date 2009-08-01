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

<Directory />
  Options ExecCGI FollowSymLinks
  AllowOverride None
</Directory>

LoadModule mime_module /usr/lib/apache2/modules/mod_mime.so
LoadModule fcgid_module /usr/lib/apache2/modules/mod_fcgid.so

<IfModule mod_mime.c>
TypesConfig /etc/mime.types
</IfModule>

<IfModule mod_fcgid.c>
  AddHandler	fcgid-script .fcgi 
  IPCConnectTimeout 20
</IfModule>