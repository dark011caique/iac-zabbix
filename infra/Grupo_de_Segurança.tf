resource "aws_security_group" "acesso_geral" {
  name        = "acesso_geral"
  description = "Grupo"
  
  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0" ] # Troque pelo seu IP ou utilize 0.0.0.0/0 para liberar para todos (não recomendado em produção)
    ipv6_cidr_blocks = [ "::/0" ]
  }

  ingress {
    description      = "Allow all inbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"    # Liberando todo o tráfego de entrada
    cidr_blocks      = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"    # Liberando todo o tráfego de saída
    cidr_blocks      = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  tags = {
    Name = "acesso_geral"
  }
}