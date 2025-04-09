# Terraform AWS EKS Cluster Setup

This project sets up a fully functional **Amazon Elastic Kubernetes Service (EKS)** cluster on AWS using **Terraform**. It includes all necessary infrastructure to create a secure, scalable, and cost-efficient Kubernetes environment in the cloud.

---

## 📌 Project Scope

The goal of this project is to:
- Provision an **EKS cluster** using the official Terraform AWS modules
- Build a robust **VPC infrastructure** with public, private, and intra subnets
- Configure **Managed Node Groups** with both SPOT and ON_DEMAND instance types
- Attach proper **IAM roles and policies** for Kubernetes nodes
- Enable essential **EKS add-ons** (like VPC CNI, CoreDNS, and kube-proxy)
- Expose necessary ports with a **custom security group**

This setup provides a production-ready base for running containerized workloads on Kubernetes in AWS.

---

## 🗂️ Project Structure

```bash
terraform-eks-cluster/
├── main.tf                 # Terraform provider configuration
├── variables.tf            # All input variables (region, CIDRs, versions, etc.)
├── vpc.tf                  # VPC, subnets, NAT gateway, etc.
├── eks.tf                  # EKS cluster, node group, add-ons
├── iam.tf                  # IAM role for EKS node group
├── security_group.tf       # Custom security group for port access
├── outputs.tf              # Output values like cluster endpoint, subnet IDs
├── .gitignore              # Excludes Terraform state and local config files
└── README.md               # Project documentation
```

---

## 🛠️ Prerequisites

Ensure the following tools are installed on your system:

- [Terraform](https://www.terraform.io/downloads.html) (v1.3.0 or higher)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [eksctl](https://eksctl.io/introduction/installation/)
- A GitHub account and AWS account with appropriate IAM permissions

---

## 🚀 How to Deploy

### 1. Clone the Repo
```bash
git clone https://github.com/KhuramMurad/eks-terraform.git
cd eks-terraform
```

### 2. Configure AWS CLI
```bash
aws configure
# Enter your AWS Access Key ID, Secret, region (e.g., eu-north-1)
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Plan the Infrastructure
```bash
terraform plan
```

### 5. Apply the Configuration
```bash
terraform apply -auto-approve
```

### 6. Connect to EKS Cluster
```bash
aws eks update-kubeconfig --region eu-north-1 --name tes-dev-eks-cluster
kubectl get nodes
```

### 7. Destroy Resources (Optional)
```bash
terraform destroy -auto-approve
```

---

## 🔐 Variables Overview

| Name                | Description                           | Default Value                       |
|---------------------|----------------------------------------|-------------------------------------|
| `region`            | AWS region                             | `eu-north-1`                         |
| `name`              | EKS cluster name                       | `tes-dev-eks-cluster`               |
| `vpc_cidr`          | VPC CIDR block                         | `10.0.0.0/16`                        |
| `azs`               | Availability zones                     | `["eu-north-1a", "eu-north-1b"]`     |
| `private_subnets`   | Private subnet CIDRs                   | `["10.0.1.0/24", "10.0.2.0/24"]`     |
| `public_subnets`    | Public subnet CIDRs                    | `["10.0.101.0/24", "10.0.102.0/24"]` |
| `intra_subnets`     | Intra subnet CIDRs                     | `["10.0.5.0/24", "10.0.6.0/24"]`     |
| `eks_cluster_version`| Kubernetes version                    | `1.31`                               |
| `env`               | Environment label                      | `dev`                                |

---

## 📤 Outputs

After deployment, Terraform will print values such as:
- EKS Cluster Name & Endpoint
- Kubernetes Version
- VPC ID and Subnet IDs
- Node Group ARN
- AWS Region

---

## 💸 Cost Estimation (Approximate, Monthly)

| Resource                         | Count/Type           | Monthly Cost (USD) |
|----------------------------------|-----------------------|---------------------|
| EKS Control Plane                | 1 cluster             | $73                 |
| EC2 Instances (t2.micro)         | 2 ON_DEMAND + SPOT    | ~$10–$20            |
| NAT Gateway                     | 1 per AZ              | ~$30–$60            |
| Data Transfer, EBS Volumes, etc.| Varies                | ~$5–$10             |
| **Estimated Total**             |                       | **$120–$160**       |

> 💡 Use [AWS Pricing Calculator](https://calculator.aws.amazon.com/) for custom estimates.

---

## 🔒 Security & Best Practices
- IAM roles scoped to the least privileges
- Public cluster endpoint (optional: can restrict with CIDRs)
- SPOT + ON_DEMAND node groups for cost efficiency
- Subnet segregation: public for ALBs, private for workloads

---

## 🧩 Next Steps
- Deploy apps using `kubectl apply -f app.yaml`
- Set up Helm and deploy charts
- Integrate CI/CD (GitHub Actions, Jenkins, ArgoCD)
- Add monitoring: CloudWatch, Prometheus, Grafana

---

## 📄 License
This project is open-source and free to use under the [MIT License](LICENSE).

---

## 👤 Author
**Khuram Murad**  
GitHub: [@KhuramMurad](https://github.com/KhuramMurad)

