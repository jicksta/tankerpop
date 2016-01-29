FROM java
MAINTAINER @jicksta
COPY apache-gremlin-server-3.1.0-incubating /gremlin-server
ENTRYPOINT /gremlin-server/bin/gremlin-server.sh
WORKDIR /gremlin-server
EXPOSE 8182

# http://apache.arvixe.com/incubator/tinkerpop/3.1.0-incubating/apache-gremlin-server-3.1.0-incubating-bin.zip
