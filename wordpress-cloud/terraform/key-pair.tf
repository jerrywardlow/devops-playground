resource "aws_key_pair" "wordpress" {
    key_name = "wordpress-key"
    public_key = "${file("ssh/wordpress-key.pub")}"
}
