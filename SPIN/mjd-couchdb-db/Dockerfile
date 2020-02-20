#
#     Dockerfile to build unix system with CLHEP, CERN root and GEANT4
#
#     Robert Varner, ORNL, based on Dave Tedeschi's debian file
#     Add CouchDB for use of Mac OS X
#-------------------------------------------------------------------------------
FROM couchdb:2.3
LABEL maintainer "varnerrl@ornl.gov"
#
#  Add debugging tools
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y apt-utils && apt-get install -y net-tools && apt-get install -y procps

##
# Ports used to access couchdb
#EXPOSE 5984
#
# Default location for operations
WORKDIR /opt/couchdb
#
ADD --chown=couchdb:couchdb local.ini etc/local.ini
ADD --chown=couchdb:couchdb couchdb bin/couchdb
ADD --chown=couchdb:couchdb couchdb.cmd bin/couchdb.cmd
ADD --chown=couchdb:couchdb vm.args etc/vm.args
#
VOLUME data
# Define what should start by default
ENTRYPOINT ["/opt/couchdb/bin/couchdb"]
