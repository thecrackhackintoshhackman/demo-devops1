terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Variable pour l'image Docker (dynamiquement depuis GitHub Actions)
variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "hackintoshhackman/mon-site:latest"
}

# Docker container
resource "docker_container" "mon_site" {
  name  = "mon-site-container"
  image = var.docker_image

  # Ports
  ports {
    internal = 80
    external = 8080
  }

  # Optionnel : volume pour voir les changements locaux (utile en dev local)
  # volumes {
  #   host_path      = "../site"  # chemin vers ton index.html
  #   container_path = "/usr/share/nginx/html"
  # }

  restart = "no"
}
