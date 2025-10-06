Now that we have basic HTTPS set up in the Caddyfile we need to run and test if it works. First we need to move back in the folder structure to caddy. Run the command `cd ..`.

To start everything run the command `docker-compose up --build -d`. This will build the docker containers and run them using docker compose.

**some clarifications on the command:**
- The basic command is `docker-compose up` which runs the docker compose file and starts up the required containers.
- The flag `--build` makes sure the images (in this case the website) are built *before* starting up the containers.
- The flad `-d` or `--detach`  starts the containers in the background, meaning you have continued use of the terminal,
  This command is not necessary but helps for this demonstration.

Once everything has started we need to test and see if the connection now is secure. To test the redirection block run `curl -I http://localhost`.
To test the direct https block run `curl -k https://localhost`.
