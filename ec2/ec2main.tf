#Creating an Auto-scaling group of EC2 instances  
module "asg" {

  name = "wk22-instances"

  # Launch configuration
  lc_name = "wk22-instances-lc"

  image_id        = "ami-0b0dcb5067f052a63"
  instance_type   = "t2.micro"
  security_groups = ["sg-06811e76fd8d88ef0"]

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "autoscaling_wk22_terraform"
  vpc_zone_identifier       = ["subnet-0a21dbfc65340945e"]
  health_check_type         = "EC2"
  min_size                  = 2
  max_size                  = 5
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key_name                 = "lukey"
      propagate_at_launch = true
    },
  ]
}