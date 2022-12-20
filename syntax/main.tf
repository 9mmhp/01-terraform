provider "local" {
}

variable "number" {
  description = "An example of a variable in Terraform"
  type        = number
  default     = 42
}

output "number_example" {
  value = var.number_example
}
