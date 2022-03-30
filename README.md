Terraform module which creates PBR route for vpn gateway on Alibaba Cloud.

terraform-alicloud-vpn-pbr-route-entry
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpn-pbr-route-entry/blob/master/README-CN.md)

Terraform module which creates PBR route for vpn gateway on Alibaba Cloud.

These types of resources are supported:

* [Vpn_Pbr_Route_Entry](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_pbr_route_entry)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.131.0 |

## Usage

```hcl
module "example" {
  source                 = "terraform-alicloud-modules/vpn-pbr-route-entry/alicloud"
  create_pbr_route_entry = true
  vpn_gateway_id         = data.alicloud_vpn_gateways.default.ids.0
  route_source           = "192.168.1.0/24"
  route_dest             = "10.0.0.0/24"
  next_hop               = alicloud_vpn_connection.default.id
  weight                 = 0
  publish_vpc            = false
}
```

Submit Issues
-------------
If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
MIT Licensed. See LICENSE for full details.

Reference
---------

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
