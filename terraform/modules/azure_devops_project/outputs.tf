output "project_id" {
  description = "ID do projeto no Azure DevOps"
  value       = azuredevops_project.project.id
}

output "project_name" {
  description = "Nome do projeto no Azure DevOps"
  value       = azuredevops_project.project.name
}
