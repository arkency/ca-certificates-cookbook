include_recipe "ca-certificates::default"

execute "update-ca-certificates" do
  action :nothing
end

remote_file "/usr/local/share/ca-certificates/mozilla.crt" do
  source "http://curl.haxx.se/ca/cacert.pem"
  owner  "root"
  group  "root"
  mode   "644"
  action :create_if_missing
  notifies :run, "execute[update-ca-certificates]"
end
