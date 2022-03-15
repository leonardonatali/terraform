locals {
  kubeconfig = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.cluster.certificate_authority[0].data}
  name: ${aws_eks_cluster.cluster.name}
contexts:
- context:
    cluster: ${aws_eks_cluster.cluster.name}
    namespace: webpage
    user: ${aws_eks_cluster.cluster.name}
  name: ${aws_eks_cluster.cluster.name}
current-context: ${aws_eks_cluster.cluster.name}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.cluster.name}
  user:
    exec:
        apiVersion: client.authentication.k8s.io/v1alpha1
        command: aws-iam-authenticator
        args:
          - token
          - -i
          - "${aws_eks_cluster.cluster.name}"
EOF
}

resource "local_file" "kubeconfig" {
  filename = "kubeconfig"
  content  = local.kubeconfig
}
