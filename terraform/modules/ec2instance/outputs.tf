// Copyright (C) 2022 by Klimenko Maxim Sergeevich

output "public_ip" {
  value = aws_instance.server[count.index].public_ip   
}