variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "westeurope"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "devopsadmin"
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key"
  type        = string
}
