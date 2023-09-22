#ASG with Launch Template 3 public subnet 
resource "aws_autoscaling_group" "Three-tier-asg" {
    name = "Three-tier-asg"
  vpc_zone_identifier  = [aws_subnet.public1.id, aws_subnet.public2.id, aws_subnet.public3.id]
  desired_capacity   = 1
  max_size           = 99
  min_size           = 1
 launch_template {
    id      = aws_launch_template.launch_template.id
}
}
# created launch template for asg 
resource "aws_launch_template" "launch_template" {
  name_prefix   = "launch_template"
  image_id      = "ami-03a6eaae9938c858c"
  instance_type = "t2.medium"
  user_data     = "${base64encode("data.sh")}"
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}


