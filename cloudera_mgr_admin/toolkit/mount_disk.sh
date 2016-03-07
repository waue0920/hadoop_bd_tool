#!/bin/bash

# mount disk 

 mkdir /data1
 mkdir /data2
 mkdir /data3

parted -s -a optimal /dev/sdb mklabel gpt -- mkpart primary ext4 0.00TB 2.00TB;
mkfs.ext4 -T largefile  /dev/sdb1;
mount /dev/sdb1 /data1;

parted -s -a optimal /dev/sdc mklabel gpt -- mkpart primary ext4 0.00TB 2.00TB;
mkfs.ext4 -T largefile /dev/sdc1;
mount /dev/sdc1 /data2;

parted -s -a optimal /dev/sdd mklabel gpt -- mkpart primary ext4 0.00TB 2.00TB;
mkfs.ext4 -T largefile /dev/sdd1; 
mount /dev/sdd1 /data3;

