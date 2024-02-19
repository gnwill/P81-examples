terraform {
  required_providers {
    perimeter81 = {
      source  = "Perimeter81-Public/perimeter81"
      version = "1.8.0"
    }
  }
}

provider "perimeter81" {
  api_key  = var.API_KEY
  base_url = "https://api.perimeter81.com/api/rest"
}
