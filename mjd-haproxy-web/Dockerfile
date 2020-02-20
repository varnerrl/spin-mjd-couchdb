#
#
#     Update standard haproxy image for use by MJD.
#     This version just updates the proxy file
#     Robert Varner, ORNL
#-------------------------------------------------------------------------------
FROM haproxy:2.1.3
LABEL maintainer "varnerrl@ornl.gov"
#
# Add a tool for debugging
#
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y apt-utils && apt-get install -y net-tools && apt-get install -y procps
##
# Ports used to access haproxy - 
EXPOSE 80
#
# Default location for operations
WORKDIR /
#
ADD haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
#
