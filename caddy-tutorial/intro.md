If you're still running a website or service over plain HTTP, you are exposing not just yourself but also your users to significant risks such as: 
- Security: Since HTTP is sent in plain text anyone with a listener on the network can read all the traffic, this includes but are not limited to passwords, credit card numbers, and personal data.
- Trust: Most browsers today warn users that a website is not safe or "Not secure" when using HTTP and this drives users away from your website or service. In short running HTTPS is no longer optional if you actually want users for you website or service. 

To solve these issues we need to use HTTPS. Caddy is a tool that automates the entire certificate life cycle for you allowing all your websites and services to run on HTTPS.

For modern deployments, we rely on *Infrastructure as Code (IaC)* to define and automate our stack. Caddy's configuration file (`Caddyfile`) serves as a declarative policy for our security layer. 

A standard Caddy configuration requires listing every domain. For dynamic services like a *SaaS platform* or a *web host* that handles user-defined domains, this breaks the automation model. 

This is where **On-Demand TLS** is essential. It extends our IaC capabilities by providing a scalable, hands-off solution: the server deines a security policy once and automatically provides HTTPS for any hostname on the fly, after checking an authorization endpoint. 

## **Intended Learning Outcomes**
In this tutorial you will learn how to build an automated, self-securing IaC stack using Caddy and it's On-Demand TLS feature. You will learn to:
- Understanding security risks with HTTP and the necessity of IaC automation.
- Configure Caddy's global options to enable On-Demand TLS.
- Implement the mandatory ask endpoint for authorization and abuse prevention.
- Write a basic Caddyfile that acts as a declarative security policy.
- Start Caddy and observe it issuing a certificate for a domain dynamically. 
- Verify the live HTTPS connection.