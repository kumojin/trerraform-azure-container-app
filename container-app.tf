resource "azurerm_log_analytics_workspace" "platform-log" {
  name                = "platform-log"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "my-app" {
  name                       = "my-app-env"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.platform-log.id
}

resource "azurerm_container_app" "my-app" {
  name                         = "my-app"
  container_app_environment_id = azurerm_container_app_environment.my-app.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = "myapp"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name = "MYSQL_USER"
        secret_name = "mysql-user"
      }

      env {
        name = "MYSQL_PASSWORD"
        secret_name = "mysql-password"
      }

      env {
        name = "MYSQL_HOST"
        value = azurerm_mysql_flexible_server.mysql-db.fqdn
      }
    }

    min_replicas = 0
    max_replicas = 2




  }

  secret {
    name = "mysql-user"
    value = var.mysql_admin_user
  }

  secret {
    name = "mysql-password"
    value = var.mysql_admin_password
  }
}
