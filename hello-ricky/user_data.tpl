#cloud-config

users:
  - name: deploy
    gecos: Deploy User
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    shell: /bin/bash
    lock-passwd: false
    passwd: $6$rounds=1337$porcupine$x6RVcbJvcWjLrIfEudQ/uJ.L54FP6Go7A2x.ytAvfzMyk0E6lzi0coQfVCCWsdcgj85Gc/fmvQFu.VoLCs9/w0 # helloricky
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuEuuSr006K3/+ITdGX0wbgehfY7xzo3OhPyrispqWgeuXTVG3GGGBuvSrv80V/waAB9jkc5hZv+wr0iDnF+F5HMmfAJbJPsXOcAOamFYHVcjAPxmlhrXC8xUKu1GucQ2/1VX7gjzdEvZyv9ReJgAoeVS5PE2E5oM0BDpE29iAX+1MsNFzpB06YnP2x5eHI47ZsD4qTW3SQmqYUPs6gSbTZdyUKsrDNEtPZ6blS3iNHq6kP0xIT/SgtYYIn2FfJXg0+FgFw9Rvy/78TA2j+TG1klBR53OmSg9lWDSplKIg8SNoJwmhkkSM0oSGKb7npTTi/S9xzwjyZRNmFUYZ1471 jerry@EXECUTOR
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEvaPzcWvKUM7dMLoXB6svED9VhQhY/CRBfBsmZ4pJ6etAEiTSGR9amm/H3ywKUVMFQeEmOpaC6FG7jXULhrJCJadYy5ymWihNKqgISmWF1VyQXvXKU8ehZQ/qo1E+u2Y5iK0hcbXcw0/gVZkvKBoWmM9a/hzMpUAnLa+LuQPgacGY399MPcG+gUV0i6gODdWLyXtUF1Ssk2pBJyUCD2/xcUagrDCvm3/Dx3CdNvBwACmr2C6/sq9q/pFohcPSQ7Sk4Ljvj9J/J1t4q0TN3ozKziJrM4kSsh2ypIUHV0KrO9xCYye87vwDmz2oxbeS27Rnrby491wUxNdPcQwgxRYn ricky@box

packages:
  - git
  - htop
  - tmux
  - tree
  - unzip
  - vim

runcmd:
  - wget https://github.com/jerrywardlow/dotfiles/archive/master.zip -P /home/deploy/
  - unzip /home/deploy/master.zip -d /home/deploy
  - chown -R deploy:deploy /home/deploy/
  - sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
  - sed -i -e '/^PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
  - echo "\nAllowUsers deploy" >> /etc/ssh/sshd_config
  - service ssh restart
