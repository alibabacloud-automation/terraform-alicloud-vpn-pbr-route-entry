terraform-alicloud-vpn-pbr-route-entry
=====================================================================

本 Module 用于在阿里云为VPN网关创建[策略路由(PBR)](https://www.alibabacloud.com/help/zh/doc-detail/127248.html)

本 Module 支持创建以下资源:

* [策略路由(Vpn_Pbr_Route_Entry)](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpn_pbr_route_entry)

## 版本要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.131.0 |

## 用法

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

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
MIT Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
