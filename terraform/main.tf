terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

provider "render" {
  api_key = var.render_api_key
}

variable "render_api_key" {}

resource "render_web_service" "mon_site" {
  name   = "mon-site"
  plan   = "free"
  region = "frankfurt"

  image = "docker.io/hackintoshhackman/mon-site:latest"

  ports = [
    {
      port = 80
    }
  ]
}
