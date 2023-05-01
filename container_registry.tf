resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_resource_group_name
  location            = var.location
  sku                 = var.container_registry_sku
  admin_enabled       = var.container_registry_activate_admin_user
}
