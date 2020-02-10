output "id" {
  description = "Id of the created storage account"
  value       = azurerm_storage_account.storage_account.id
}


output "name" {
  description = "Storage Account s name"
  value       = azurerm_storage_account.storage_account.name
}
