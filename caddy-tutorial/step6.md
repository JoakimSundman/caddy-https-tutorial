Now that we have configured the Caddyfile to allow on-demand TLS we can try restarting docker-compose. Start by goig nback in the folder structure by using the command ``cd .`.

Afterwards use `docker-compose down` to turn the services off. 

Then run `docker-compose up --build -d` as earlier. 