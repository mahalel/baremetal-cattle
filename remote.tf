terraform {
  backend "azurerm" {
    storage_account_name = "kratoshomelab"
    container_name       = "tfstate"
    key                  = "kratos.tfstate"
  }
}
