# SonarQube Deployment with Terraform + Ansible

This project automates the setup of SonarQube on AWS EC2:  
- **Terraform** creates the VPC, subnets, EC2 instance, and Security Groups.  
- **Ansible** installs Java, PostgreSQL, and SonarQube, and configures the service.  

---

## 🔧 Terraform Configuration

`terraform.tfvars` file (you can adjust values as needed):  
```hcl
region          = "us-east-1"
vpc_cidr        = "10.0.0.0/16"
subnet1_cidr    = "10.0.1.0/24"
subnet2_cidr    = "10.0.2.0/24"
subnet3_cidr    = "10.0.3.0/24"
ip_on_launch    = true
instance_type   = "t3.medium"


SSH connection is needed, generate key
AWS Admin or IAM role is needed

Clone the repository:  
`git clone https://github.com/<your-account>/sonarqube.git && cd sonarqube`

Make the script executable:  
`chmod +x script.sh`

Run the deployment script:  
`./script.sh`

The script will install Terraform and Ansible on your machine (if missing), provision AWS infrastructure using Terraform, generate the `ansible/hosts` inventory file with the EC2 public IP, and run the Ansible playbook to configure SonarQube.

Access SonarQube:  
Once the script finishes, open `http://<EC2-PUBLIC-IP>:9000`.
(by default login and password is admin, admin)

Tear down resources (optional):  
`cd terraform && terraform destroy -auto-approve`
