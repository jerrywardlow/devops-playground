.PHONY: all bake plan apply break

all: bake plan apply

bake:
	(cd packer/ && packer build packer.json)

plan:
	(cd terraform/ && terraform plan)

apply:
	(cd terraform/ && terraform apply)

break:
	(cd terraform/ && terraform destroy)
