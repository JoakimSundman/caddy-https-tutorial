If you're still running a website or service over plain HTTP, you are exposing not just yourself but also your users to significant risks such as: 
- Security: Since HTTP is sent in plain text anyone with a listener on the network can read all the traffic, this includes but are not limited to passwords, credit card numbers, and personal data.
- Trust: Most browsers today warn users that a website is not safe or "Not secure "when using HTTP and this drives users away from your website or service. In short running HTTPS is no longer optional if you actually want users for you website or service. 

To solve these issues we need to use HTTPS. Caddy is a tool that automates the entire certificate life cycle for you allowing all your websites and services to run on HTTPS.

In this tutorial you will learn how to set up a basic webapp and how to set up Caddy and connect it to your webapp. To do this we will use docker and docker compose. 

Intended Learning Outcomes for this tutorial is: 
- Understanding security risks with HTTP
- Be able to create a simple Dockerfile for web application 
- Be able to configure Caddy as a reverse proxy 
- Be able to write a basic Caddyfile 
- Map ports 80 and 443 from the host to the Caddy container
- Be able to mount a persistent Docker volume for Caddy to store certificates
- Be able to deploy the secure application stack using a single docker compose up command 
- Verify the live HTTPS connection and automatic HTTP-to-HTTPS redirect. 
- Be able to inspect Docker and Caddy logs 