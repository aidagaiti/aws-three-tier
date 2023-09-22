#create external load balancer type alb with target group 
resource "aws_lb" "external-alb" {
  name               = "external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.secgroups.id]
  subnets            = [aws_subnet.public1.id ,aws_subnet.public2.id , aws_subnet.public3.id ]
}

# create load balancer target group
resource "aws_lb_target_group" "target-alb" {
  name     = "target-alb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.project-vpc.id
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.instance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment3" {
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.instance3.id
  port             = 80
}

resource "aws_lb_listener" "external-elb-listener" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.target-alb.arn
}
}