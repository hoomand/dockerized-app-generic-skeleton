# Generic Skeleton to dockerize any software project
A generic skeleton to add Docker file and related operations to start your app for any software project.

Regardless of what software project you are working on, you probably have a /config in your software project's root directory (hint: if you don't, create it!).
By adding this skeleton to that /config and re-writing the boot.sh init script, you would be able to build a docker image of your software. You can later on use this image and push it to Docker Hub, run it or even use it in AWS Elastic Beanstalk.

I got the idea from Nathan Hopkins, but fixed some problems with the boot.sh that broke my docker image; I have also replaced the sample app repo that he was using with the official sample Ruby app on Phusion Passenger repositories.

Nathan's page: https://github.com/hopsoft/relay/wiki/How-to-Deploy-Docker-apps-to-Elastic-Beanstalk

By cloning this repo, you would be able to build it and then run it as below:

```docker build -t YOUR_ORGANIZATION_NAME/YOUR_PROJECT_NAME config/docker/production```

```docker run -d -p 80:3000 YOUR_ORGANIZATION_NAME/YOUR_PROJECT_NAME```

Or if you just want to run the fully built version, you can use my ready image on Docker Hub below:
https://hub.docker.com/r/sirbijan/ruby-passenger/
