variable "name_prefix" {
  description = "(Optional) A prefix for the name of all the resource groups and resources."
  type        = string
  default     = "cloudclub"
}

variable "log_analytics_workspace_name" {
  description = "Specifies the name of the log analytics workspace"
  default     = "Workspace"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Specifies the number of days of the retention policy"
  type        = number
  default     = 30
}

variable "solution_plan_map" {
  description = "Specifies solutions to deploy to log analytics workspace"
  default     = {
    ContainerInsights= {
      product   = "OMSGallery/ContainerInsights"
      publisher = "Microsoft"
    }
  }
  type = map(any)
}

variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  default     = "eastus"
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the resource group name"
  default     = "rg"
  type        = string
}

variable "vnet_name" {
  description = "Specifies the name of the AKS subnet"
  default     = "VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Specifies the address prefix of the AKS subnet"
  default     =  ["10.0.0.0/8"]
  type        = list(string)
}

variable "system_node_pool_subnet_name" {
  description = "Specifies the name of the subnet that hosts the system node pool"
  default     =  "system-nodepool-subnet"
  type        = string
}

variable "system_node_pool_subnet_address_prefix" {
  description = "Specifies the address prefix of the subnet that hosts the system node pool"
  default     =  ["10.240.0.0/16"]
  type        = list(string)
}

variable "user_node_pool_subnet_name" {
  description = "Specifies the name of the subnet that hosts the user node pool"
  default     =  "user-nodepool-subnet"
  type        = string
}

variable "user_node_pool_subnet_address_prefix" {
  description = "Specifies the address prefix of the subnet that hosts the user node pool"
  type        = list(string)
  default     = ["10.241.0.0/16"]
}

variable "pod_subnet_name" {
  description = "Specifies the name of the pod subnet"
  default     = "pod-subnet"
  type        = string
}

variable "pod_subnet_address_prefix" {
  description = "Specifies the address prefix of the pod subnet"
  default     = ["10.242.0.0/16"]
  type        = list(string)
}


variable "private_endpoint_subnet_name" {
  description = "Specifies the name of the firewall subnet"
  default     = "private-endpoint-subnet"
  type        = string
}

variable "private_endpoint_subnet_address_prefix" {
  description = "Specifies the address prefix of the firewall subnet"
  default     = ["10.243.2.0/24"]
  type        = list(string)
}

variable "aks_cluster_name" {
  description = "(Required) Specifies the name of the AKS cluster."
  default     = "Aks"
  type        = string
}

variable "private_cluster_enabled" {
  description = "(Optional) Specifies wether the AKS cluster be private or not."
  default     = false
  type        = bool
}
  
variable "role_based_access_control_enabled" {
  description = "(Required) Is Role Based Access Control Enabled? Changing this forces a new resource to be created."
  default     = true
  type        = bool
}

variable "automatic_channel_upgrade" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, and stable."
  default     = "stable"
  type        = string

  validation {
    condition = contains( ["patch", "rapid", "stable"], var.automatic_channel_upgrade)
    error_message = "The upgrade mode is invalid."
  }
}

variable "admin_group_object_ids" {
  description = "(Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster."
  default     = []
  type        = list(string)
}

variable "azure_rbac_enabled" {
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
  default     = true
  type        = bool
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA). Defaults to Free."
  default     = "Free"
  type        = string

  validation {
    condition = contains( ["Free", "Paid"], var.sku_tier)
    error_message = "The sku tier is invalid."
  }
}

variable "kubernetes_version" {
  description = "Specifies the AKS Kubernetes version"
  default     = "1.27.7"
  type        = string
}

variable "system_node_pool_vm_size" {
  description = "Specifies the vm size of the system node pool"
  default     = "Standard_E2s_v3"
  type        = string
}

variable "system_node_pool_availability_zones" {
  description = "Specifies the availability zones of the system node pool"
  default     = ["1"]
  type        = list(string)
}

variable "network_dns_service_ip" {
  description = "Specifies the DNS service IP"
  default     = "10.2.0.10"
  type        = string
}

