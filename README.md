# jenkins-php-composer
This container image includes php-cli, composer and some essential php extensions to build Laravel project, which is mainly designed to use in Jenkins build machine.

[![Docker Pulls](https://img.shields.io/docker/pulls/crossrt/jenkins-php-composer)](https://hub.docker.com/r/crossrt/jenkins-php-composer)

## What's in the image:
- alpine:3.24
- php of various versions
- composer:2.10
- php extensions: zip, exif, gd, sockets, soap

## Why create this image?
Now latest system like Ubuntu 22.04 LTS is troublesome to install old PHP version, but I need specific versions of PHP and Composer to build some old projects.

## To build the image
```
# building image for php8.4
docker build --platform linux/amd64 . -f versions/8.4/Dockerfile  -t crossrt/jenkins-php-composer:8.4-2.10

# pushing the image
docker push crossrt/jenkins-php-composer:8.4-2.10
```
## To use the image once
```
docker run --rm -it --entrypoint sh crossrt/jenkins-php-composer
```

## Image tags
The images will tagged based on php and composer version.
For example:
- image with php7.2 and composer 2 will tagged as `crossrt/jenkins-php-composer:7.2-2`
- image with php7.2 and composer 1 will tagged as `crossrt/jenkins-php-composer:7.2-1`

## Jenkinsfile example
```
pipeline {
    agent any

    stages {

        stage('Checkout code') {
            // checkout your code
        }

        stage('Install dependencies') {
            agent {
                docker {
                    image 'crossrt/jenkins-php-composer:7.2-2.5'
                    reuseNode true
                }
            }
          
            steps {
                script {
                    sh 'composer install'
                }
            }
        }

        stage('Build') {
            // continue your build here
        }

    }
}
```

Notes:
- `reuseNode` is important because we need to make sure the container is mounting the directory where the code checkout.
