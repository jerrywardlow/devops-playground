directory '/tmp/messages' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/tmp/messages/motd' do
  content 'Hello, Chef!'
end
