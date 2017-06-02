yum install java-1.8.0-openjdk

# Elasticsearch
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

echo '[elasticsearch-5.x]
name=Elasticsearch 5.x repo
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
' >> /etc/yum.repos.d/elasticsearch.repo

yum -y install elasticsearch

echo "network.host: localhost" >> /etc/elasticsearch/elasticsearch.yml

systemctl enable elasticsearch
systemctl start elasticsearch

# Kibana
yum -y install kibana

echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml

systemctl enable kibana
systemctl start kibana
