resource "perimeter81_network" "n1" {
  network {
    name = "william-terraform-test"
    tags = ["test"]
  }
  region {
    cpregion_id = "v2cRwzGRua"
    idle        = true
  }
}

resource "perimeter81_gateway" "g1" {

  gateways {
    name = "gateway1"
    idle = false
  }

  gateways {
    name = "gateway2"
    idle = false
  }

  network_id = perimeter81_network.n1.id
  region_id  = perimeter81_network.n1.region[0].region_id
}
