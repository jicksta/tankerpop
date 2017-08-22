FROM clojure
MAINTAINER @jicksta
RUN wget -nv -O /tmp/gremlin-server.zip http://mirror.stjschools.org/public/apache/tinkerpop/3.2.5/apache-tinkerpop-gremlin-server-3.2.5-bin.zip && \
         unzip /tmp/gremlin-server.zip -d / && \
         rm /tmp/gremlin-server.zip && \
         mv /apache-tinkerpop-gremlin-server-3.2.5 /gremlin-server
ENTRYPOINT /gremlin-server/bin/gremlin-server.sh
WORKDIR /gremlin-server
EXPOSE 8182