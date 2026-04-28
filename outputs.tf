output "droplet_ip" {
  description = "Public IP of the droplet"
  value       = digitalocean_droplet.kohut_node.ipv4_address
}

output "vpc_id" {
  value = digitalocean_vpc.kohut_vpc.id
}

