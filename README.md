![TankerPop](http://i.imgur.com/10sSYOA.png)

TankerPop: TinkerPop v3 + Docker Compose
========================================

Off-the-shelf graph database laboratory
---------------------------------------

At the moment TankerPop includes...

 * [Gremlin Server](http://www.tinkerpop.com/docs/3.0.0.M6/#gremlin-server)
 * [Gremlin Console](http://www.tinkerpop.com/docs/3.0.0.M6/#gremlin-console)

...but the following features may be built soon:

 * Automatic [Gephi plugin support](http://www.tinkerpop.com/docs/3.0.0.M6/#gephi-plugin) for interactive graph visualization
 * Support for [JavaScript Gremlin queries](http://www.tinkerpop.com/docs/3.0.0.M6/#_connecting_via_rest) in the REST API (using the Nashon ScriptEngine)
 * Clojure-based Gremlin script runtime and REPL
 * TankerpopTest, a Gremlin server designed for test suites
 * Benchmarking tools for testing performance of queries
 * Full Neo4j compatibility
 * Web-based Gremlin REPL with D3-based viewer
 * Titanium+Clojure base image

If you'd like to work on any of these, post an Issue and let's talk about it.

Setting up Docker
-----------------

This project, at the moment, assumes you know how to use Docker and Docker Compose. If you use Mac OS X, it's recommended you use [the Docker Toolbox](https://www.docker.com/products/docker-toolbox).

All images are based on `library/clojure` (which is a descendant of `library/java`).


Starting Gremlin Console with Gremlin Server
--------------------------------------------

To get the IP address of your Gremlin Server container, run the following command:

    docker-compose run --entrypoint=env console | grep SERVER_PORT_8182_TCP_ADDR=

This will output a value similar to this:

    SERVER_PORT_8182_TCP_ADDR=172.17.0.3

This IP address is what we must put in the YAML file that Gremlin Console will use to establish its
connection to the server.

The file `gremlin-console/remote.yaml` is automatically .gitignored, so you can conveniently
copy a config file from `gremlin-console/conf` to `gremlin-console/remote.yaml`, for example:

    cp gremlin-console/conf/remote.yaml gremlin-console/remote.yaml

Next, edit the `gremlin-console/remote.yaml` file's `hosts` value to refer to the IP address
above instead of `localhost`:

```yml
# gremlin-console/remote.yaml
hosts: ["172.17.0.3"]
port: 8182
serializer: { className: org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV1d0, config: { serializeResultToString: true }}
```

There are other remote configurations in the `conf/` directory but `conf/remote.yaml` should suffice
for experimentation.

Now you are ready to connect the console to the server:

    $ docker-compose run console
    Jan 31, 2016 3:14:40 AM java.util.prefs.FileSystemPreferences$1 run
    INFO: Created user preferences directory.

             \,,,/
             (o o)
    -----oOOo-(3)-oOOo-----
    plugin activated: tinkerpop.server
    plugin activated: tinkerpop.utilities
    plugin activated: tinkerpop.tinkergraph
    gremlin> // This is the Gremlin console. Let's connect it to the server now:
    gremlin> :remote connect tinkerpop.server remote.yaml


The REPL is a Groovy-based console but the `:remote` command is an instruction to the Gremlin console
directly, bypassing the Groovy interpreter. This command connects your console to the server.

Now you're ready to start tinkering!

    gremlin> graph = TinkerFactory.createModern()
    ==>tinkergraph[vertices:6 edges:6]
    gremlin> g = graph.traversal()
    ==>graphtraversalsource[tinkergraph[vertices:6 edges:14], standard]
    gremlin> g.V().values("name")
    ==>marko
    ==>stephen
    ==>matthias
    ==>daniel
    ==>gremlin
    ==>tinkergraph
    gremlin>

A good next-step from here might be the [Getting Started Workout Tutorial](https://tinkerpop.apache.org/docs/3.1.0-incubating/tutorials-getting-started.html) or the fantastic [TinkerPop documentation](https://tinkerpop.apache.org/docs/3.1.0-incubating/).
