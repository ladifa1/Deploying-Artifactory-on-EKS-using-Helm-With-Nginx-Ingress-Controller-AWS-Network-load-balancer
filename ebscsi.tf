# resource "aws_iam_openid_connect_provider" "openid_connect" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = [data.tls_certificate.cert.certificates.0.sha1_fingerprint]
#   url             = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
# }

# # provider "kubernetes" {
# #   host                   = data.aws_eks_cluster.cluster.endpoint
# #   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
# #   token                  = data.aws_eks_cluster_auth.cluster.token
# # }

# module "ebs_csi_driver_controller" {
#   source = "DrFaust92/ebs-csi-driver/kubernetes"
#   version = "<VERSION>"

#   ebs_csi_controller_image                   = ""
#   ebs_csi_controller_role_name               = "AmazonEKS_EBS_CSI_DriverRole"
#   ebs_csi_controller_role_policy_name_prefix = "Amazoneks-ebs-csi-driver-policy"
#   oidc_url                                   = aws_iam_openid_connect_provider.openid_connect.url
# }