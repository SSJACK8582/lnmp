terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.99.0"
    }
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
  }
}

resource "ansible_host" "salt-proxy" {
  count = 1

  // 配置机器的 hostname，一般配置为计算资源的 public_ip (或 private_ip)
  inventory_hostname  = "60.205.176.114"

  // 配置机器所属分组
  groups = ["salt-proxy"]

  // 传给 ansible 的 vars，可在 playbook 文件中引用
  vars = {
    wait_connection_timeout   = 60
    proxy_private_ip          = "60.205.176.114"
    proxy_docker_tag          = "tag"
  }
}