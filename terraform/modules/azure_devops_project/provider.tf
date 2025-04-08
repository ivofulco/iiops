terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.8.1"
    }
  }
}
provider "azuredevops" {
  # Autenticação via Azure DevOps - substitua com suas credenciais
  org_service_url       = var.azure_devops_organization_url
  personal_access_token = var.personal_access_token_azure_devops
}