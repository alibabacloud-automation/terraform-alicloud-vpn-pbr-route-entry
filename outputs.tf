output "this_vpn_pbr_route_entry_id" {
  description = "The PBR route entry ID of vpn."
  value       = concat(alicloud_vpn_pbr_route_entry.vpn_pbr_route_entry.*.id, [""])[0]
}