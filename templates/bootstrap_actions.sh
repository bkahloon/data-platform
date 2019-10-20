#!/usr/bin/env bash

# install conda
wget --quiet http://apache.mirror.gtcomm.net/kafka/2.3.0/kafka_2.12-2.3.0.tgz -O /etc/kafka.tgz && tar -xzf /etc/kafka.tgz && \
    mv /etc/kafka_2.12-2.3.0 /etc/kafka

echo -e '\nexport PATH=/etc/kafka/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc

# remove tar file
rm /etc/kafka.tgz


