resource "random_integer" "default" {
  min = 10000
  max = 99999
}

data "alicloud_vpn_gateways" "default" {
}


resource "alicloud_vpn_customer_gateway" "defaultCustomerGateway" {
  description           = "defaultCustomerGateway"
  ip_address            = "2.2.2.5"
  asn                   = "2224"
  customer_gateway_name = var.name
}

resource "alicloud_vpn_customer_gateway" "changeCustomerGateway" {
  description           = "changeCustomerGateway"
  ip_address            = "2.2.2.6"
  asn                   = "2225"
  customer_gateway_name = var.name
}


resource "alicloud_vpn_connection" "default" {
  vpn_gateway_id      = data.alicloud_vpn_gateways.default.ids[0]
  vpn_connection_name = var.name
  local_subnet = [
    "3.0.0.0/24"
  ]
  remote_subnet = [
    "10.0.0.0/24",
    "10.0.1.0/24"
  ]
  tags = {
    Created = "TF"
    For     = "example"
  }
  enable_tunnels_bgp = "true"
  tunnel_options_specification {
    tunnel_ipsec_config {
      ipsec_auth_alg = "md5"
      ipsec_enc_alg  = "aes256"
      ipsec_lifetime = "16400"
      ipsec_pfs      = "group5"
    }

    customer_gateway_id = alicloud_vpn_customer_gateway.defaultCustomerGateway.id
    role                = "master"
    tunnel_bgp_config {
      local_asn    = "1219002"
      tunnel_cidr  = "169.254.30.0/30"
      local_bgp_ip = "169.254.30.1"
    }

    tunnel_ike_config {
      ike_mode     = "aggressive"
      ike_version  = "ikev2"
      local_id     = "localid_tunnel2"
      psk          = "12345678"
      remote_id    = "remote2"
      ike_auth_alg = "md5"
      ike_enc_alg  = "aes256"
      ike_lifetime = "3600"
      ike_pfs      = "group14"
    }

  }
  tunnel_options_specification {
    tunnel_ike_config {
      remote_id    = "remote24"
      ike_enc_alg  = "aes256"
      ike_lifetime = "27000"
      ike_mode     = "aggressive"
      ike_pfs      = "group5"
      ike_auth_alg = "md5"
      ike_version  = "ikev2"
      local_id     = "localid_tunnel2"
      psk          = "12345678"
    }

    tunnel_ipsec_config {
      ipsec_lifetime = "2700"
      ipsec_pfs      = "group14"
      ipsec_auth_alg = "md5"
      ipsec_enc_alg  = "aes256"
    }

    customer_gateway_id = alicloud_vpn_customer_gateway.defaultCustomerGateway.id
    role                = "slave"
    tunnel_bgp_config {
      local_asn    = "1219002"
      local_bgp_ip = "169.254.40.1"
      tunnel_cidr  = "169.254.40.0/30"
    }
  }
}


module "example" {
  source                 = "../.."
  create_pbr_route_entry = true
  vpn_gateway_id         = data.alicloud_vpn_gateways.default.ids[0]
  route_source           = "192.168.1.0/24"
  route_dest             = "10.0.0.0/24"
  next_hop               = alicloud_vpn_connection.default.id
  weight                 = 0
  publish_vpc            = false
}
