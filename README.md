# Godlike

# Web Application Infrastructure

## Description

This repository contains automated tools for deploying the infrastructure of a web application on AWS. The following technologies are used:
- **Terraform**: to create EC2, RDS, and ELB resources.
- **Ansible**: to automate the installation of the web server, database, replication, and load balancing.
- **Bash scripts**: to configure SSL and database replication.

## Deployment Instructions

### Prerequisites

1. An AWS account.
2. Terraform and Ansible installed on your local machine.

### Steps

1. **AWS Setup**:
   - Run the command `terraform init` to initialize the setup.
   - Run `terraform apply` to create the necessary resources.

2. **Web Server and Database Setup**:
   - Run the Ansible playbook `ansible-playbook -i inventory playbooks/nginx_setup.yml` for the web server setup.
   - Run the Ansible playbook `ansible-playbook -i inventory playbooks/mysql_setup.yml` for the database setup.

3. **SSL Configuration**:
   - Run the script `bash scripts/setup_ssl.sh`.

4. **MySQL Replication Setup**:
   - Run the script `bash scripts/mysql_replication.sh`.

## Monitoring and Logging

Monitoring and logging setup using Prometheus and the ELK Stack is done through separate playbooks.
