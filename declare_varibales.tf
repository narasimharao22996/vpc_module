variable "region" {
    type = string
    description = "region of vpc"
    default = "us-east-1"
}

variable "vpc-name" {
    type = string
    description = "name of the vpc"
}

variable "vpc-cidr" {
    type = string
    description = "cidr range of vpc"
}

variable "private-cidrs" {
    type = list(string)
}

variable "public-cidrs" {
    type = list(string)
}

variable "ami-id" {
    type = string
    description = "Ami id of ubuntu 22.04"
    default = "ami-0574da719dca65348"
}

variable "web-trigger" {
    type = string
    description = "running number for trigger"
    default = "1.0"
  
}