module "dev_vpc_1" {
  source             = "../modules/network"
  vpc_cidr           = "10.90.0.0/16"
  vpc_name           = "dev_vpc_1"
  environment        = var.env
  public_cidr_block  = ["10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24", "10.90.3.0/24", "10.90.2.0/24", "10.90.1.0/24"]
  private_cidr_block = ["10.90.10.0/24", "10.90.20.0/24", "10.90.30.0/24", "10.90.30.0/24", "10.90.20.0/24", "10.90.10.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b"]
  #natgw_id           = module.dev_natgw_1.natgw_id
  owner = "India-Dev-Team"
}

module "dev_sg_1" {
  source        = "../modules/sg"
  vpc_name      = module.dev_vpc_1.vpc_name
  vpc_id        = module.dev_vpc_1.vpc_id
  environment   = module.dev_vpc_1.environment
  service_ports = ["80", "443", "445", "8080", "22", "3389", "80", "443", "445", "8080", "22", "3389"]
}