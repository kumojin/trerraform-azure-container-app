variable "location" {
  description = "Location for all resources in Azure"
  default = "Canada Central"
}

variable "resource_group_name" {
  description = "Ressource group name"
}

# variable "container_registry_name" {}

# variable "container_registry_resource_group_name" {}

variable "container_registry_sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium"
  default = "Basic"
}

variable "container_registry_activate_admin_user" {
  description = "Specifies whether the admin user is enabled"
  type = bool
  default = false
}

variable "mysql_admin_user" {
    default = "admindb"
}

variable "mysql_admin_password" {
    sensitive = true
}

variable "mysql_sku" {
    description = "The SKU name of the MySQL Flexible server."
    default = "B_Standard_B1s"
}

variable "tenant_id" {
  sensitive = true
}

variable "subscription_id" {
  sensitive = true
}

variable "client_id" {
  sensitive = true
}

variable "client_secret" {
  sensitive = true
}
