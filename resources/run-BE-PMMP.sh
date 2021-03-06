#!/bin/sh

echo "Starting PMMP..." >&1

chown root:root /resources
chmod 711 -R /resources
chmod 711 -R /resources
chown root:root /resources

sleep 1
PHARFILE="/data/pmmp.phar"
	
if [ -e ${PHARFILE} ]; then
	echo "Phar founded!" >&1
	RESULT=$(/resources/php7/bin/php /resources/pharvalid.php PHARFILE)
	echo ${RESULT}
	if  [ "`echo ${RESULT} | grep hash`" ]; then
		echo "Phar is valid!" >&1
	else
		echo "Phar must be broken." >&2
		exit 1
	fi
else
	echo "Phar not found." >&2
	PHARFILE=/resources/pmmp.phar
	ls /data/
fi

rm -rf /data/resource_packs
chmod 711 -R /resources/


/resources/php7/bin/php -n -d memory_limit=3G -d allow_url_fopen=0 -d allow_url_include=0 -d date.timezone="Asia/Tokyo" -d phar.readonly=0 -d phar.require_hash=1 -d display_errors=1  -d display_startup_errors=1 -d default_charset=utf-8 -d zend.assertions=-1  -d display_startup_error=1 -d default_charset=utf-8 -d assert.exception=1 -d error_reporting=0 -d "open_basedir=/tmp:phar://:/data" -d "disable_functions=_getppid,allow_url_fopen,allow_url_include,apache_child_terminate,apache_setenv,chgrp,chmod,chown,curl_exec,curl_multi_exec,define_syslog_variables,diskfreespace,dl,escapeshellarg,escapeshellcmd,eval,fp,fpaththru,fput,fsockopen,ftp_connect,ftp_exec,ftp_get,ftp_login,ftp_nb_fput,ftp_put,ftp_raw,ftp_rawlist,highlight_file,ignore_user_abord,inject_code,lchgrp,lchown,leak,link,listen,mail,mb_send_mail,mysql_pconnect,openlog,passthru,pcntl_exec,phpAds_XmlRpc,phpAds_remoteInfo,phpAds_xmlrpcDecode,phpAds_xmlrpcEncode,phpinfo,popen,posix,posix_ctermid,posix_getcwd,posix_getegid,posix_geteuid,posix_getgid,posix_getgrgid,posix_getgrnam,posix_getgroups,posix_getlogin,posix_getpgid,posix_getpgrp,posix_getpid,posix_getpwnam,posix_getpwuid,posix_getrlimit,posix_getsid,posix_getuid,posix_isatty,posix_kill,posix_mkfifo,posix_setegid,posix_seteuid,posix_setgid,posix_setpgid,posix_setsid,posix_setuid,posix_times,posix_ttyname,posix_uname,proc_close,proc_get_status,proc_nice,proc_open,proc_terminate,putenv,show_source,source,syslog,system,tmpfile,virtual,xmlrpc_entity_decode,mysqli,mysqli_stmt,mysqli_result,mysqli_driver" ${PHARFILE} 

rm -rf /data/resource_packs
chmod 711 -R /resources/
chown root:root /resources/

