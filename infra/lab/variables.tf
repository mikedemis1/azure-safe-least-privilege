variable "subscription_id" {
  description = "Azure subscription that hosts the lab."
  type        = string
}

variable "location" {
  description = "Azure region for all lab resources."
  type        = string
  default     = "westeurope"
}
