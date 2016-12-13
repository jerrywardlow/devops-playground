### Ansible

Playbook and dynamic inventory for post-deploy configuration of staging and production web servers.

Note that most of the functionality of these playbooks can be accomplished using Packer, Terraform, and native AWS products (specifically Route 53), but this seemed like a great way to add to the complexity of the project and gain experience using Ansible in a realistic environment.

**Deprecated in favor of using user-data script during spin up of EC2 instance. Script alters Wordpress core file wp-config.php with the address of the RDS instance.**
