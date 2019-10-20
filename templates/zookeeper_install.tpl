#!/bin/bash
set -e

function install_zookeeper() {
   mkdir -p /data/zookeeper
   wget http://apache.mirror.colo-serv.net/zookeeper/stable/apache-zookeeper-3.5.6-bin.tar.gz -O /etc/apache-zookeeper-3.5.6-bin.tar.gz  && tar -xzf /etc/apache-zookeeper-3.5.6-bin.tar.gz && mv /etc/apache-zookeeper-3.5.6-bin /etc/zk
   touch /etc/zk/conf/zoo.cfg
   echo -e '
            tickTime=2000
            dataDir=/data/zookeeper
            clientPort=2181
            maxClientCnxns=60
            initLimit=10
            syncLimit=5
            server.1=your_zookeeper_node_1:2888:3888 ## These will need to be DNS NAMES probably via a VPC and route 53
            server.2=your_zookeeper_node_2:2888:3888
            server.3=your_zookeeper_node_3:2888:3888
   ' > /etc/zk/conf/zoo.cfg
   echo -e '\nexport PATH=/etc/zk/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc
}

echo "Application type is ${app_type}."


if [ "${app_type}" == "zookeeper" ]; then
    install_zookeeper
    cmd="(/etc/zk/bin/zkServer.sh start 2>&1 > /var/log/zookeeper.log & ) ; sleep 10;"
    action=reboot # restart zookeeper on failure

    # put cmd to /etc/rc.local so it can start when system reboot
    echo "$cmd" >> /etc/rc.local
else
    echo "Invalid application type: ${app_type}"
    exit 1
fi

# execute command
eval "$cmd"