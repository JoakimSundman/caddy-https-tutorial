# The Docker-compose file

The best way to describe docker compose is in the way the docker website describes it,
*Docker Compose is a tool for defining and running multi-container applications*. 
Simply put using this docker compose file we will be able to start up both the web application
server as well as the caddy server with one simple command `Docker compose up --build -d`.
You do not need to remember this command, we will get to it later.

![step1](./assets/step1.png)

Let's start by pulling up the docker compose file using the command `cat docker-compose.yml`.
Similar to JSON files you can see that Yaml files have a tree structure.
The difference is yaml files use indents and not braces.

We have declared two services in this file `caddy` and `website`.
- **Caddy:** Is our caddy server and the `image` option tells docker to pull the docker image from
  the internet.
- **Website:** Is the web service, this can ofcourse be another image but for
  this tutorial we will be building using the `Dockerfile`.

Furthermore, each of the two service has some options, 
since this is a caddy tutorial we will be focusing on the caddy options.
the options are as follows:
- **Restart:** the option is, as the name suggest, the restart policy for this particular container. The chosen option in this tutorial is `unless-stopped`
  which simply means that the service will restart itself, no matter the exit code, unless the service is stopped or removed.   
- **Ports:** this options shows what ports on the docker container are exposed to the internet.
  A more observant reader can spot that there is a difference betweeen the ports in the two services,
  the reason is the website only exposes its port 80 to the internal docker network while caddy exposes the ports to the internet.
- **Volumes:** the volumes are folders that are shared between the docker container and the host computer,
  this is usually needed for persistent files like configurations due to docker containers not saving states between restarts.
  Looking more closely you can see that there are two `volumes:` options within this docker-compose file.
  - The first one being the volumes under the `caddy:` service have two different "types" of volumes. 
    The first type defines the shared folder `$PWD/conf:/etc/caddy` this is a shared folder we will be
    actively modifying where the `Caddyfile` will be stored (more on that later). 
  - The second type are the `caddy_data:/data` and `caddy_config:/config` volumes.
    These appear twice, both under the caddy service and on their own outside the services tree structure.
    These two volumes work similiarly but they are handled by docker itself, this is where caddy stores things like keys and configurations
    that the user or admin do not handle manually and the bottom volumes option tells docker to create and persist these between restars, which is important for a service like caddy.
  
