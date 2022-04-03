module "kratos" {
  source = "git::https://github.com/poseidon/typhoon//bare-metal/flatcar-linux/kubernetes?ref=v1.23.5"

  # bare-metal
  cluster_name            = "kratos"
  matchbox_http_endpoint  = "http://matchbox.maha.nz:8080"
  os_channel              = "flatcar-stable"
  os_version              = "3033.2.4"

  # configuration
  k8s_domain_name    = "kube.maha.nz"
  # your PUBLIC key here
  ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDE9fwuzJoGToSn9R43CVuC8J+Xieyqf3Kuec59movPTb7mV4R8WTMkhV6F16F8fQP76wamCAS2l6GPxd8Qn1xLIyVPqB7ffrSEWL8UYloGNrMcTHIFXwZtqXZqeKjD2r6lqwOaJgnJoJiORK/ooYbSoklFZcEsY/tJmcb6f3aaS928CRLZBdeM+vXdx+j9x0rSTT+zaScnZ3yEFzDPTB2AIE5bBNS9Nazy9bM9up36JnxUVMXqtkyRoXknAYkracAVhjI1WNxlPZ1/pRAJb3YvmxoQnoz+0a1IJk7hzHgUJGxqb7elN5XkmL60uT4ZrNS4UvWPGMKSpFcxEwSOSnaN"
  # Cached install means it will use the files we downloaded earlier in the Matchbox assets folder
  cached_install = true
  # This defaults to /dev/sda not useful when you have an NVME drive
  install_disk = "/dev/nvme0n1"
  # Set your service CIDR, this is what you are creating a static route for on the router
  service_cidr = "10.3.0.0/16"
  # machines
  controllers = [{
    name   = "kube"
    # MAC address of the client you will boot via iPXE, this is your selector.
    mac    = "98:fa:9b:ef:2d:28"
    domain = "kube.maha.nz"
  }]
  workers = [
    # {
    #   name   = "node2",
    #   mac    = "52:54:00:b2:2f:86"
    #   domain = "node2.example.com"
    # },
    # {
    #   name   = "node3",
    #   mac    = "52:54:00:c3:61:77"
    #   domain = "node3.example.com"
    # }
  ]

  # set to http only if you cannot chainload to iPXE firmware with https support
  download_protocol = "http"
}