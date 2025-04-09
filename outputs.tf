output "vpc_id" { value = module.vpc.vpc_id }
output "private_subnets" { value = module.vpc.private_subnets }
output "public_subnets" { value = module.vpc.public_subnets }
output "eks_cluster_name" { value = module.eks.cluster_name }
output "eks_cluster_endpoint" { value = module.eks.cluster_endpoint }
output "eks_cluster_version" { value = module.eks.cluster_version }
output "eks_node_group_arn" { value = module.eks.eks_managed_node_groups["tws-cluster-ng"].node_group_arn }
output "region" { value = var.region }
