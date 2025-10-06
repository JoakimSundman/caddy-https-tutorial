Now that we have set up and used Caddy with simple HTTPS setup, it's time to enable **on-demand TLS**. This feature allows Caddy to issue certificates dynamically for any domain that requests one, provided that the domain has been registered in the system similar to a database. 
To do this we can start by turning off the docker images. Turn off the images using the command: `docker-compose down`

Now we need to move into the **conf** folder again using `cd conf`.

When we are in conf we will remove the current Caddyfile using `rm Caddyfile`.

We will then again create an empty Caddyfile using `touch Caddyfile`.
Before we add the code, we need to understand what the **ask** endpoint is. In a real production setting, such as a web hosting service or a Software as a Service  platform(SaaS) that allows users to map their own domains (like Shopify) the checker server plays a critical role. In this tutorial we provide a finished checker that has registered the domain *test1.com* and *test2.net*.
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
To use this in a real production setting, you would have to make two changes: 1. Remove the 
```
acme-ca internal
```
line to enable public cetrificates from Let's encrypt. 
2. Update the **ask** endpoint to the production URL of your checker service. 

Now we need to add the redirect part and general catch all for both of the ports. We will do this using: 
```
echo ":80 { 
  redir https://{host}{uri} 
}

:443 {
  tls {
      on_demand
    }
  reverse_proxy website:80
}" >> Caddyfile
```
Notice that here we don't define host as localhost instead as
```
{host}
```
this is the dynamic part of the configuration which allows test1.com and test2.net to both get certificates without manually changing the configuration file for each domain.  
