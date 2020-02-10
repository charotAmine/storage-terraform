variable "name" {
  description = "Name of the storage account respecting a naming convention"
}

variable "kind" {
  description = "The kind of the account (Storage, StorageV2, or BlobStorage)"
}

variable "tier" {
  description = "The tier of the storage Standard or Premium"
  default     = "Standard"
}

variable "replication_type" {
  description = "The type of the replication (LRS, GRS, RAGRS, ZRS)"
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
  description = "A list of the containers to create"
  default     = []
}


variable "network_rule_default_action" {
  description = "Network default action (Allow,Deny)"
  default     = "Allow"
}

variable "network_rule_bypass" {
  description = "you may choose Logging, Metrics, AzureServices, or None."
  default     = []
}

variable "network_rule_ip_addresses" {
  description = "Ip Addresses whitlist"
  default     = []
}

variable "network_rule_subnets" {
  description = "Subnets to allow"
  default     = []
}

variable "resource_group_name" {
  description = "Resource group to deploy the storage account"
}

variable "location" {
  description = "The location where to deploy"
}

variable "tags" {
  description = "The tags to add"
  type        = map(string)
}
