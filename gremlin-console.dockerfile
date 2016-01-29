FROM java
MAINTAINER @jicksta
COPY apache-gremlin-console-3.1.0-incubating /gremlin-console
ENTRYPOINT /gremlin-console/bin/gremlin.sh
WORKDIR /gremlin-console

#http://apache.go-parts.com/incubator/tinkerpop/3.1.0-incubating/apache-gremlin-console-3.1.0-incubating-bin.zip
