#!/bin/bash

set -e

echo "Starting installation process..." > /var/log/user_data.log

sudo apt update -y
sudo apt upgrade -y

sudo apt install nginx git npm -y

curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

if [ ! -d "/home/ubuntu/fitness-hero-V2" ]; then
  git clone https://github.com/alvo254/fitness-hero-V2
  cd fitness-hero-V2
  npm install
  npm run build
else
  echo "App already cloned, updating..."
  cd /home/ubuntu/fitness-hero-V2
  git pull
  npm install
  npm run build
fi

cat > /home/ubuntu/configure_nginx.sh <<EOF

PUBLIC_IP=\$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

sudo bash -c "cat > /etc/nginx/sites-available/default <<EEOF
server {
    listen 80;
    server_name \$PUBLIC_IP;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EEOF"

sudo systemctl restart nginx
EOF

chmod +x /home/ubuntu/configure_nginx.sh

(crontab -l 2>/dev/null; echo "@reboot /home/ubuntu/configure_nginx.sh") | crontab -/home/ubuntu/configure_nginx.sh

sudo ufw allow 'Nginx Full'

sudo npm install -g pm2

cd /home/ubuntu/fitness-hero-V2

if pm2 list | grep -q 'fitness-hero-V2'; then
  pm2 restart fitness-hero-V2
else
  pm2 start npm --name "fitness-hero-V2" -- start
fi

pm2 startup
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save

echo "React app deployed and Nginx configuration script set up successfully!" >> /var/log/user_data.log