variable "network_service_cidr" {
  description = "Specifies the service CIDR"
  default     = "10.2.0.0/24"
  type        = string
}

variable "network_plugin" {
  description = "Specifies the network plugin of the AKS cluster"
  default     = "azure"
  type        = string
}

variable "system_node_pool_name" {
  description = "Specifies the name of the system node pool"
  default     =  "system"
  type        = string
}

variable "system_node_pool_enable_auto_scaling" {
  description = "(Optional) Whether to enable auto-scaler. Defaults to false."
  type          = bool
  default       = true
}

variable "system_node_pool_enable_host_encryption" {
  description = "(Optional) Should the nodes in this Node Pool have host encryption enabled? Defaults to false."
  type          = bool
  default       = false
} 

variable "system_node_pool_enable_node_public_ip" {
  description = "(Optional) Should each node have a Public IP Address? Defaults to false. Changing this forces a new resource to be created."
  type          = bool
  default       = false
} 

variable "system_node_pool_max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type          = number
  default       = 50
}

variable "system_node_pool_node_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool. Changing this forces a new resource to be created."
  type          = map(any)
  default       = {}
} 

variable "system_node_pool_node_taints" {
  description = "(Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created."
  type          = list(string)
  default       = ["CriticalAddonsOnly=true:NoSchedule"]
} 

variable "system_node_pool_os_disk_type" {
  description = "(Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created."
  type          = string
  default       = "Managed"
} 

variable "system_node_pool_max_count" {
  description = "(Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count."
  type          = number
  default       = 10
}

variable "system_node_pool_min_count" {
  description = "(Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count."
  type          = number
  default       = 1
}

variable "system_node_pool_node_count" {
  description = "(Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min_count - max_count."
  type          = number
  default       = 1
}

variable "user_node_pool_name" {
  description = "(Required) Specifies the name of the node pool."
  type        = string
  default     = "user"
}

variable "user_node_pool_vm_size" {
  description = "(Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard_E2s_v3"
}

variable "user_node_pool_availability_zones" {
  description = "(Optional) A list of Availability Zones where the Nodes in this Node Pool should be created in. Changing this forces a new resource to be created."
  type        = list(string)
  default = ["1"]
}

variable "user_node_pool_enable_auto_scaling" {
  description = "(Optional) Whether to enable auto-scaler. Defaults to false."
  type          = bool
  default       = true
}

variable "user_node_pool_enable_host_encryption" {
  description = "(Optional) Should the nodes in this Node Pool have host encryption enabled? Defaults to false."
  type          = bool
  default       = false
} 

variable "user_node_pool_enable_node_public_ip" {
  description = "(Optional) Should each node have a Public IP Address? Defaults to false. Changing this forces a new resource to be created."
  type          = bool
  default       = false
} 

variable "user_node_pool_max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type          = number
  default       = 50
}

variable "user_node_pool_mode" {
  description = "(Optional) Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User."
  type          = string
  default       = "User"
} 

variable "user_node_pool_node_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool. Changing this forces a new resource to be created."
  type          = map(any)
  default       = {}
} 

variable "user_node_pool_node_taints" {
  description = "(Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created."
  type          = list(string)
  default       = []
} 

variable "user_node_pool_os_disk_type" {
  description = "(Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created."
  type          = string
  default       = "Managed"
} 

variable "user_node_pool_os_type" {
  description = "(Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are Linux and Windows. Defaults to Linux."
  type          = string
  default       = "Linux"
} 

variable "user_node_pool_priority" {
  description = "(Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type          = string
  default       = "Regular"
} 

variable "user_node_pool_max_count" {
  description = "(Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count."
  type          = number
  default       = 10
}

variable "user_node_pool_min_count" {
  description = "(Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count."
  type          = number
  default       = 1
}

variable "user_node_pool_node_count" {
  description = "(Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min_count - max_count."
  type          = number
  default       = 1
}

variable "vm_enabled" {
  description = "(Optional) Specifies whether create a virtual machine"
  type = bool
  default = false
}

