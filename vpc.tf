# Creating VPC
resource "aws_vpc" "project-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project-vpc"
  }
}

# 1 subnet public
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.101.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

# 2 subnet public
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.102.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
}

# 3 subnet public
resource "aws_subnet" "public3" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.103.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"

}


# 1 subnet private
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# 2 subnet private
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

# 3 subnet private
resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"

}



# Creating Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project-vpc.id
}


# Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route.id
}
# Associating Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.route.id
}

# Associating Route Table
resource "aws_route_table_association" "rt3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.route.id
}


# Creating NAT Gateway
resource "aws_nat_gateway" "NG" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private1.id
}