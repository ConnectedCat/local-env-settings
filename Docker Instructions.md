# DOCKER SETUP
## Initialization:
### Step 1: 
Download and install the Docker CE (community edition) app:
[https://www.docker.com/products/overview](https://www.docker.com/products/overview)
This will include the CLI you’ll need to interact with the images and containers.

### Step 2:
Get the images necessary to run the environment.
The standard apps from the Docker Hub:
```bash
$ docker pull mongo
```
```bash
$ docker pull mysql
```
```bash
$ docker pull mongo-express
``` 
(optional, if you’re looking for a mongo management GUI)
```bash
$ docker pull phpmyadmin/phpmyadmin
``` 
(optional, if you’re looking for a MySQL management GUI)
```bash
$ docker pull php:apache
``` 
(or whatever)  

This downloads images onto your machine. Those images can be ran as containers, i.e. functional applications in the system. One could think of images as pre-compiled code and containers as compiled apps.

### Step 3:
Make sure your apache and mongo servers on the local machine are not running:
```bash
$ sudo apachectl stop
```
Run images to ‘compile’ them into containers and start them up.

`-p` option will forward the traffic from the local post to the port on that container. 

`--name` option will assign a specific name to a container. This is useful when containers need to be ‘linked’ together so that they can pass traffic amongst themselves. They can be linked by name, as seen in the last command. 

`-v` option will mount a folder from the host machine in the specified location in a container. This allows us to mount the source code repository so that it’s served upon browser requests.
 
```bash
$ docker run --name mongo-server -d -p 27017:27017 mongo
```
```bash
$ docker run --name mongo-express --link mongo-server:mongo-server -p 8081:8081 mongo-express
``` 
```bash
$ docker run --name mysql-server -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -d mysql
```
```bash
$ docker run --name myadmin -d --link mysql-server:db -p 8080:80 phpmyadmin/phpmyadmin
```
```bash
$ docker run -it --name app-server --link mongo-server:mongo-server --link mysql-server:mysql-server -p 80:80 -v /local/path/to/src:/var/www/html php:latest
```

This places your /src folder in http://localhost/ location and PHPMyAdmin at http://localhost:8080/

Note: it you’re running a generic PHP image from Docker as a container with apache, e.g. php:5.6.30-apache, make sure to exclude `-it` option, for more details see:
[https://github.com/docker-library/php/issues/64](https://github.com/docker-library/php/issues/64)
In this case there is an option to run
```bash
$ docker exec -it CONTAINER_ID_OR_NAME /bin/bash
```
To enable interactivity
 
### Configuration:
MongoDB:
```php
'host' => 'mongo-server'
```

MySQL:
```php
'host' => 'mysql-server'
```

### Running and maintenance:
Check on your containers:
To check on the existing containers in the machine run:
$ docker ps
$ docker ps -a
-a option will show all containers, both running and stopped.

Start a stopped container:carb
$ docker start container_name_or_id
Once a container is created using docker run command it will retain all the options passed during the initialization.

### Help:
```bash
$ docker --help
```
Will list all the available docker options


A great 3rd party tool for Docker:
[https://getcaptain.co/](https://getcaptain.co/)
