terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "mon_site" {
  name = "hackintoshhackman/mon-site:latest"
}

resource "docker_container" "mon_site" {
  name  = "mon-site-container"
  image = docker_image.mon_site.name

  ports {
    internal = 80
    external = 8080
  }
}
