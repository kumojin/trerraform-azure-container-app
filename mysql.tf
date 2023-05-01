resource "azurerm_mysql_flexible_server" "mysql-db" {
  name                   = "mysql-db"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.mysql_admin_user
  administrator_password = var.mysql_admin_password
  sku_name               = var.mysql_sku
}

resource "azurerm_mysql_flexible_database" "mysql-db" {
  name                = "myapp"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql-db.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "mysql-db" {
  name                = "office"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql-db.name
  start_ip_address    = azurerm_container_app_environment.my-app.static_ip_address
  end_ip_address      = azurerm_container_app_environment.my-app.static_ip_address
}