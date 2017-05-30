# Vagrantfile reference
# The following file includes options which contradict one another
# and as such, this Vagrantfile is invalid. Dismantle and re-use
# components as you see fit.

# Abort, this file isn't valid!
abort("This Vagrantfile is not ready for use!")

# Specifiy which Vagrant box to use (https://atlas.hashicorp.com/boxes/search)
vagrant_box = "ubuntu/xenial64"

# List of nodes to create
nodes = %w(
    node1
    node2
    database
)

# Beginning of Vagrant configuration

Vagrant.configure(2) do |config|

  # If the vagrant-hostmanager plugin is installed...
  if Vagrant.has_plugin?("vagrant-hostmanager")
    # Enable vagrant-hostmanager
    config.hostmanager.enabled = true
    # Manage the hosts host file
    config.hostmanager.manage_host = true
  else
    # ...otherwise, abort.
    abort("Vagrant Hostmanager required")
  end

  # If the vagrant-vbguest plugin is installed...
  if Vagrant.has_plugin?("vagrant-vbguest")
    # Disable the plugin
    config.vbguest.auto_update = false
  end

  # If the Vagrant version is X...
  if Vagrant::VERSION == '1.8.2'
    # ...do something
    abort("This version of Vagrant does not work, please upgrade!")
  end

  # Actual VM configuration follows!

  # For each node in the nodes list...
  nodes.each_with_index do |node, index|
    # ...configure the node as follows:
    config.vm.define node do |nodeconf|

      # Set the hostname of the node
      nodeconf.vm.hostname = node

      # Tell Vagrant what box to use
      nodeconf.vm.box = vagrant_box

      # Assign an IP address within a private network
      nodeconf.vm.network :private_network, ip: "192.168.33.12#{index}"

      # Request an IP from public network DHCP (aka bridged networking)
      nodeconf.vm.network :public_network

      # Disable the default Vagrant shared folder
      nodeconf.vm.synced_folder ".", "/vagrant", disabled: true

      # Sync a specific folder named after the node
      nodeconf.vm.synced_folder "path/to/#{node}", "/#{node}"

      # Run a shell provisioner named after the node
      nodeconf.vm.provision :shell, path: "path/#{node}.sh"

      # Run a shell provisioner with args
      nodeconf.vm.provision :shell, path: "scripts/common.sh", args: [user, key]

      # Run a shell one-liner (installing Python for example)
      nodeconf.vm.provision :shell, inline: "apt update && apt install -y python-minimal"

      # Provision with an Ansible playbook named after the node
      nodeconf.vm.provision :ansible do |a|
        a.playbook = "#{node}.yml"
      end

      # Provision with Chef
      nodeconf.vm.provision :chef_zero do |chef|
        # Tell Chef what environment to use
        chef.environment        = "development"
        # Specify Chef paths
        chef.cookbooks_path     = "chef/cookbooks"
        chef.data_bags_path     = "chef/data_bags"
        chef.environments_path  = "chef/environments"
        chef.nodes_path         = "chef/nodes"
        chef.roles_path         = "chef/roles"
        # Add Chef roles
        chef.add_role "base"
        chef.add_role node
      end

      # Do something to a specific node
      if node == "database"
        # Assign more hostmanager entries
        nodeconf.hostmanager.aliases = %w(data.example.com database.local)
      end

      # Do VirtualBox things
      nodeconf.vm.provider :virtualbox do |vbox|
        # Assign a name to the VM
        vbox.name   = "vagrant.#{node}"
        # Set the amount of available memory
        vbox.memory = 512
        # Limit the number of CPUs
        vbox.cpus = 1
      end
    end
  end
end
