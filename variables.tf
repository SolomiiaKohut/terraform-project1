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
  description = "Spaces access key"
  type        = string
  sensitive   = true
}

variable "spaces_secret_key" {
  description = "Spaces secret key"
  type        = string
  sensitive   = true
}
