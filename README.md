# Infrastructure as Code for EMR + Kafka + Zookeeper

This project aims to stand up an EMR, Kafka and Zookeeper cluster in AWS for rapid prototyping of data science and big data related projects.

## Prerequisites
1. Install Terraform and Ansible
2. Configure Terraform and Ansible to be able to access your AWS account and resources
3. Valid ssh-key to ssh into your instances 

## How to create an EMR cluster
You can target creating an EMR cluster by using the following command from the directory where you have cloned the Terraform portion of this project.

```
terraform apply -target=module.emr
```
You can specify what applications you would like to install and the EMR version by setting those variables in the terraform.tfvars file in the root directory of the terraform project. I would also recommend using spot instances for a more cost efficient cluster. I recommend using on demand instances for master and core nodes and to allow for a higher computing capacity to use task nodes.
 
## Create a kafka cluster
You can create an entire core kafka cluster and some other kafka related systems like Kafka Connect, cluster for running KSql jobs, Confluent Schema Registery, Confluent Control Center to monitor you cluster and Confluent REST Proxy.

```
kafka_instance_count = {
 "rest" = 1
  "connect"        = 1
  "ksql"           = 1
  "schema"         = 1
  "control_center" = 1
"broker" = 5 
}
```
This is the map object in the terraform.tfvars file that will specify how a big of a cluster you'd like for each system. The "broker" key is for the core kafka instance

```
terraform apply -target=module.kafka.aws_instance.broker -target=module.zookeeper -target=module.kafka.aws_instance.connect
```
The above command will create a core kafka, zookeeper and connect cluster with how many ever brokers specified in the terraform.tfvars kafka instance count map object and the zk count variable.
Please note you will have to create a zookeeper cluster to run kafka

### Using Ansible to actually install and configure Kafka and Zookeeper

We used Terraform to provision the Kafka and Zookeeper infrastructure, to actually configure it on these machines we will use Ansible. All you'll have to do is grab the public ip or dns records for the kafka and zookeeper instances and replace them in the hosts.yml file. 
Please note if the below mentioned commands give you a connection timeout exception or ansible can't connect to the instances, you can resolve it by manually first using ssh to connect to your instances and then trying the below mentioned commands again.

```
 ansible-playbook -i hosts.yml zookeeper.yml
```
This command will configure Zookeeper on the machines
```
 ansible-playbook -i hosts.yml core_kafka.yml
```
This command will configure core Kafka on the machines

You can extend these Ansible commands to set up the other services as required.

The ansible role currently requires either a Redhat or Debian Linux distribution so please choose an appropriate AMI. The default AMI in terraform is set to Redhat distribution. 


## Taking down the infrastructure

To take down the infrastructure all you have to do is just replace the "apply" option with destroy in the terraform command you used to stand up the infrastructure.

```
terraform destroy -target=module.kafka.aws_instance.broker -target=module.zookeeper -target=module.kafka.aws_instance.connect
```

## Notes

You will be able to access the machines on the standard ssh port of 22. By default all inbound traffic is allowed considering you have access to a valid ssh-key pair. If you require more strict control you can play around with the security module to configure your needs.

## Inspiration
* Cloud Posse, github: [cloudposse](https://github.com/cloudposse)
* Dat Tran, github:  [datitran](https://github.com/datitran)
* Marcos Lomboglia, github: [mlomboglia](https://github.com/mlomboglia)
* Davis Liu, github: [davisliu11](https://github.com/davisliu11)

