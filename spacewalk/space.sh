#! /usr/bin/bash

# RHEL/CentOS 7

# Spacewalk repo
rpm -U http://yum.spacewalkproject.org/2.6/RHEL/7/x86_64/spacewalk-repo-2.6-0.el7.noarch.rpm

# JPackage repo
cat > /etc/yum.repos.d/jpackage-generic.repo << EOF
[jpackage-generic]
name=JPackage generic
#baseurl=http://mirrors.dotsrc.org/jpackage/5.0/generic/free/
mirrorlist=http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=5.0
enabled=1
gpgcheck=1
gpgkey=http://www.jpackage.org/jpackage.asc
EOF

# Spacewalk answers
cat > /root/spacewalk_answers.txt << EOF
admin-email = admin@localhost
ssl-set-org = Vagrant Spacebox
ssl-set-org-unit = spacebox
ssl-set-city = PDX
ssl-set-state = OR
ssl-set-country = US
ssl-password = spacewalk
ssl-set-email = admin@localhost
ssl-config-sslvhost = Y
db-backend=postgresql
db-name=spaceboxdb
db-user=spacedbuser
db-password=spacedbpw
db-host=localhost
db-port=5432
enable-tftp=Y
EOF

# EPEL repo
rpm -U https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install -y spacewalk-setup-postgresql

yum install -y spacewalk-postgresql

spacewalk-setup --answer-file=/root/spacewalk_answers.txt
