 #!/usr/bin/env bash

echo -e "\033[1mProvisioning Machine...\033[0m"
apt-get update >/dev/null 2>&1
apt-get install -y curl >/dev/null 2>&1
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >/dev/null 2>&1
curl -sSL https://get.rvm.io | bash -s stable --ruby >/dev/null 2>&1