variable "vm_name" {
  description = "Specifies the name of the jumpbox virtual machine"
  default     = "Vm"
  type        = string
}

variable "vm_public_ip" {
  description = "(Optional) Specifies whether create a public IP for the virtual machine"
  type = bool
  default = false
}

variable "vm_size" {
  description = "Specifies the size of the jumpbox virtual machine"
  default     = "Standard_DS1_v2"
  type        = string
}

variable "vm_os_disk_storage_account_type" {
  description = "Specifies the storage account type of the os disk of the jumpbox virtual machine"
  default     = "Premium_LRS"
  type        = string

  validation {
    condition = contains(["Premium_LRS", "Premium_ZRS", "StandardSSD_LRS", "StandardSSD_ZRS",  "Standard_LRS"], var.vm_os_disk_storage_account_type)
    error_message = "The storage account type of the OS disk is invalid."
  }
}

variable "vm_os_disk_image" {
  type        = map(string)
  description = "Specifies the os disk image of the virtual machine"
  default     = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2" 
    version   = "latest"
  }
}

variable "storage_account_kind" {
  description = "(Optional) Specifies the account kind of the storage account"
  default     = "StorageV2"
  type        = string

   validation {
    condition = contains(["Storage", "StorageV2"], var.storage_account_kind)
    error_message = "The account kind of the storage account is invalid."
  }
}

variable "storage_account_tier" {
  description = "(Optional) Specifies the account tier of the storage account"
  default     = "Standard"
  type        = string

   validation {
    condition = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "The account tier of the storage account is invalid."
  }
}

variable "acr_name" {
  description = "Specifies the name of the container registry"
  type        = string
  default     = "Acr"
}

variable "acr_sku" {
  description = "Specifies the name of the container registry"
  type        = string
  default     = "Premium"

  validation {
    condition = contains(["Basic", "Standard", "Premium"], var.acr_sku)
    error_message = "The container registry sku is invalid."
  }
}

variable "acr_admin_enabled" {
  description = "Specifies whether admin is enabled for the container registry"
  type        = bool
  default     = true
}

variable "acr_georeplication_locations" {
  description = "(Optional) A list of Azure locations where the container registry should be geo-replicated."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "(Optional) Specifies tags for all the resources"
  default     = {
    createdWith = "Terraform"
  }
}

variable "bastion_host_name" {
  description = "(Optional) Specifies the name of the bastion host"
  default     = "BastionHost"
  type        = string
}

variable "storage_account_replication_type" {
  description = "(Optional) Specifies the replication type of the storage account"
  default     = "LRS"
  type        = string

  validation {
    condition = contains(["LRS", "ZRS", "GRS", "GZRS", "RA-GRS", "RA-GZRS"], var.storage_account_replication_type)
    error_message = "The replication type of the storage account is invalid."
  }
}

variable "key_vault_name" {
  description = "Specifies the name of the key vault."
  type        = string
  default     = "KeyVault"
}

variable "key_vault_sku_name" {
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"

  validation {
    condition = contains(["standard", "premium" ], var.key_vault_sku_name)
    error_message = "The sku name of the key vault is invalid."
  }
}

variable"key_vault_enabled_for_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false."
  type        = bool
  default     = true
}

variable"key_vault_enabled_for_disk_encryption" {
  description = " (Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  type        = bool
  default     = true
}

variable"key_vault_enabled_for_template_deployment" {
  description = "(Optional) Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  type        = bool
  default     = true
}

variable"key_vault_enable_rbac_authorization" {
  description = "(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. Defaults to false."
  type        = bool
  default     = true
}

variable"key_vault_purge_protection_enabled" {
  description = "(Optional) Is Purge Protection enabled for this Key Vault? Defaults to false."
  type        = bool
  default     = false
}

variable "key_vault_soft_delete_retention_days" {
  description = "(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  type        = number
  default     = 30
}

variable "key_vault_bypass" { 
  description = "(Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  type        = string
  default     = "AzureServices" 

  validation {
    condition = contains(["AzureServices", "None" ], var.key_vault_bypass)
    error_message = "The valut of the bypass property of the key vault is invalid."
  }
}

