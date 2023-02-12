terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.0.0-rc1"
    }
  }
}

variable "CLOUDFLARE_TOKEN" {
    type = string
}

variable "domain" {
    default = "bb593490461520753b3d721dc2a7734a"
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_TOKEN
}

resource "cloudflare_record" "www" {
    zone_id = "${var.domain}"
    name = "www"
    value = "creative-lolly-f1071b.netlify.app"
    type = "CNAME"
    proxied = true
}

resource "cloudflare_record" "root" {
    zone_id = "${var.domain}"
    name = "@"
    value = "creative-lolly-f1071b.netlify.app"
    type = "CNAME"
    proxied = true
}