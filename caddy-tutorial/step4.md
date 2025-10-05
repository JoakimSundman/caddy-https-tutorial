Now that we have basic HTTPS set up in the Caddyfile we need to run and test if it works. First we need to move back in the folder structure to caddy. Run the command `cd ..`.

To start everything run the command `docker-compose up --build -d`. This will build the docker containers and run them using docker compose. 

Once everything has started we need to test and see if the connection now is secure. To test the redirection block run `curl -I http://localhost`.
To test the direct https block run `curl -k https://localhost`.