variable "key_vault_default_action" { 
  description = "(Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  type        = string
  default     = "Allow" 

  validation {
    condition = contains(["Allow", "Deny" ], var.key_vault_default_action)
    error_message = "The value of the default action property of the key vault is invalid."
  }
}

variable "admin_username" {
  description = "(Required) Specifies the admin username of the jumpbox virtual machine and AKS worker nodes."
  type        = string
  default     = "azadmin"
}

# variable "ssh_public_key" {
#   description = "(Required) Specifies the SSH public key for the jumpbox virtual machine and AKS worker nodes."
#   type        = string
# }

variable "keda_enabled" {
  description = "(Optional) Specifies whether KEDA Autoscaler can be used for workloads."
  type        = bool
  default     = true
}

variable "vertical_pod_autoscaler_enabled" {
  description = "(Optional) Specifies whether Vertical Pod Autoscaler should be enabled."
  type        = bool
  default     = true
}

variable "workload_identity_enabled" {
  description = "(Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false."
  type        = bool
  default     = true
}

variable "oidc_issuer_enabled" {
  description = "(Optional) Enable or Disable the OIDC issuer URL."
  type        = bool
  default     = true
}

variable "open_service_mesh_enabled" {
  description = "(Optional) Is Open Service Mesh enabled? For more details, please visit Open Service Mesh for AKS."
  type        = bool
  default     = false
}

variable "image_cleaner_enabled" {
  description = "(Optional) Specifies whether Image Cleaner is enabled."
  type        = bool
  default     = true
}

variable "azure_policy_enabled" {
  description = "(Optional) Should the Azure Policy Add-On be enabled? For more details please visit Understand Azure Policy for Azure Kubernetes Service"
  type        = bool
  default     = false
}

variable "http_application_routing_enabled" {
  description = "(Optional) Should HTTP Application Routing be enabled?"
  type        = bool
  default     = false
}

variable "openai_name" {
  description = "(Required) Specifies the name of the Azure OpenAI Service"
  type = string
  default = "OpenAi"
}

variable "openai_sku_name" {
  description = "(Optional) Specifies the sku name for the Azure OpenAI Service"
  type = string
  default = "S0"
}

variable "openai_custom_subdomain_name" {
  description = "(Optional) Specifies the custom subdomain name of the Azure OpenAI Service"
  type = string
  default = ""
}

variable "openai_public_network_access_enabled" {
  description = "(Optional) Specifies whether public network access is allowed for the Azure OpenAI Service"
  type = bool
  default = true
}

variable "openai_deployments" {
  description = "(Optional) Specifies the deployments of the Azure OpenAI Service"
  type = list(object({
    name = string
    model = object({
      name = string
      version = string
    })
    rai_policy_name = string  
  }))
  default = [
    {
      name = "gpt-35-turbo-16k"
      model = {
        name = "gpt-35-turbo-16k"
        version = "0613"
      }
      rai_policy_name = ""
    }
  ] 
}

variable "nat_gateway_name" {
  description = "(Required) Specifies the name of the Azure OpenAI Service"
  type = string
  default = "NatGateway"
}

variable "nat_gateway_sku_name" {
  description = "(Optional) The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard"
  type = string
  default = "Standard"
}

variable "nat_gateway_idle_timeout_in_minutes" {
  description = "(Optional) The idle timeout which should be used in minutes. Defaults to 4."
  type = number
  default = 4
}

variable "nat_gateway_zones" {
  description = " (Optional) A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  type = list(string)
  default = ["1"]
}

variable "workload_managed_identity_name" {
  description = "(Required) Specifies the name of the workload user-defined managed identity."
  type = string
  default = "WorkloadManagedIdentity"
}

variable "subdomain" {
  description = "Specifies the subdomain of the Kubernetes ingress object."
  type = string
  default = "magic8ball"
}

variable "domain" {
  description = "Specifies the domain of the Kubernetes ingress object."
  type = string
  default = "contoso.com"
}

