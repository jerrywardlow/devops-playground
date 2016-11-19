.PHONY: all bake plan apply break

all: bake plan apply

bake:
	packer build packer.json

plan:
	terraform plan

apply:
	terraform apply

break:
	terraform destroy
