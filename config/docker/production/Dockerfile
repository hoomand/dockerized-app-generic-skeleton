FROM phusion/passenger-ruby22:0.9.17
MAINTAINER Bijan Hoomand <hoomand@gmail.com>>

# set environment variables
ENV app_name=example

# use baseimage-docker’s init process
CMD ["/sbin/my_init"]

# add boot script
ADD boot.sh /etc/my_init.d/boot.sh

# setup logrotate
ADD logrotate /etc/logrotate.d/${app_name}

# add deploy keys
ADD .ssh/${app_name} /home/app/.ssh/id_rsa
ADD .ssh/${app_name}.pub /home/app/.ssh/id_rsa.pub
RUN chmod 600 /home/app/.ssh/id_rsa &&\
 chmod 644 /home/app/.ssh/id_rsa.pub &&\
 chown -R app:app /home/app/.ssh
RUN echo $(ssh-keyscan -H github.com) >> /home/app/.ssh/known_hosts &&\
  echo $(ssh-keyscan -H bitbucket.org) >> /home/app/.ssh/known_hosts &&\
  echo $(ssh-keyscan -H gitlab.com) >> /home/app/.ssh/known_hosts

# setup nginx
RUN rm -f /etc/service/nginx/down &&\
  rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/sites-enabled/${app_name}.conf
ADD nginx_env.conf /etc/nginx/main.d/env.conf

RUN /etc/my_init.d/boot.sh

# clean up when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
