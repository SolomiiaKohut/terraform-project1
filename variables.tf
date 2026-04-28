variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_fingerprint" {
  description = "SSH key fingerprint from DigitalOcean"
  type        = string
}

variable "spaces_access_key" {

}

variable "spaces_secret_key" {

}
