#!/bin/bash
# http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/cm_ig_uninstall_cm.html
# https://niksammy.wordpress.com/2014/04/21/uninstalling-cdh5-cluster/

ret=$(which apt-get);
ret=$?
if [ $ret -ne 0 ];then
        echo "[ERROR] this script is only support for debian system, please transform it by your self. "
	exit 1 ;
fi

netstat -anltp |grep 900

ps aux |grep cloudera


