FROM clojure
MAINTAINER @jicksta
RUN wget -nv -O /tmp/gremlin-console.zip http://apache.go-parts.com/incubator/tinkerpop/3.1.0-incubating/apache-gremlin-console-3.1.0-incubating-bin.zip && \
         unzip /tmp/gremlin-console.zip -d / && \
         rm /tmp/gremlin-console.zip && \
         mv /apache-gremlin-console-3.1.0-incubating /gremlin-console
ENTRYPOINT /gremlin-console/bin/gremlin.sh
WORKDIR /gremlin-console
