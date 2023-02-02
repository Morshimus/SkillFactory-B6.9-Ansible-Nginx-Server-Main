locals {

  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      user         = "centos",
      source_image = var.source_image,
      ip           = module.morsh_instance_ya_1.external_ip_address_morsh_bastion

    }
  )



}