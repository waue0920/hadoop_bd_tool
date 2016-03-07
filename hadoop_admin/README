####################################
## hadoop_admin tool usage README ##
####################################
## 20150519 @@ wychen ##
## 

* install : 

0. ssh without password => required !
1. edit the hosts => hascp , hacmd will be working
2. edit the service_hosts => service will be working 
3. deploy ./tool/check_service on each nodes /opt/ => pjps will be working

* usage : 

ex 1) show service topology ( read ./hosts & ref ./service_hosts )
./pjps

ex 2) start all hregionserver by full service name ( read ./service_hosts)
./service hregionserver start

ex 3) stop all nodemanager by "short name" ( which defined on service_hosts or show on pjps )
./service NM stop

ex 4) sync the config ( push ./sync/*-conf to each node of ./hosts )
./deploy_config

ex 5) delploy check_serice  ( read ./hosts )
./hascp ./tool/check_service /opt/check_service 

ex 6) execute /opt/check_service ( read ./hosts )
./hacmd /opt/check_service

ex 7) restart bigdata cluster ( base on ./service )
./all_service stop
./all_service start

ex 8) start the all service on d ( read ./service_hosts)
./service_host hd28 start

* note :  

n1) host , service_hosts is support "#" for comment
