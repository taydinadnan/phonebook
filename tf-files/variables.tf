variable "git-name" {
  default = "git_username"
}

variable "git-token" {
  default = "************************"
}

variable "key-name" {
  default = "your-keypair"
}


////////*** If you need route53 -Dont forget to uncomment related codes in #main.tf #data.tf #outputs.tf
# variable "hosted-zone" {
#   default = "if-needed-type-your-domain.com" 
# }