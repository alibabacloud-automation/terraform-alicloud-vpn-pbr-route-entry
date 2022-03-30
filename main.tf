resource alicloud_vpn_pbr_route_entry vpn_pbr_route_entry {
  count          = var.create_pbr_route_entry ? 1 : 0
  vpn_gateway_id = var.vpn_gateway_id
  route_source   = var.route_source
  route_dest     = var.route_dest
  next_hop       = var.next_hop
  weight         = var.weight
  publish_vpc    = var.publish_vpc
}