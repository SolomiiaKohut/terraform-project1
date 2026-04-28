terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


provider "digitalocean" {
  token = var.do_token
}

# -------------------
# VPC
# -------------------
resource "digitalocean_vpc" "kohut_vpc" {
  name     = "kohut-vpc"
  region   = "fra1"
  ip_range = "10.10.10.0/24"
}

# -------------------
# Droplet
# -------------------
resource "digitalocean_droplet" "kohut_node" {
  name   = "kohut-node"
  region = "fra1"
  size   = "s-2vcpu-4gb"
  image  = "ubuntu-24-04-x64"

  vpc_uuid = digitalocean_vpc.kohut_vpc.id

  ssh_keys = [var.ssh_fingerprint]
}

# -------------------
# Firewall
# -------------------
resource "digitalocean_firewall" "kohut_fw" {
  name = "kohut-firewall"

  droplet_ids = [digitalocean_droplet.kohut_node.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8000-8003"
    source_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
}

# -------------------
# Spaces Bucket
# -------------------
resource "digitalocean_spaces_bucket" "kohut_bucket" {
  name   = "kohut-bucket"
  region = "fra1"
}
