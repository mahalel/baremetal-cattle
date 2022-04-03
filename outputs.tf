resource "local_file" "kubeconfig-kratos" {
  content  = module.kratos.kubeconfig-admin
  filename = "/home/maha/.kube/configs/kratos-config"
}