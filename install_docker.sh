#! /bin/bash
set +u
if [ -z "$1" ]; then
  read -s -p "[sudo] password for $USER: "$'\n' pw
  while ! echo $pw | sudo -Sk true 2>/dev/null; do
    echo "Sorry, try again."
    read -s -p "[sudo] password for $USER: "$'\n' pw
  done
else
  pw="$1"
  if ! echo $pw | sudo -Sk true 2>/dev/null; then
    exit 1
  fi
fi
set -u

## docker install
 echo "==============Start docker install=============="
if ! command_exists docker; then
  # Add Docker's official GPG key:
  echo $pw | sudo -S apt-get -y update
  echo $pw | sudo -S apt-get -y install curl
  echo $pw | sudo -S apt-get -y install ca-certificates curl gnupg
  echo $pw | sudo -S install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo $pw | sudo -S chmod a+r /etc/apt/keyrings/docker.gpg

  # Add the repository to Apt sources:
  echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  echo $pw | sudo -S apt-get -y update

  echo $pw | sudo -S apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  echo $pw | sudo -S systemctl enable --now docker
  echo $pw | sudo -S groupadd docker
  echo $pw | sudo -S usermod -aG docker -g 1001 $USER
else
  echo $pw | sudo -S docker stop $(echo $pw | sudo -S docker ps -q)
fi

## turn off powersaving
echo "==============turn off powersaving=============="
gsettings set org.gnome.desktop.session idle-delay 0
echo "turn off powersaving ok"

echo "==============Start python install=============="
# Check if Python is installed
if command -v python3 &>/dev/null; then
    echo "Python is already installed."
else
    # Install Python
    sudo apt update
    sudo apt install -y python3
    echo "Python has been installed."
fi
