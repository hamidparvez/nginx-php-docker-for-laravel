# NGINX & PHP in the Docker for Laravel

Built in Queue Worker & Scheduler Containers.

#### Downloading & configure the project
 - Git Clone
 - sudo docker-compose build
 - sudo docker-compose up

#### Installing laravel
- sudo docker exec larave-app /bin/bash -c "cd /public_html/ && composer create-project --prefer-dist laravel/laravel laravel"

## Note

 - You can change the path /public_html/ to anything you want just change the path in the Environments & path.
 - Change the server name in the docker/vhost.conf according to your needs.

Your suggestion or PR will be highly appriciated.
