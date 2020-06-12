###
# environment composition
###

module "network_transit_hub" {
  source             = "../../modules/network_transit_hub"
  environment        = var.environment
  region             = var.region
  address_space      = var.address_space
  address_prefix_vgw = var.address_prefix_vgw
  address_prefix_fw  = var.address_prefix_fw
  tags               = var.tags
}

module "container_registry" {
  source      = "../../modules/container_registry"
  environment = var.environment
  region      = var.region
  tags        = var.tags
}

module "key_vault" {
  source      = "../../modules/key_vault"
  environment = var.environment
  region      = var.region
  object_id   = var.object_id
  tags        = var.tags
}

module "boot_diag_storage" {
  source      = "../../modules/boot_diag_storage"
  environment = var.environment
  region      = var.region
  tags        = var.tags
}

module "windows_jumpbox" {
  source                         = "../../modules/windows_jumpbox"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_transit_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_transit_hub.virtual_network_name
  address_prefix_jumpbox         = var.address_prefix_jumpbox
  storage_account_uri            = module.boot_diag_storage.primary_blob_endpoint
  tags                           = var.tags
}

module "domain_controllers" {
  source                         = "../../modules/domain_controllers"
  environment                    = var.environment
  region                         = var.region
  virtual_network_resource_group = module.network_transit_hub.virtual_network_resource_group_name
  virtual_network_name           = module.network_transit_hub.virtual_network_name
  address_prefix_adds            = var.address_prefix_adds
  storage_account_uri            = module.boot_diag_storage.primary_blob_endpoint
  private_ip_address_adds        = var.private_ip_address_adds
  tags                           = var.tags
}