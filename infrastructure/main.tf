provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "example" {
    name     = "theweatherapp-rg"
    location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
    name                = "theweatherapp-sp"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    kind = "Linux"

    sku {
        tier = "Standard"
        size = "S1"
    }

    reserved = true # Required for Linux plan
}

resource "azurerm_app_service" "example" {
    name                = "theweatherapp-app"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        linux_fx_version = "PYTHON|3.12" # Set Python version to 3.12
    }

    app_settings = {
        "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
}