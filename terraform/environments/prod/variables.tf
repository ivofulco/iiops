variable "azure_devops_organization_url-args" {
  description = "URL da organização do Azure DevOps"
  type = string
  default = "Valor contido no arquivo terraform.tfvars"
}

variable "personal_access_token_azure_devops-args" {
  type = string
  description = "PAT do Azure DevOps com permissão para gerenciar o ambiente"  
  default = "Valor contido no arquivo terraform.tfvars"
}