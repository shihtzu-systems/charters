locals {
  common_tags = map("Created", "terraform")
}

data aws_ami ubuntu {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module http_internal {
  source  = "terraform-aws-modules/security-group/aws//modules/http-8080"
  version = "3.1.0"

  name                = "${var.name}-http-internal-traffic"
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = var.vpc.vpc_id
  ingress_cidr_blocks = ["${var.vpc.network_address}/16", "${var.whitelist_ip}/32"]

  tags = local.common_tags
}

module ssh_me {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "3.1.0"

  name                = "${var.name}-ssh-debugger-traffic"
  description         = "Security group for ssh to debug the machine"
  vpc_id              = var.vpc.vpc_id
  ingress_cidr_blocks = ["${var.whitelist_ip}/32"]

  tags = local.common_tags
}

data template_cloudinit_config this {
  base64_encode = false
  gzip = false

  part {
    filename     = "init.conf"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/init.conf.tpl",
    {
      group = var.group
      name = var.name
      envs = var.envs
      packages = var.packages
      preInitCmds = var.preInitCommands
    })
  }

  part {
    filename     = "init.sh"
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/init.sh.tpl",
    {
      group = var.group
      name = var.name
      git = var.gitUrl
      os = "linux"
      arch = "amd64"
      cmd = var.command
    })
  }

}

module ec2 {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.8.0"

  name                        = var.name
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_ids                  = var.vpc.public_subnet_ids
  key_name                    = var.key_pair_name
  user_data                   = data.template_cloudinit_config.this.rendered

  vpc_security_group_ids = [
    module.http_internal.this_security_group_id,
    module.ssh_me.this_security_group_id
  ]

  tags = local.common_tags
}

