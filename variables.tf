variable "root_id" {
  type        = string
  description = "The short identifier prefix used for Management Group naming (alphanumeric and hyphens only)."
  default     = "alz"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{2,24}$", var.root_id))
    error_message = "The root_id must be between 2 and 24 characters and contain only letters, numbers, and hyphens."
  }
}

variable "root_name" {
  type        = string
  description = "The display name of the top-level intermediate root Management Group."
  default     = "Enterprise Landing Zone"
}

variable "parent_management_group_id" {
  type        = string
  description = "The parent Management Group ID. If omitted or null, defaults to the Entra ID Tenant Root Group ID."
  default     = null
}

variable "subscription_placement" {
  type        = map(list(string))
  description = "Mapping of management group key identifiers to list of Azure subscription IDs."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Resource & governance metadata tags for the Landing Zone deployment."
  default = {
    Environment  = "Production"
    ManagedBy    = "Terraform"
    Framework    = "Azure Cloud Adoption Framework (CAF)"
    Architecture = "Enterprise Landing Zone"
  }
}
