# Node.js
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt install -y nodejs git build-essential

# Clone NodeBB
cd /opt && git clone -b v1.x.x https://github.com/NodeBB/NodeBB.git nodebb
cd /opt/nodebb && npm install --production

# Inject configuration file
cp /web2/nodebb.conf /opt/nodebb/config.json

# Run NodeBB setup
./nodebb setup

# Install PM2
npm install -g pm2

# Start NodeBB
pm2 start /opt/nodebb/loader.js
