provider "matchbox" {
  endpoint    = "matchbox.maha.nz:8081"
  client_cert = file("~/.config/matchbox/client.crt")
  client_key  = file("~/.config/matchbox/client.key")
  ca          = file("~/.config/matchbox/ca.crt")
}

provider "ct" {}

terraform {
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = "0.10.0"
    }
    matchbox = {
      source = "poseidon/matchbox"
      version = "0.5.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}
