
## Key Pair Resource ####

resource "aws_key_pair" "f5vdss" {
  key_name   = var.key_name
  public_key = var.public_key
}
