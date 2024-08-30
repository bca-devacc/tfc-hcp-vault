# Create a Vault cluster at HCP
resource "hcp_hvn" "vault_hvn" {
  hvn_id         = var.vault_hvn
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.cluster_cider
}

resource "hcp_vault_cluster" "vault_cluster" {
  cluster_id = var.vault_cluster_id
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  tier       = var.tier_type
  public_endpoint = true
}

resource "hcp_vault_cluster_admin_token" "vault_admin_token" {
  cluster_id = hcp_vault_cluster.vault_cluster.cluster_id
}

# Create an IAM user to connect with AWS and Vault
resource "aws_iam_user" "vault_admin" {
  name = var.iam_user_name
  path = "/"
  tags = {
    Name = var.iam_user_name
  }
}

resource "aws_iam_access_key" "vault_admin_accesskey" {
  user = aws_iam_user.vault_admin.name
  lifecycle {
    ignore_changes = [
    user
    ]
  }
}

data "aws_iam_policy_document" "inline_po_vault" {
  statement {
    effect    = "Allow"
    actions   = [
        "iam:AttachUserPolicy",
        "iam:CreateUser",
        "iam:CreateAccessKey",
        "iam:DeleteUser",
        "iam:DeleteAccessKey",
        "iam:DeleteUserPolicy",
        "iam:DetachUserPolicy",
        "iam:GetUser",
        "iam:ListAccessKeys",
        "iam:ListAttachedUserPolicies",
        "iam:ListGroupsForUser",
        "iam:ListUserPolicies",
        "iam:PutUserPolicy",
        "iam:AddUserToGroup",
        "iam:RemoveUserFromGroup"
        ]
    resources = [
		"arn:aws:iam::339713018668:user/vault-*"
        ]
  }
}

resource "aws_iam_user_policy" "attach_policy" {
  name   = var.inline_policy_name
  user   = aws_iam_user.vault_admin.name
  policy = data.aws_iam_policy_document.inline_po_vault.json
}