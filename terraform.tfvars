# You may need to edit these variables to match your config
ecs_cluster="technogise_cluster"
ecs_key_pair_name="test"
region= "ap-southeast-2"
technogise_app_image= "185966419215.dkr.ecr.ap-southeast-2.amazonaws.com/technogise"
provisioning_role_arn="arn:aws:iam::185966419215:role/TechnogiseProvision"

# no need to change these unless you want to
technogise_vpc = "technogise_vpc"
technogise_network_cidr = "210.0.0.0/16"
technogise_public_01_cidr = "210.0.0.0/24"
technogise_public_02_cidr = "210.0.10.0/24"
max_instance_size = 3
min_instance_size = 1
desired_capacity = 2
