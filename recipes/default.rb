package "ca-certificates" do
  action :upgrade
end

file "/etc/profile.d/ca-certificates.sh" do
  content "export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt"
  owner   "root"
  group   "root"
  mode    "644"
end
