module "azure_devops_project" {
  source = "../.././modules/azure_devops_project"

  project_name        = "IIOps"
  project_description = "Projeto base para provisionamento de infraestrutura DevOps, com melhores práticas de mercado"

  project_type = "Agile"

  project_visibility   = "public"
  version_control_type = "Git"

  features = {
    boards       = "enabled"
    repositories = "enabled"
    pipelines    = "disabled"
    testplans    = "disabled"
    artifacts    = "disabled"
  }

  project_tag = ["IaC", "Terraform"]

  custom_permission       = true
  custom_permission_group = "Readers"
  group_permissions = {
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
  azure_devops_organization_url = var.azure_devops_organization_url-args
  personal_access_token_azure_devops = var.personal_access_token_azure_devops-args
}