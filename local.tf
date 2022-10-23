# render Admin & Developer users list with the structure required by EKS module
locals {
  admin_user_map_users = [
    for admin_users in var.admin_users :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${admin_users}"
      username = admin_users
      groups   = ["system:masters"]
    }
  ]
  developer_user_map_users = [
    for developer_users in var.developer_users :
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${developer_users}"
      username = developer_users
      groups   = ["${var.name_prefix}-developers"]
    }
  ]
}
  