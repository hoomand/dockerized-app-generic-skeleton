FROM phusion/passenger-full

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]



# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*