USERNAME=$1
SSH_PUB_KEY=$2

# Create new user and assign public SSH key
useradd -m -s /bin/bash -G sudo $USERNAME
mkdir -p /home/$USERNAME/.ssh/
echo $SSH_PUB_KEY >> /home/$USERNAME/.ssh/authorized_keys

# Force ownership of users home directory, because it's just easier that way
chown -R $USERNAME:$USERNAME /home/$USERNAME
chmod 700 /home/$USERNAME /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys

# Enable passwordless sudo
echo "$USERNAME ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
