yum install java-1.8.0-openjdk

rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

echo '[elasticsearch-5.x]
name=Elasticsearch 5.x repo
baseurl=http://packages.elastic.co/elasticsearch/5.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
' >> /etc/yum.repos.d/elasticsearch.repo

yum -y install elasticsearch

echo "network.host: localhost" >> /etc/elasticsearch/elasticsearch.yml

systemctl enable elasticsearch
systemctl start elasticsearch
