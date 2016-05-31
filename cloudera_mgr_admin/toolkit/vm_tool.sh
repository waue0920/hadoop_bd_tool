#!/bin/sh
### BEGIN INIT INFO
# Provides:          disable-transparent-hugepages
# Required-Start:    $local_fs
# Required-Stop:
# X-Start-Before:    mongod mongodb-mms-automation-agent
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Disable Linux transparent huge pages
# Description:       Disable Linux transparent huge pages, to improve
#                    database performance.
### END INIT INFO
VAGRANT_PATH=/opt/vagrant_images/v1
VM_PATH=/root/VirtualBox\ VMs
BACKUP_DIR=/data1
NOW=$(date +%s)

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
cd $bin;

function f_stop_vm(){

cd $VAGRANT_PATH;vagrant halt;
ret=$?
if [ $ret -ne 0 ];then
        echo "resotre error !!! can't stop vagrant vm !"
        exit 1 ;
fi


}

function p_restore(){
det_dir=$1
data_path=/data1/${det_dir}
f_stop_vm
cd /root
mv "$VM_PATH" "back-$NOW-VirtualBoxVM"
read -p "Please input your first name: " firstname 
cp -rf $data_path/* /root/
ls "$VM_PATH"
}

function p_list(){
ls $BACKUP_DIR |grep "backup-vm-"
}

function p_backup(){
this_bk_path=$BACKUP_DIR/backup-vm-$NOW
mkdir -p $this_bk_path
f_stop_vm
cp -rf "$VM_PATH"  $this_bk_path/
}

case ${1} in
  "list")
        echo "vm's backup pool :"
        p_list
        ;;
  "restore")
	if [ "$2" == "" ];then
	        echo "${0} restore <vm>"
		p_list
		exit 1;
	fi 
	echo "starting restore $2 ... "
        p_restore $2
        ;;
  "backup")
        echo "backup to $BACKUP_DIR"
        p_backup
        ;;
  *)
        echo "Usage  ${0} {list|restore|backup}"
        echo "ex: ${0} restore <date> "
        ;;
esac
