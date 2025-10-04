Since we have created our Caddyfile we now need to fill it with our configuration. We will add two main blocks, similarily to the docker-compose.yml file, the Caddyfile uses an indented structure. 

## The HTTP redirect block 

We first define how to handle any HTTP request on port 80. To define this use:

`echo "localhost:80 { 
redir https://localhost{uri} 
} > Caddyfile`


