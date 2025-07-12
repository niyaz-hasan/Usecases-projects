# ☁️ Use Case 2: High Availability 2-Tier Architecture WebApp (Terraform on AWS)

This project provisions a **highly available, two-tier web application** architecture on AWS using **Terraform modules**. It includes:

- VPC with public/private subnets
- EC2 instances for the web tier in public subnets
- RDS MySQL instance for the database tier in private subnets
- Application Load Balancer (ALB)
- Security groups for network isolation
- Remote backend support
- Modular Terraform setup

---


---

## 📁 Folder Structure

```bash
usecase2-HA-2tier-architecture-webapp/
├── backend.tf                   # Remote state backend config (S3 + DynamoDB)
├── main.tf                      # Main module composition
├── variables.tf                 # Input variables
├── outputs.tf                   # Outputs of the infrastructure
└── modules/
    ├── vpc/                     # VPC, public/private subnets, routing
    ├── alb/                     # Application Load Balancer
    ├── instance/                # EC2 instance launch
    ├── sg_group/                # Security groups for ALB, EC2, RDS
    └── rds/                     # RDS MySQL instance


