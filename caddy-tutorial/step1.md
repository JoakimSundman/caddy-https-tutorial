# The Docker-compose file

The best way to describe docker compose is in the way the docker website describes it,
*Docker Compose is a tool for defining and running multi-container applications*. 
Simply put using this docker compose file we will be able to start up both the web application
server as well as the caddy server with one simple command `Docker compose up --build -d`.
You do not need to remember this command, we will get to it later.

![step1](./assets/step1.png)

Let's start by pulling up the docker compose file using the command `cat docker-compose.yml`.
Similar to JSON files you can see that Yaml files are have a tree structure.
The difference is yaml files use indents and not braces.

We have declared two services in this file `caddy` and `website`.
- Caddy: Is our caddy server and the `image` option tells docker to pull the docker image from
  the internet.
- Website: Is the seb service, this can ofcourse be another image but for
  this tutorial we will be building using the `Dockerfile`.

Furthermore, each of the two service has some options, 
since this is a caddy tutorial we will be focusing on the caddy options.
the most important options are as follows:
- ports: this options shows what ports on the docker container are exposed to the internet.
  A more observant reader can spot that there is a difference betweeen the ports in the two services,
  the reason is the website only exposes its port 80 to the internal docker network while caddy exposes the ports to the internet.
- volumes: the volumes are folders that are shared between the docker container and the host computer,
  this is usually needed for persistent files like configurations due to docker containers not saving states between restarts.
  
