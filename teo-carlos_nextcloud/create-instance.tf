# create-instance.tf
 
resource "aws_key_pair" "keypair" {
    #key_name    = "TerraformAnsible-Keypair"
    key_name    = var.key_pair
    #public_key  = "joc-key-pair.pub"
    public_key  = "${file("joc-key-pair.pub")}"
}


resource "aws_instance" "instance" {
  ami                         = var.instance_ami
#  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  #key_name                    = var.key_pair
  
  user_data = <<EOL
#!/bin/bash
yum install php httpd  php-zip  php-gd php-fpm -y 2>> /home/ec2-user/log_errores.txt
systemctl start httpd 2>> /home/ec2-user/log_errores.txt
systemctl start php-fpm 2>> /home/ec2-user/log_errores.txt
yum install php-mysqlnd -y 2>> /home/ec2-user/log_errores.txt
wget https://download.nextcloud.com/server/releases/latest.zip 2>> /home/ec2-user/log_errores.txt
unzip latest.zip 2>> /home/ec2-user/log_errores.txt
mv nextcloud /var/www/html/ 2>> /home/ec2-user/log_errores.txt
chown -R apache:apache /var/www/html/nextcloud/ 2>> /home/ec2-user/log_errores.txt
chmod -R 755 /var/www/html/nextcloud/ 2>> /home/ec2-user/log_errores.txt
yum search mariadb 2>> /home/ec2-user/log_errores.txt
yum install mariadb105-server.x86_64 -y 2>> /home/ec2-user/log_errores.txt
systemctl start mariadb 2>> /home/ec2-user/log_errores.txt
EOL
  
  key_name                    = aws_key_pair.keypair.key_name
  iam_instance_profile        = data.aws_iam_instance_profile.existing_role.role_name 
#  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    volume_size           = var.root_device_size
#    volume_type           = var.root_device_type
#  }
  
  tags = {
    "Owner"               = var.owner
    "Name"                = "${var.owner}-nextcloud"
    "KeepInstanceRunning" = "true"
  }
}



resource "aws_instance" "instancia-2" {
  ami                         = var.instance_ami
#  availability_zone           = "${var.aws_region}${var.aws_region_az}"
  instance_type               = var.instance_type
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet-privada.id
  #key_name                    = var.key_pair

  user_data = <<EOL
#!/bin/bash
yum install php-mysqlnd -y 2>> /home/ec2-user/log_errores.txt
yum search mariadb 2>> /home/ec2-user/log_errores.txt
yum install mariadb105-server.x86_64 -y 2>> /home/ec2-user/log_errores.txt
systemctl start mariadb 2>> /home/ec2-user/log_errores.txt
mysql --user="root" --password="root" --execute="create user 'diego'@'%' identified by 'ripeadmin';"
mysql --user="root" --password="root" --execute="grant all on *.* to 'diego'@'%'; flush privileges;"
mysql --user="root" --password="root" --execute="create database orange;"
EOL
  key_name                    = aws_key_pair.keypair.key_name
 
#  root_block_device {
#    delete_on_termination = true
#    encrypted             = false
#    volume_size           = var.root_device_size
#    volume_type           = var.root_device_type
#  }
 
  tags = {
    "Owner"               = var.owner
    "Name"                = "instancia_sql"
    "KeepInstanceRunning" = "true"
  }
}
