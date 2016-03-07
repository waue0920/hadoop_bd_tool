#!/bin/bash
bin=`which $0`
bin=`dirname ${bin}`
bin=`cd "$bin"; pwd`
cd $bin;

## 1. deploy the compilered .so file to /usr/lib
cp ./*.so /usr/local/lib/

ln -sf /usr/local/lib/libthrift-0.9.0.so /usr/lib/libthrift.so
ln -sf /usr/local/lib/libthriftz-0.9.0.so /usr/lib/libthriftz.so
ln -sf /usr/local/lib/libthriftnb-0.9.0.so /usr/lib/libthriftnb.so


## 2. build the rhbase
R CMD INSTALL rhbase_1.2.1.tar.gz

