provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
}
resource "azurerm_automation_account" "example" {
  name                = "account1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku_name = "Basic"
}

resource "azurerm_automation_dsc_configuration" "example" {
  name                    = "example"
  resource_group_name     = azurerm_resource_group.example.name
  automation_account_name = azurerm_automation_account.example.name
  location                = azurerm_resource_group.example.location
  content_embedded        = "configuration test {}"
}

resource "azurerm_automation_dsc_nodeconfiguration" "zeroNodes" {
  name                    = "zeroNodes"
  resource_group_name     = azurerm_resource_group.example.name
  automation_account_name = azurerm_automation_account.example.name
  content_embedded        = "configuration test {}"
}
resource "azurerm_automation_dsc_nodeconfiguration" "fiveNodes" {
  name                    = "fiveNodes"
  resource_group_name     = azurerm_resource_group.example.name
  automation_account_name = azurerm_automation_account.example.name
  content_embedded        = "configuration test {}"
}
resource "azurerm_automation_dsc_nodeconfiguration" "withoutUsage" {
  name                    = "withoutUsage"
  resource_group_name     = azurerm_resource_group.example.name
  automation_account_name = azurerm_automation_account.example.name
  content_embedded        = "configuration test {}"
}