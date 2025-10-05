Now that we have basic HTTPS set up in the Caddyfile we need to run and test if it works. 

To start everything run the command `docker-compose up --build -d`. This will build the docker containers and run them using docker compose. 

Once everything has started we need to test and see if the connection now is secure. To test the redirection run `curl -I http://localhost`.
To test the direct https run `curl -k https://localhost`