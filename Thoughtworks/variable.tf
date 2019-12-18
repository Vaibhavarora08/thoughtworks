variable "region"{
  description ="The aws region in which infra is being provisioned"
  type="string"
  default ="us-east-2"
}

variable "environment"{
   description ="The aws environment in which infra is being provisioned"
  type="string"
  default ="prod"
}  

variable "dynamodb" {
description ="dynamo db name"
  type="string"
  default =""
}

variable "ami"{
description ="Base ami used for instance"
  type="string"
  default ="ami-0456778927474"
}

variable "key_name"{
description ="The key pair name used for instance"
  type="string"
  default ="prod"
}
 
variable "subnets"{
description ="The subnet associated with the servers"
  type="string"
}

variable "lb_name"{
description ="The load balancer name to be used"
  type="string" 
}

variable "dns_zoneid"{}
variable "dns_domain"{}
variable "s3"{}