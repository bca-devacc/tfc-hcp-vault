output "hvn_id" {
  description = "HCP HVN ID"
  value = hcp_hvn.vault_hvn
}

output "vault_id" {
  description = "HCP Vault Cluster ID"
  value = hcp_vault_cluster.vault_cluster.id
}

output "vault_namespace" {
  description = "HCP Vault Cluster Namespace"
  value = hcp_vault_cluster.vault_cluster.namespace
}

output "vault_public_endpoint_url" {
  description = "HCP Vault Cluster vault_public_endpoint_url"
  value = hcp_vault_cluster.vault_cluster.vault_public_endpoint_url
}

output "vault_version" {
  description = "HCP Vault Cluster vault_version"
  value = hcp_vault_cluster.vault_cluster.vault_version
}

output "vault_admin_token_id" {
  description = "HCP Vault Admin Token ID"
  value = hcp_vault_cluster_admin_token.vault_admin_token.id
}

output "vault_admin_token" {
  description = "HCP Vault Admin Token"
  value = hcp_vault_cluster_admin_token.vault_admin_token.token
  sensitive = true
}

output "vault_admin_id" {
  description = "Vault Admin IAM User ID"
  value = aws_iam_user.vault_admin.id
}

output "vault_admin_arn" {
  description = "Vault Admin IAM User ARN"
  value = aws_iam_user.vault_admin.arn
}

output "vault_admin_name" {
  description = "Vault Admin IAM User Name"
  value = aws_iam_user.vault_admin.name
}

output "vault_admin_accesskey" {
  description = "Vault Admin IAM User Access Key"
  value = aws_iam_access_key.vault_admin_accesskey.id
}

output "vault_admin_secret_accesskey" {
  description = "Vault Admin IAM User Secret Access Key"
  value = aws_iam_access_key.vault_admin_accesskey.secret
  sensitive = true
}

output "vault_admin_encrypt_secret_accesskey" {
  description = "Vault Admin IAM User Encrypted Secret Access Key"
  value = aws_iam_access_key.vault_admin_accesskey.encrypted_secret
}