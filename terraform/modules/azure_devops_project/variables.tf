
variable "project_name" {
  description = "Nome do projeto no Azure DevOps"
  type        = string
}

variable "project_description" {
  description = "Descrição do projeto"
  type        = string
  default     = "Managed by Terraform"
}

variable "project_type" {
  description = "Tipo de projeto (Agile, Scrum, etc.)"
  type        = string
  default     = "Agile" # Valor padrão, mas pode ser alterado ao usar o módulo
}

variable "project_visibility" {
  description = "Visibilidade do projeto (Private ou Public)"
  type        = string
  default     = "Private"
}

variable "version_control_type" {
  description = "ID do template de versionamento."
  type        = string
  default     = "Git"
}

variable "features" {
  description = "Um mapa de recursos a serem habilitados ou desabilitados no projeto"
  type        = map(string)
  default = {
    boards       = "disabled"
    repositories = "disabled"
    pipelines    = "disabled"
    testplans    = "disabled"
    artifacts    = "disabled"
  }
}

variable "project_tag" {
  description = "Tags pertinentes ao projeto"
  type        = list(string)
  default       = ["tag1", "tag2"]
}

variable "custom_permission" {
  description = "Habilitar personalização ?"
  type        = bool
  default     = false
}

variable "custom_permission_group" {
  description = "Personalizar permissão de grupo"
  type        = string
  default     = "Readers"
}

variable "group_permissions" {
  description = "Um mapa de recursos a serem habilitados ou desabilitados no projeto"
  type        = map(string)
  default = {
    GENERIC_READ                 = "Allow"
    GENERIC_WRITE                = "Allow"
    DELETE                       = "Deny"
    PUBLISH_TEST_RESULTS         = "Deny"
    #ADMINISTER_BUILD             = "Deny"
    START_BUILD                  = "Allow"
    EDIT_BUILD_STATUS            = "Deny"
    UPDATE_BUILD                 = "Deny"
    DELETE_TEST_RESULTS          = "Deny"
    VIEW_TEST_RESULTS            = "Allow"
    #MANAGE_TEST_ENVIRONMENTS     = "Deny"
    #MANAGE_TEST_CONFIGURATIONS   = "Deny"
    WORK_ITEM_DELETE             = "Allow"
    WORK_ITEM_MOVE               = "Allow"
    WORK_ITEM_PERMANENTLY_DELETE = "Deny"
    #RENAME                       = "Deny"
    #MANAGE_PROPERTIES            = "Deny"
    #MANAGE_SYSTEM_PROPERTIES     = "Deny"
    #BYPASS_PROPERTY_CACHE        = "Deny"
    #BYPASS_RULES                 = "Deny"
    SUPPRESS_NOTIFICATIONS       = "Deny"
    #UPDATE_VISIBILITY            = "Deny"
    #CHANGE_PROCESS               = "Deny"
    #AGILETOOLS_BACKLOG           = "Allow"
    #AGILETOOLS_PLANS             = "Allow"
  }
}

variable "azure_devops_organization_url" {
  description = "URL da organização do Azure DevOps"
  type = string
}

variable "personal_access_token_azure_devops" {
  type = string
  description = "PAT do Azure DevOps com permissão para gerenciar o ambiente"  
  default = "Valor contido no arquivo terraform.tfvars"
}