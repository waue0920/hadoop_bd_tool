#!/bin/bash
bin=`which $0`
bin=`dirname ${bin}`
bin=`cd "$bin"; pwd`
cd $bin;

## 1. setup the debian R 3 version to apt sources.list and import key 
cp cran.list /etc/apt/sources.list.d/
apt-key adv --keyserver keyserver.ubuntu.net --recv-key 381BA480
apt-get update

## 2. prepare r basic
apt-get install -y git make r-base-core r-base-dev

## 2.1 prepare rhbase compiler tool  (optional)
#apt-get install -y automake libtool flex bison python-dev ruby-dev 

## 2.2 setup java & javac installed by cloudera-cms to system (optional)
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-oracle-cloudera/bin/java" 2;
update-alternatives --set java /usr/lib/jvm/java-7-oracle-cloudera/bin/java;

update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-oracle-cloudera/bin/javac" 2;
update-alternatives --set javac /usr/lib/jvm/java-7-oracle-cloudera/bin/javac;

update-alternatives --install "/usr/bin/jps" "jps" "/usr/lib/jvm/java-7-oracle-cloudera/bin/jps" 2;
update-alternatives --set jps /usr/lib/jvm/java-7-oracle-cloudera/bin/jps;

## 3. import the parameter to rhadoop by /etc/profile 
cp ./profile /etc/profile
source /etc/profile

## 4. setup java env in R
R CMD javareconf

## 5. install R module by R CMD command
# 5.1 dependency modules of rhdfs & rmr2
R CMD INSTALL rJava_0.9-6.tar.gz
R CMD INSTALL Rcpp_0.11.5.tar.gz
R CMD INSTALL bitops_1.0-6.tar.gz
R CMD INSTALL digest_0.6.8.tar.gz
R CMD INSTALL plyr_1.8.1.tar.gz
R CMD INSTALL stringr_0.6.2.tar.gz
R CMD INSTALL reshape2_1.4.1.tar.gz
R CMD INSTALL functional_0.6.tar.gz
R CMD INSTALL RJSONIO_1.3-0.tar.gz
R CMD INSTALL caTools_1.17.1.tar.gz 
# 5.2 rhdfs & rmr2 
R CMD INSTALL rhdfs_1.0.8.tar.gz
R CMD INSTALL rmr2_3.3.1.tar.gz

# 5.3 ravro and its depends
R CMD INSTALL bit_1.1-12.tar.gz
R CMD INSTALL bit64_0.9-4.tar.gz
R CMD INSTALL lazyeval_0.1.10.tar.gz
R CMD INSTALL memoise_0.2.1.tar.gz
R CMD INSTALL plyr_1.8.1.tar.gz
R CMD INSTALL rjson_0.2.15.tar.gz
R CMD INSTALL R.methodsS3_1.7.0.tar.gz
R CMD INSTALL ravro_1.0.4.tar.gz

# 5.4 plyrmr and its depends
R CMD INSTALL assertthat_0.1.tar.gz
R CMD INSTALL BH_1.55.0-3.tar.gz
R CMD INSTALL DBI_0.3.1.tar.gz
R CMD INSTALL magrittr_1.5.tar.gz
R CMD INSTALL R6_2.0.1.tar.gz
R CMD INSTALL dplyr_0.4.1.tar.gz
R CMD INSTALL Formula_1.2-1.tar.gz
R CMD INSTALL proto_0.3-10.tar.gz
R CMD INSTALL acepack_1.3-3.3.tar.gz
R CMD INSTALL RColorBrewer_1.1-2.tar.gz
R CMD INSTALL dichromat_2.0-0.tar.gz
R CMD INSTALL labeling_0.3.tar.gz
R CMD INSTALL colorspace_1.2-6.tar.gz
R CMD INSTALL munsell_0.4.2.tar.gz
R CMD INSTALL gtable_0.1.2.tar.gz
R CMD INSTALL scales_0.2.4.tar.gz
R CMD INSTALL ggplot2_1.0.1.tar.gz
R CMD INSTALL latticeExtra_0.6-26.tar.gz
R CMD INSTALL Hmisc_3.15-0.tar.gz
R CMD INSTALL plyrmr_0.6.0.tar.gz


## all done
