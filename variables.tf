variable "region" {
    description = "region to create your resource"
    type = string
    default = "us-east-1"
  
}

variable "bucket" {
    description = "bucket name for your s3"
    type = string
    default = "dev_s3"
  
}

variable "s3_tags" {
    type = map(string)
    default = {}
    
  
}

variable "versioning_status" {
    description = "to enable or disble versioning your s3"
    type = string
    default = "Enabled"
  
}

##Defining variables for dynamodb
variable "name" {
    description = "creating the name of the dynamodb"
    type = string
    default = "db_dev"
  
}

variable "billing_mode" {
    description = "choosing the type of billing mode"
    type = string
    default = "PAY_PER_REQUEST"
  
}

variable "db_tags" {
    type = map(string)
    default = {}
  
}