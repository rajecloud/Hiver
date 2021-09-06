

region              = "us-east-1"
availability_zone   = "us-east-1a"
subnet_name         = "Private_Subnet"

##### Make sure cidr that you are choosing is under default vpc cidr values. Also confirm the existing default vpc subnet cidr's

subnet_cidr         = "172.31.33.0/24"  
sg_name             = "prod-web-servers-sg"
instance_count      = 2
instance_name       = "prod-web-server"
image               = "ami-0a23ccb2cdd9286bb"
instance_type       = "t2.micro"
key_pair            = "EC2-KeyPair"  #### Key pair name which is existing already
