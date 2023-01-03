variable "bucket_name" {
  description = "The name of the S3 bucket. Must ne globally unique."
  type        = string
  default     = "aws15-terraform-state"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must ne unique in this AWS account."
  type        = string
  default     = "aws15-terraform-locks"
}
