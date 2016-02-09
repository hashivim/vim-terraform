" Forked from Larry Gilbert's syntax file
" github.com/L2G/vim-syntax-terraform

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword terraSection connection output provider variable
syn keyword terraValueBool true false on off yes no

""" resource

syn keyword terraResourceTypeBI
          \ atlas_artifact
          \ aws_ami
          \ aws_ami_copy
          \ aws_ami_from_instance
          \ aws_app_cookie_stickiness_policy
          \ aws_asg
          \ aws_autoscale
          \ aws_autoscaling_group
          \ aws_autoscaling_lifecycle_hook
          \ aws_autoscaling_notification
          \ aws_autoscaling_policy
          \ aws_autoscaling_schedule
          \ aws_cloudformation_stack
          \ aws_cloudtrail
          \ aws_cloudwatch_log_group
          \ aws_cloudwatch_metric_alarm
          \ aws_codecommit_repository
          \ aws_codedeploy_app
          \ aws_codedeploy_deployment_group
          \ aws_customer_gateway
          \ aws_db_instance
          \ aws_db_parameter_group
          \ aws_db_security_group
          \ aws_db_subnet_group
          \ aws_directory_service_directory
          \ aws_dynamodb_table
          \ aws_ebs_volume
          \ aws_ecr_repository
          \ aws_ecr_repository_policy
          \ aws_ecs_cluster
          \ aws_ecs_service
          \ aws_ecs_task_definition
          \ aws_efs_file_system
          \ aws_efs_mount_target
          \ aws_eip
          \ aws_elasticache_cluster
          \ aws_elasticache_parameter_group
          \ aws_elasticache_security_group
          \ aws_elasticache_subnet_group
          \ aws_elasticsearch_domain
          \ aws_elb
          \ aws_flow_log
          \ aws_glacier_vault
          \ aws_iam_access_key
          \ aws_iam_group
          \ aws_iam_group_membership
          \ aws_iam_group_policy
          \ aws_iam_instance_profile
          \ aws_iam_policy
          \ aws_iam_policy_attachment
          \ aws_iam_role
          \ aws_iam_role_policy
          \ aws_iam_saml_provider
          \ aws_iam_server_certificate
          \ aws_iam_user
          \ aws_iam_user_policy
          \ aws_instance
          \ aws_internet_gateway
          \ aws_key_pair
          \ aws_kinesis_firehose_delivery_stream
          \ aws_kinesis_stream
          \ aws_lambda_alias
          \ aws_lambda_event_source_mapping
          \ aws_lambda_function
          \ aws_launch_configuration
          \ aws_lb_cookie_stickiness_policy
          \ aws_lc
          \ aws_load_balancer
          \ aws_main_route_table_association
          \ aws_nat_gateway
          \ aws_network_acl
          \ aws_network_acl_rule
          \ aws_network_interface
          \ aws_opsworks_custom_layer
          \ aws_opsworks_ganglia_layer
          \ aws_opsworks_haproxy_layer
          \ aws_opsworks_java_app_layer
          \ aws_opsworks_memcached_layer
          \ aws_opsworks_mysql_layer
          \ aws_opsworks_nodejs_app_layer
          \ aws_opsworks_php_app_layer
          \ aws_opsworks_rails_app_layer
          \ aws_opsworks_stack
          \ aws_opsworks_static_web_layer
          \ aws_placement_group
          \ aws_proxy_protocol_policy
          \ aws_rds_cluster
          \ aws_rds_cluster_instance
          \ aws_redshift_cluster
          \ aws_redshift_parameter_group
          \ aws_redshift_security_group
          \ aws_redshift_subnet_group
          \ aws_route
          \ aws_route53_delegation_set
          \ aws_route53_health_check
          \ aws_route53_record
          \ aws_route53_zone
          \ aws_route53_zone_association
          \ aws_route_table
          \ aws_route_table_association
          \ aws_s3_bucket
          \ aws_s3_bucket_object
          \ aws_security_group
          \ aws_security_group_rule
          \ aws_sns_topic
          \ aws_sns_topic_subscription
          \ aws_spot_instance_request
          \ aws_sqs_queue
          \ aws_subnet
          \ aws_volume_attachment
          \ aws_vpc
          \ aws_vpc_dhcp_options
          \ aws_vpc_dhcp_options_association
          \ aws_vpc_endpoint
          \ aws_vpc_peering_connection
          \ aws_vpn_connection
          \ aws_vpn_connection_route
          \ aws_vpn_gateway
          \ azure_affinity_group
          \ azure_data_disk
          \ azure_dns_server
          \ azure_hosted_service
          \ azure_instance
          \ azure_local_network_connection
          \ azure_security_group
          \ azure_security_group_rule
          \ azure_sql_database_server
          \ azure_sql_database_server_firewall_rule
          \ azure_sql_database_service
          \ azure_storage_blob
          \ azure_storage_container
          \ azure_storage_queue
          \ azure_storage_service
          \ azure_virtual_network
          \ azurerm_availability_set
          \ azurerm_cdn_endpoint
          \ azurerm_cdn_profile
          \ azurerm_dns_a_record
          \ azurerm_dns_aaaa_record
          \ azurerm_dns_cname_record
          \ azurerm_dns_mx_record
          \ azurerm_dns_ns_record
          \ azurerm_dns_srv_record
          \ azurerm_dns_txt_record
          \ azurerm_dns_zone
          \ azurerm_local_network_gateway
          \ azurerm_network_interface
          \ azurerm_network_security_group
          \ azurerm_network_security_rule
          \ azurerm_public_ip
          \ azurerm_resource_group
          \ azurerm_route
          \ azurerm_route_table
          \ azurerm_sql_database
          \ azurerm_sql_firewall_rule
          \ azurerm_sql_server
          \ azurerm_storage_account
          \ azurerm_storage_blob
          \ azurerm_storage_container
          \ azurerm_storage_queue
          \ azurerm_subnet
          \ azurerm_virtual_network
          \ chef_data_bag
          \ chef_data_bag_item
          \ chef_environment
          \ chef_node
          \ chef_role
          \ cloudflare_record
          \ cloudstack_disk
          \ cloudstack_egress_firewall
          \ cloudstack_firewall
          \ cloudstack_instance
          \ cloudstack_ipaddress
          \ cloudstack_loadbalancer_rule
          \ cloudstack_network
          \ cloudstack_network_acl
          \ cloudstack_network_acl_rule
          \ cloudstack_nic
          \ cloudstack_port_forward
          \ cloudstack_secondary_ipaddress
          \ cloudstack_ssh_keypair
          \ cloudstack_template
          \ cloudstack_vpc
          \ cloudstack_vpn_connection
          \ cloudstack_vpn_customer_gateway
          \ cloudstack_vpn_gateway
          \ consul_keys
          \ digitalocean_domain
          \ digitalocean_droplet
          \ digitalocean_floating_ip
          \ digitalocean_record
          \ digitalocean_ssh_key
          \ dme_record
          \ dnsimple_record
          \ do_droplet
          \ do_instance
          \ docker_container
          \ docker_image
          \ docker_network
          \ docker_volume
          \ dyn_record
          \ google_compute_address
          \ google_compute_autoscaler
          \ google_compute_backend_service
          \ google_compute_disk
          \ google_compute_firewall
          \ google_compute_forwarding_rule
          \ google_compute_global_address
          \ google_compute_global_forwarding_rule
          \ google_compute_http_health_check
          \ google_compute_https_health_check
          \ google_compute_instance
          \ google_compute_instance_group_manager
          \ google_compute_instance_template
          \ google_compute_network
          \ google_compute_project_metadata
          \ google_compute_route
          \ google_compute_ssl_certificate
          \ google_compute_target_http_proxy
          \ google_compute_target_https_proxy
          \ google_compute_target_pool
          \ google_compute_url_map
          \ google_compute_vpn_gateway
          \ google_compute_vpn_tunnel
          \ google_container_cluster
          \ google_dns_managed_zone
          \ google_dns_record_set
          \ google_pubsub_subscription
          \ google_pubsub_topic
          \ google_sql_database
          \ google_sql_database_instance
          \ google_sql_user
          \ google_storage_bucket
          \ google_storage_bucket_acl
          \ google_storage_bucket_object
          \ google_storage_object_acl
          \ heroku_addon
          \ heroku_app
          \ heroku_cert
          \ heroku_domain
          \ heroku_drain
          \ mailgun_domain
          \ mysql_database
          \ null_resource
          \ openstack_blockstorage_volume_v1
          \ openstack_compute_floatingip_v2
          \ openstack_compute_instance_v2
          \ openstack_compute_keypair_v2
          \ openstack_compute_secgroup_v2
          \ openstack_compute_servergroup_v2
          \ openstack_floating_ip
          \ openstack_fw_firewall_v1
          \ openstack_fw_policy_v1
          \ openstack_fw_rule_v1
          \ openstack_lb_member_v1
          \ openstack_lb_monitor_v1
          \ openstack_lb_pool_v1
          \ openstack_lb_vip_v1
          \ openstack_networking_floatingip_v2
          \ openstack_networking_network_v2
          \ openstack_networking_port_v2
          \ openstack_networking_router_interface_v2
          \ openstack_networking_router_v2
          \ openstack_networking_subnet_v2
          \ openstack_objectstorage_container_v1
          \ packet_device
          \ packet_project
          \ packet_ssh_key
          \ postgresql_database
          \ postgresql_role
          \ powerdns_record
          \ rundeck_job
          \ rundeck_private_key
          \ rundeck_project
          \ rundeck_public_key
          \ statuscake_test
          \ template_cloudinit_config
          \ template_file
          \ terraform_remote_state
          \ test_instance
          \ test_load_balancer
          \ tls_cert_request
          \ tls_locally_signed_cert
          \ tls_private_key
          \ tls_self_signed_cert
          \ unknown_instance
          \ vcd_dnat
          \ vcd_firewall_rules
          \ vcd_network
          \ vcd_snat
          \ vcd_vapp
          \ vsphere_folder
          \ vsphere_virtual_machine
          \
          \ contained

syn keyword terraTodo         contained TODO FIXME XXX BUG
syn cluster terraCommentGroup contains=terraTodo
syn region  terraComment      start="/\*" end="\*/" contains=@terraCommentGroup,@Spell
syn region  terraComment      start="#" end="$" contains=@terraCommentGroup,@Spell
syn region  terraComment      start="//" end="$" contains=@terraCommentGroup,@Spell

syn match  terraResource        /\<resource\>/ nextgroup=terraResourceTypeStr skipwhite
syn region terraResourceTypeStr start=/"/ end=/"/ contains=terraResourceTypeBI
                              \ nextgroup=terraResourceName skipwhite
syn region terraResourceName    start=/"/ end=/"/
                              \ nextgroup=terraResourceBlock skipwhite
""" provider
syn match  terraProvider      /\<provider\>/ nextgroup=terraProviderName skipwhite
syn region terraProviderName  start=/"/ end=/"/ nextgroup=terraProviderBlock skipwhite

