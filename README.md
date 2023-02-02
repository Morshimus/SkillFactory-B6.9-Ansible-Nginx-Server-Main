# SkillFactory-B6.9-Ansible-Nginx-Server-Main
## Roles repo - https://github.com/Morshimus/SkillFactory-B6.9-Ansible-Nginx-Server-Roles
## Задание
* [x] - :one: ~~Создайте Ansible-роль, настраивающую кэширующий DNS-сервер dnsmasq. Примените ее.~~
 > Для данного задания был создан дополнительный репозиторий с ролями, где происходило тестирование ролей с помощью molecule.
 ![image](https://db3pap003files.storage.live.com/y4mo2umDfn5Bo35o6_i33SOtY11ft8nuJmKH5asCAtdDBVFeywf57wEDYXIziulGbtjauo5mElm1v-D85NVVKfH8Hq6Y7B9Dndw2JIb7t4lB5fTwlHAW4NW6kq57LFdbBLtY1ey_tanlQoZIuJKsF62QB9tcaJkJUQ85mh2CxislmcbLDzieqUkiB0yTfqR2zg_hycv6774j4_bImMcKRQgBg/Ansible_Role_Project.jpg?psid=1&width=1277&height=612)

$${\color{magenta}molecule \space ouptut:}$$

![image](https://db3pap003files.storage.live.com/y4mPDPDN3L4KpuOC8OwzrF4-VR0wu50MM8SBfLrC3b5Wlxq8ni6AI6Zka37xBKOPBoc6kTosTB7xrGelbxDfxB_4UlllQiMv5YogM-FZNON1g5KkS_0sgivc0yhG9RgFAqM8D6I-llNfF-u4W4x0_UFRfHkpWxinhONJ6ov8hNWyfiIHCppjVY3CUb-3LOfGLNo3vXpI1uXxBV3wNz8c5RR2Q/Molecule_dnsmasq.jpg?psid=1&width=1326&height=582)
 
* [x] - :two: ~~Напишите Ansible-playbook, создающий группу пользователей superusers, куда входят пользователи user2 и user3, и которая, выполнив sudo -i, сможет повысить свои полномочия и стать root-пользователем. Можете использовать модуль lineinfile. У него есть параметр validate, позволяющий проверять сделанные изменения в файле. В документации есть пример валидации sudoers-файла.~~
 > Задание было немного переработано - вместо плейбука была написана роль user_mgmt
  
  $${\color{magenta}molecule \space ouptut:}$$
  
  ![image](https://db3pap003files.storage.live.com/y4mvi4U54vX7MhkKS7pwWNczUQ6vnikfV-Y9YYzhUbfv_LxlT9eS3KiIwDuraPtziN2lLVO8Xo4vhE3G6Jpd2V2uFaDEY82dsLyfr55cBKJeOIGPTCuuG591pLo5TljtqB7BfIiYz464f5VsveXbEMtj3_Kn9_xzbDaVEUIe-4jStSYhct3UP3Bg-jlemfYINHSTFXax5H1F4CTjjshgkicMw/Molecule_users_mgmt.jpg?psid=1&width=1316&height=520)
 
* [x] - :three: ~~Самостоятельно напишите Ansible-роль, настраивающую связку nginx+php-fpm и выдающую при обращении к главной странице веб-сервера информацию о php (содержимое index.php — <?php phpinfo();?>).~~
>Cделано с помощью templates и handler
     ![image](https://db3pap003files.storage.live.com/y4mSiAeMkK9JuvNDyaige5uS72xFQAXzHz1JFQ3gfWL08LnfjkhWOxD1vbLSFYUdi8A_HvKFnwU-Htq6Q79rvbBszo53b2qrCnztWVpaJ5VPaQY4kemKs-eo9aaHb0inDJfc39J9GpEDGbUTiF6fTwLF8kMq0tEFss7dAhluG42Z6fERVMAcdyrapm0gbFhRsb9HEDbLIBbC11WGm-u0KZXOg/Ansible_Nginx_PHP_version.jpg?psid=1&width=1518&height=802)

* [x] - :four: ~~Дополните роль из п.3: пусть DocumentRoot будет в директории /opt/nginx/ansible. Используйте handler для перечитывания конфигурации nginx.~~
  > Сделано в рамках роли nginx. Handler перезаупускает службу когда значение из темплейтов j2 обновлено. Проверен с тестом по порту 8080 в molecule и команды "nginx -t"
  
    $${\color{magenta}molecule \space ouptut:}$$

![image](https://db3pap003files.storage.live.com/y4mzvUihVKENRO44J9JcJD-pxUijerQXgYmyvBa-k-7DnX4afqifoQMvbshPrJhtdvk9z_HvydfBieS4p9W7u75_iYqVQVsQHm21ow_Bm8NXhuWxn9akmyaWuF0azfjwglNEc17aWJkJenPdA8LzRhajUKrPWLLFzbDlb_M4TMMhjPd_arVO91UNQzZ7zETaqDIelmlRE4mtNt-q7nhbCQAFA/Molecule_nginx_php_1.jpg?psid=1&width=1201&height=802)
![image](https://db3pap003files.storage.live.com/y4mYlKx6GrV9FqtbPc6T8rJE6nO7p3fUpYF8t4EfW3w6pVdsvio3M4cL2_b86dpN-FpnRisQtE9-ehdV2wSUZ2YEPEu--I5xbRB6Xe4lX8aVU36UlOPBLapALyPtNWrhSBJ0RDRASaH_8oQJH_W0BSy3b7f3nBx8HKEglUbK9LILj7oXewq6cts78RJwUASXOXkelzJyiwczqW8QFB-RlsENw/Molecule_nginx_php_2.jpg?psid=1&width=1155&height=281)

$${\color{lightgreen}FULL \space RUN \space of \space ansible-playbook \space in \space SkillFactory-B6.9-Ansible-Nginx-Server-Main: }$$

![image](https://db3pap003files.storage.live.com/y4mlNM8SS10uFBhqVPv7IM3Gpkvc1bnumZTNBiJTIGahbbOtadfCKBQE-lrhkd16Y_Bn3Ke8mnwLF2GDGfJEmMyToNiFA2-EMLYCLYBDeTx3vsJgt7RVMYe6jpqfAhZUORwsAEZvAvhgvDuHPi8kP81CEdmig98Z8_xeGC4D6-Ts-O3o0vXd41ihKLkrdh00_Abk_tnOOkyubrczWLxsL7HUw/Ansible_Nginx_DNSmaqs_Users_1.jpg?psid=1&width=1313&height=665)
![image](https://db3pap003files.storage.live.com/y4mTK5l9U39XT2YhQDo-6c7MCVh1d7J-cx31obCvkZxhF_tokzp2bl88iOJlRyb2_wfhAPYK2F0j4AhixaCK1V1zxjUy2tu26KWTj64X_1diMF8tXkmsBEQCBSV_CLCUkYB_e-RoKuDOQvpLA4MrLXTZnh368_cywKTzJ5GnwINImOso056F3m3sn4zjqQ6QnwA-yUhe1v_W97X70j6moPdYw/Ansible_Nginx_DNSmaqs_Users_2.jpg?psid=1&width=1298&height=802)



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | ~> 0.84.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.3.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_morsh_instance_ya_1"></a> [morsh\_instance\_ya\_1](#module\_morsh\_instance\_ya\_1) | ./INSTANCE | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.yc_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [yandex_vpc_network.morsh-network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.morsh-subnet-a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.morsh-subnet-b](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id_yandex"></a> [cloud\_id\_yandex](#input\_cloud\_id\_yandex) | Cloud id of yandex.cloud provider | `string` | n/a | yes |
| <a name="input_folder_id_yandex"></a> [folder\_id\_yandex](#input\_folder\_id\_yandex) | Folder id of yandex.cloud provider | `string` | n/a | yes |
| <a name="input_network_name_yandex"></a> [network\_name\_yandex](#input\_network\_name\_yandex) | Created netowork in yandex.cloud name | `string` | n/a | yes |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Size of required vm | `string` | `"12"` | no |
| <a name="input_service_account_key_yandex"></a> [service\_account\_key\_yandex](#input\_service\_account\_key\_yandex) | Local storing service key. Not in git tracking | `string` | `"./key.json"` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | OS family of image | `string` | `"centos-stream8"` | no |
| <a name="input_subnet_a_description_yandex"></a> [subnet\_a\_description\_yandex](#input\_subnet\_a\_description\_yandex) | n/a | `string` | `"Subnet A for morshimus instance A"` | no |
| <a name="input_subnet_a_name_yandex"></a> [subnet\_a\_name\_yandex](#input\_subnet\_a\_name\_yandex) | Subnet for 1st instance | `string` | `"morsh-subnet-a"` | no |
| <a name="input_subnet_a_v4_cidr_blocks_yandex"></a> [subnet\_a\_v4\_cidr\_blocks\_yandex](#input\_subnet\_a\_v4\_cidr\_blocks\_yandex) | IPv4 network for 1st instance subnet | `list(string)` | <pre>[<br>  "192.168.21.0/28"<br>]</pre> | no |
| <a name="input_subnet_b_description_yandex"></a> [subnet\_b\_description\_yandex](#input\_subnet\_b\_description\_yandex) | n/a | `string` | `"Subnet B for morshimus instance B"` | no |
| <a name="input_subnet_b_name_yandex"></a> [subnet\_b\_name\_yandex](#input\_subnet\_b\_name\_yandex) | Subnet for 2nd instance | `string` | `"morsh-subnet-b"` | no |
| <a name="input_subnet_b_v4_cidr_blocks_yandex"></a> [subnet\_b\_v4\_cidr\_blocks\_yandex](#input\_subnet\_b\_v4\_cidr\_blocks\_yandex) | IPv4 network for 2st instance subnet | `list(string)` | <pre>[<br>  "192.168.22.0/28"<br>]</pre> | no |
| <a name="input_useros"></a> [useros](#input\_useros) | OS native default user | `string` | `"cloud-user"` | no |
| <a name="input_zone_yandex_a"></a> [zone\_yandex\_a](#input\_zone\_yandex\_a) | Zone of 1st instance in yandex cloud | `string` | `"ru-central1-a"` | no |
| <a name="input_zone_yandex_b"></a> [zone\_yandex\_b](#input\_zone\_yandex\_b) | Zone of 2nd instance in yandex cloud | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_vm_1"></a> [external\_ip\_address\_vm\_1](#output\_external\_ip\_address\_vm\_1) | n/a |
| <a name="output_hostname_vm_1"></a> [hostname\_vm\_1](#output\_hostname\_vm\_1) | n/a |
| <a name="output_internal_ip_address_vm_1"></a> [internal\_ip\_address\_vm\_1](#output\_internal\_ip\_address\_vm\_1) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
