# creates a custom HTTP header response with Puppet.
exec { 'command':
  command  => 'apt-get -y update;
  apt-get -y install nginx;
  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
  sudo rm /etc/nginx/sites-enabled/default;
  sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default;
  service nginx restart',
  provider => shell,
}
