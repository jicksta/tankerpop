FROM clojure
MAINTAINER @jicksta
RUN wget -nv -O /tmp/gremlin-server.zip http://apache.arvixe.com/incubator/tinkerpop/3.1.0-incubating/apache-gremlin-server-3.1.0-incubating-bin.zip && \
         unzip /tmp/gremlin-server.zip -d / && \
         rm /tmp/gremlin-server.zip && \
         mv /apache-gremlin-server-3.1.0-incubating /gremlin-server
ENTRYPOINT /gremlin-server/bin/gremlin-server.sh
WORKDIR /gremlin-server
EXPOSE 8182
