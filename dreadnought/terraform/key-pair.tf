resource "aws_key_pair" "dreadnought" {
    key_name = "dreadnought-key"
    public_key = "${file("ssh/dreadnought-key.pub")}"
}
