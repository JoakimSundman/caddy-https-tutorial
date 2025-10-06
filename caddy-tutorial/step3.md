Since we have created our Caddyfile we now need to fill it with our configuration. We will add two main blocks, as opposed to the docker-compose.yml file, the Caddyfile uses braces instead of indents this should be familiar to most people who have some programming knowledge.

**Important Note:** since killercoda doesn't allow for website hosting (for obvious reasons) and this being a student project with no financing we will be providing instructions for both how to set caddy up on localhost (for testing and demonstration purposes) but also provide instructions on how this would look in a very basic live environment with an actualy domain name.   

## The HTTP redirect block 

We first define how to handle any HTTP request on port 80. To add this to the Caddyfile we can use the command:

```
echo "localhost:80 { 
redir https://localhost{uri} 
}
" > Caddyfile
```
If you have a domain name replace the following 
```
localhost:80 and https://localhost{uri}
``` 
with your own hostname e.g. 
```
example.com:80 and https://example.com{uri}
```
As previously stated we will be focusing on a localhost version but these configurations should work on a basic live environment with minimal configurations. 
## The HTTPS Reverse proxy block 

This is the main block that handles secure traffic and sends it to your web application. To write this to the Caddyfile without overwriting our earlier block use this command:

```
echo "localhost:443 {
  tls internal
  reverse_proxy website:80
}" >> Caddyfile
```

Again, instead of 
```
localhost:443
```
you would use your own hostname e.g.
```
example.com:443
```
but for this tutorial keep localhost. 

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
