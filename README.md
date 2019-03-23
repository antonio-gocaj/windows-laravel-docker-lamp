# LAMP enviment for Laravel Apps with Docker.

Minimal setup to run Laravel apps locally.

## Getting Started

This setup is tested for Windows 10 Pro.

Download link: [Docker for Windows 10 Pro installer](https://hub.docker.com/editions/community/docker-ce-desktop-windows) 

Check if Hyper-V is enabled and installation instructions. [Here.](https://docs.docker.com/docker-for-windows/install/)

---
For Windows 10 Home-Edition you need: 

- Docker-Toolbox. [Link](https://docs.docker.com/toolbox/toolbox_install_windows/)
- Virtual-Box. To create virtual machines.
 [Link](https://www.virtualbox.org/).
---

This Docker environment comes with:
- Apache 2
- PHP 7.1.8 (Laravel php extensions: OpenSSL,PDO,Mbstring,Tokenizer,XML PHP Extension,Ctype,
JSON,
BCMath. And composer.).
- MYSQL 5.7

## Installing

Check Docker installation by typing on a command line: ```docker -v```. If you see a similar message "Docker version 18.09.2, build xxxxxx" means Docker is good to go.

Clone this repository into a newly created directory. 

e.g.: (Win) C:\Users\LaraProjects.

Enter the directory by using one of command lines you like. cmd, git-bash, powershell, etc. Your choice. 

And type:
```
git clone https://github.com/antonio-gocaj/windows-laravel-docker-lamp.git .
```

Then:
```
docker-compose build
```
This command starts execution from 'docker-compose.yml' file. If you open it, you will see a couple of YML configs that run Docker commands like container naming, volume bindings etc. Is a more user-friendly command runner.

It will take a couple of seconds or minutes depending on your network speed to install the images from Docker hub. [Link](https://hub.docker.com/).

After that run:

```
docker-compose up
```
Now the containers with start running and local-webserver listening on port: 80.

Not done yet.

## Usage

On your operating system hosts file place these localhost domains:

Windows (C:\Windows\System32\drivers\etc\hosts)

127.0.0.1 maximus.com

127.0.0.1 testlaravelapp.com

If you check the 'vhosts.conf' file you will see the virtual hosts configs.
Binding domain name with projects default directory inside docker containers.
Same as below:

```
<VirtualHost *:80>
    #simple html project. domain configured in hosts file
    ServerName maximus.com
    DocumentRoot "/var/www/maximus"

    <Directory "/var/www/maximus">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<VirtualHost *:80>
    #laravel project. domain configured in hosts file
    ServerName testlaravelapp.com
    DocumentRoot "/var/www/testlaravelapp/public"

    <Directory "/var/www/testlaravelapp/public">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
---
Your Laravel projects folder structure should look like:

LaraProjects

- maximus

- laraveltestapp
---
Open your browser and check if everything is running:

[http://maximus.com](http://maximus.com)

[http://testlaravelapp.com](http://testlaravelapp.com)

phpmyadmin [http://localhost:8000](http://localhost:8000)

---

