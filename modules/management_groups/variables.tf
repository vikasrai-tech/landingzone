variable "root_id" {
  type        = string
  description = "The root ID prefix for all management groups (alphanumeric and hyphens only). e.g., 'alz' or 'corp'."
  default     = "alz"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{2,24}$", var.root_id))
    error_message = "The root_id must be between 2 and 24 characters and contain only letters, numbers, and hyphens."
  }
}

variable "root_name" {
  type        = string
  description = "The display name for the top-level intermediate root management group."
  default     = "Enterprise Landing Zone"
}

variable "parent_management_group_id" {
  type        = string
  description = "The ID of the parent management group. If null or empty string, defaults to the Tenant Root Group ID."
  default     = null
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory / Entra ID Tenant ID."
}

variable "subscription_placement" {
  type        = map(list(string))
  description = "Optional mapping of management group keys (e.g. 'management', 'connectivity', 'identity', 'corp', 'online', 'nonprod', 'sandbox') to list of subscription IDs."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Governance tags to associate with the Landing Zone deployment metadata."
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Framework   = "Azure Cloud Adoption Framework (CAF)"
  }
}
