# Terraform + EMR + Kafka + Zookeeper

This project aims to stand up an EMR, Kafka and Zookeeper Cluster in AWS (work in progress).

## Getting Started
1. Install Terraform on Mac: `brew install terraform`
2. Set parameters in `terraform.tfvars`
3. Start cluster:
```
terraform init
terraform apply
```
 4 . Destroy cluster:
```
terraform destroy
```

### Notes
* Configure AWS on your local machine: `aws configure`

## Inspiration
* Dat Tran, github:  [datitran](https://github.com/datitran)
* Davis Liu, github: [davisliu11](https://github.com/davisliu11)

