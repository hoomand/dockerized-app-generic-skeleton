# Docker skeleton for Your App!
A generic skeleton to add Docker file to any software project. This skeleton supports different environments (dev, test, prod, ...) and you can also include your SSH keys in related SSH folders to be included in the final Docker image (not very secure, but enables the containers to automatically checkout new commits).

Regardless of what software project you are working on, you probably have a *config* directory in your application's root directory (hint: if you don't, create it!).
By adding this skeleton to that *config* directory and re-writing the boot.sh init script, you would be able to build a docker image of your software. You can later on use this image and push it to Docker Hub, run it or even use it in AWS Elastic Beanstalk.

I got the idea from [Nathan Hopkins](https://github.com/hopsoft/relay/wiki/How-to-Deploy-Docker-apps-to-Elastic-Beanstalk), but fixed some problems with the boot.sh that broke my docker image; I have also replaced the sample app repo that he was using with the official sample Ruby app on Phusion Passenger repositories.

By cloning this repo, you would be able to build and then run it as below:

```docker build -t YOUR_ORGANIZATION_NAME/YOUR_PROJECT_NAME config/docker/production```

```docker run -d -p 80:3000 YOUR_ORGANIZATION_NAME/YOUR_PROJECT_NAME```

Or if you just want to run the fully built version, you can use [my already built image on Docker Hub](https://hub.docker.com/r/sirbijan/ruby-passenger/).


Interested to see how this sample image can be used to run inside an AWS Elastic Beanstalk environment? Checkout this [AWS Docker template](https://github.com/sirbijan/templates/blob/master/elasticbeanstalk/docker/ruby-passenger/Dockerrun.aws.json).
