Now that we have set up and used Caddy with simple HTTPS setup, it's time to enable **on-demand TLS**. 
To do this we can start by turning off the docker images. Turn off the images using the command: `docker-compose down`

Now we need to move into the **conf** folder again using `cd conf`.

When we are in conf we will remove the current Caddyfile using `rm Caddyfile`.

We will then again create an empty Caddyfile using `touch Caddyfile`.

Now when we have an empty Caddyfile we will add the on-demand TLS block with: 
```
echo "{
    on_demand_tls {
        ask http://checker:9000/check-domain
    }
    acme_ca internal
}

"> Caddyfile
```
In a real production setting instead of 
```
internal
```
you would remove it and Caddy would use their service *Lets encrypt* which would check for domain ownage. 

Now we need to add the redirect part and general catch all for both of the ports. We will do this using: 
```
echo ":80 { 
  redir https://{host}{uri} 
}

:443 {
  reverse_proxy website:80 
}" >> Caddyfile
```
Notice that here we don't define host as localhost instead as
```
{host}
```
this is to catch any potential hostname that would be used under our general domain. 