variable "namespace" {
  description = "Specifies the namespace of the workload application that accesses the Azure OpenAI Service."
  type = string
  default = "magic8ball"
}

variable "service_account_name" {
  description = "Specifies the name of the service account of the workload application that accesses the Azure OpenAI Service."
  type = string
  default = "magic8ball-sa"
}

variable "appgw_pip" {
  description = "value of the public ip address of the application gateway"
  type = string
  default = "appgw-pip"
}

variable "appgw_name" {
    description = "Specifies the name of the Application Gateway."
    type = string
    default = "appgw-ingress"
}

variable "appgw_sku" {
    description = "Specifies the SKU of the Application Gateway."
    type = string
    default = "Standard_v2"
}

variable "frontend_ip_configuration_name" {
    description = "Specifies the name of the frontend IP configuration."
    type = string
    default = "appgw-frontend-ip"
}

variable "backend_address_pool_name" {
    description = "Specifies the name of the backend address pool."
    type = string
    default = "appgw-backend-pool"
}

variable "http_settings_name" {
    description = "Specifies the name of the HTTP settings."
    type = string
    default = "appgw-http-settings"
}

variable "frontend_port_name" {
    description = "Specifies the name of the frontend port."
    type = string
    default = "appgw-frontend-port"
}

variable "http_listener_name" {
    description = "Specifies the name of the HTTP listener."
    type = string
    default = "appgw-http-listener"
}

variable "backend_http_settings_name" {
    description = "Specifies the name of the backend HTTP settings."
    type = string
    default = "appgw-backend-http-settings"
}

variable "request_routing_rule_name" {
    description = "Specifies the name of the request routing rule."
    type = string
    default = "appgw-request-routing-rule"
  
}

variable "appgw_subnet_name" {
    description = "Specifies the name of the subnet that hosts the Application Gateway."
    type = string
    default = "appgw-subnet"
}

variable "appgw_subnet_address_prefix" {
    description = "Specifies the address prefix of the subnet that hosts the Application Gateway."
    type = list(string)
    default = ["10.243.1.0/24"]
}

variable "appgw_frontend_port" {
    description = "Specifies the frontend port of the Application Gateway."
    type = number
    default = 80
}

variable "appgw_backend_port" {
    description = "Specifies the backend port of the Application Gateway."
    type = number
    default = 80
}


variable "appgw_backend_protocol" {
    description = "Specifies the backend protocol of the Application Gateway."
    type = string
    default = "Http"
}

variable "http_listener_protocol" {
    description = "Specifies the protocol of the HTTP listener."
    type = string
    default = "Http"
}

variable "request_routing_rule_priority" {
    description = "Specifies the priority of the request routing rule."
    type = number
    default = 9
}

variable "request_routing_rule_type" {
    description = "Specifies the type of the request routing rule."
    type = string
    default = "Basic"
}

variable "gateway_ip_configuration_name" {
    description = "Specifies the name of the gateway IP configuration."
    type = string
    default = "appgw-gateway-ip-config"
}

variable "ai_search_name" {
    description = "The name of the search service."
    type        = string
    default = "ai-search"
}

variable "sku" {
    description = "The pricing tier of the search service you want to create (for example, basic or standard)."
    default     = "standard"
    type        = string
    validation {
        condition     = contains(["free", "basic", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.sku)
        error_message = "The sku must be one of the following values: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2."
    }
}

variable "replica_count" {
    type        = number
    description = "Replicas distribute search workloads across the service. You need at least two replicas to support high availability of query workloads (not applicable to the free tier)."
    default     = 1
    validation {
        condition     = var.replica_count >= 1 && var.replica_count <= 12
        error_message = "The replica_count must be between 1 and 12."
    }
}

variable "partition_count" {
    type        = number
    description = "Partitions allow for scaling of document count as well as faster indexing by sharding your index over multiple search units."
    default     = 1
    validation {
        condition     = contains([1, 2, 3, 4, 6, 12], var.partition_count)
        error_message = "The partition_count must be one of the following values: 1, 2, 3, 4, 6, 12."
    }
}
