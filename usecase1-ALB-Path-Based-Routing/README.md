# 🛠️ ALB Path-Based Routing with EC2 Instances (Terraform)

This Terraform project deploys a **highly available, path-based routing architecture** on AWS. It provisions:

- A custom VPC
- Public subnets
- Security groups
- Application Load Balancer (ALB)
- Target groups for path-based routing (`/`, `/image`, `/register`)
- Three EC2 instances serving different content based on the request path

---

## 🧱 Architecture Overview

```text
User
 │
 └──> ALB (Path-based rules)
       ├── `/`        ──> EC2 Instance A (Home)
       ├── `/image`   ──> EC2 Instance B (Image)
       └── `/register`──> EC2 Instance C (Register)

 Project Structure

 .
├── main.tf                 # Main Terraform manifest (shown above)
├── variables.tf            # Input variables for customization
├── outputs.tf              # Output values for inspection
└── modules/
    ├── vpc/                # VPC and subnet resources
    ├── alb/                # Application Load Balancer and listeners
    ├── sg_group/           # Security group for ALB and EC2
    ├── target_group/       # ALB target group with path rule
    └── instance/           # EC2 instance setup and registration

