Since we have created our Caddyfile we now need to fill it with our configuration. We will add two main blocks, similarily to the docker-compose.yml file, the Caddyfile uses an indented structure. 

## The HTTP redirect block 

We first define how to handle any HTTP request on port 80. To add this to the Caddyfile we can use the command:

```
echo "localhost:80 { 
redir https://localhost{uri} 
}
" > Caddyfile
```

## The HTTPS Reverse prozy block 

This is the main block that handles secure traffic and sends it to your web application. To write this to the Caddyfile without overwriting our earlier block use this command:

```
echo "localhost:443 {
  tls internal
  reverse_proxy website:80
}" >> Caddyfile
```

After running both commands your Caddyfile should look like this: 

```
localhost:80 {
  redir https://localhost{uri}
}

localhost:443 {
  tls internal
  reverse_proxy website:80
}

```

To check this run the command `cat Caddyfile`.