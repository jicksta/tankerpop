FROM clojure
MAINTAINER @jicksta
RUN wget -nv -O /tmp/gremlin-console.zip http://mirrors.advancedhosters.com/apache/tinkerpop/3.2.5/apache-tinkerpop-gremlin-console-3.2.5-bin.zip && \
         unzip /tmp/gremlin-console.zip -d / && \
         rm /tmp/gremlin-console.zip && \
         mv /apache-tinkerpop-gremlin-console-3.2.5 /gremlin-console
ENTRYPOINT /gremlin-console/bin/gremlin.sh
WORKDIR /gremlin-console