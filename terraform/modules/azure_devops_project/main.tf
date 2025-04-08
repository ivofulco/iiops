resource "azuredevops_project" "project" {
  name               = var.project_name
  description        = var.project_description
  visibility         = var.project_visibility
  version_control    = var.version_control_type
  work_item_template = var.project_type
  features           = var.features
}

resource "azuredevops_project_tags" "tags" {
  project_id = azuredevops_project.project.id
  tags       = var.project_tag
}

data "azuredevops_group" "example_readers" {
  project_id = azuredevops_project.project.id
  name       = var.custom_permission_group
}

resource "azuredevops_project_permissions" "example_permission" {
  count       = var.custom_permission ? 1 : 0

  project_id  = azuredevops_project.project.id
  principal   = data.azuredevops_group.example_readers.id
  
  permissions = var.group_permissions
}