""" provisioner
syn match  terraProvisioner     /\<provisioner\>/ nextgroup=terraProvisionerName skipwhite
syn region terraProvisionerName start=/"/ end=/"/ nextgroup=terraProvisionerBlock skipwhite

""" module
syn match  terraModule     /\<module\>/ nextgroup=terraModuleName skipwhite
syn region terraModuleName start=/"/ end=/"/ nextgroup=terraModuleBlock skipwhite

""" misc.
syn match terraValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match terraValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"
syn match terraBraces        "[{}\[\]]"

""" skip \" in strings.
""" we may also want to pass \\" into a function to escape quotes.
syn region terraValueString   start=/"/ skip=/\\\+"/ end=/"/ contains=terraStringInterp
syn region terraStringInterp  matchgroup=terraBrackets start=/\${/ end=/}/ contains=terraValueFunction contained
"" TODO match keywords here, not a-z+
syn region terraValueFunction matchgroup=terraBrackets start=/[a-z]\+(/ end=/)/ contains=terraValueString,terraValueFunction contained

hi def link terraComment           Comment
hi def link terraTodo              Todo
hi def link terraBrackets          Operator
hi def link terraProvider          Structure
hi def link terraBraces            Delimiter
hi def link terraProviderName      String
hi def link terraResource          Structure
hi def link terraResourceName      String
hi def link terraResourceTypeBI    Tag
hi def link terraResourceTypeStr   String
hi def link terraSection           Structure
hi def link terraStringInterp      Identifier
hi def link terraValueBool         Boolean
hi def link terraValueDec          Number
hi def link terraValueHexaDec      Number
hi def link terraValueString       String
hi def link terraProvisioner       Structure
hi def link terraProvisionerName   String
hi def link terraModule            Structure
hi def link terraModuleName        String
hi def link terraValueFunction     Identifier

let b:current_syntax = "terraform"
