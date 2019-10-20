#!/bin/bash
set -e

function install_kafka() {
    wget --quiet http://apache.mirror.gtcomm.net/kafka/2.3.0/kafka_2.12-2.3.0.tgz -O /etc/kafka.tgz && tar -xzf /etc/kafka.tgz

    mv /etc/kafka_2.12-2.3.0 /etc/kafka

    echo -e '\nexport PATH=/etc/kafka/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc
}

function update_kafka_dns() {
    # get EC2 meta data from http://169.254.169.254/latest/meta-data (internal dns)
    # get availability zone: eg. ap-northeast-1a
    az=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)

    # get number from az tail value. ap-northeast-1a => a => 1
    broker_id=$(echo -n $az | tail -c 1 | tr abcdef 123456)

    sed -i "s#broker.id=0#broker.id=$broker_id#g" /etc/kafka/config/server.properties
}

function update_configurations() {
    # update zookeeper IP address
    sed -i "s#localhost:2181#${zookeeper_ips}#g" /etc/kafka/config/server.properties
}

echo "Application type is ${app_type}."


if [ "${app_type}" == "kafka" ]; then
    install_kafka
    update_kafka_dns
    update_configurations
    cmd="(kafka-server-start /etc/kafka/server.properties 2>&1 > /var/log/kafka.log  & ) ; sleep 5;"
    action=poweroff # let ASG spins a new one
else
    echo "Invalid application type: ${app_type}"
    exit 1
fi

# execute command
eval "$cmd"