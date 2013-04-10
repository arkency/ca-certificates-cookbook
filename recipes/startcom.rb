include_recipe "ca-certificates::default"

execute "update-ca-certificates" do
  action :nothing
end

remote_file "/usr/local/share/ca-certificates/sub.class1.server.ca.crt" do
  source "https://www.startssl.com/certs/sub.class1.client.ca.pem"
  owner  "root"
  group  "root"
  mode   "644"
  action :create_if_missing
  notifies :run, "execute[update-ca-certificates]"
end
