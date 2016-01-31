![TankerPop](http://i.imgur.com/YZGgfWe.png)

TankerPop: TinkerPop toolbelt built atop Docker Compose
=======================================================

Build this project with Docker Compose and get a fully functional TinkerPop system to experiment with.

Includes...

 * Gremlin Server
 * Gremlin Console

Planned:

 * Clojure-based Gremlin script runtime and REPL
 * Titanium+Clojure base image
 * Gremlin Test Server, a Gremlin server for your test suite

All images are based on `library/clojure` (which is a descendant of `library/java`).


Gremlin queries
---------------

Start a console REPL with `docker-compose run console`. The console image
is linked to the server so Docker Compose will start a server as well and
set environment variables in the `console` container containing information
about how it can connect to the server.

    System.getenv()["SERVER_PORT_8182_TCP_ADDR"]
    :remote connect tinkerpop.server conf/remote.yaml
