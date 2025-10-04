Aftre learning about the docker-compose.yml file, the next important step is to create the Caddyfile.

![step2-3](./assets/step2-3.png)

We need to create the Caddyfile in the **current directory**. 

The Caddyfile, by default, is expected to be named **Caddyfile** (with a capital 'C' and no extension).

To create the Caddyfile, run the command `touch Caddyfile`. This makes a new empty file named Caddyfile in your current directory. You will use this file to set up things like reverse proxies, automatic HTTPS, and more advanced features such as **on-demand TLS**, which we will discuss later.