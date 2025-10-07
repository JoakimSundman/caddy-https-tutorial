Lastly to now test that it works **(heads up the curl commands will not resolve and seem stuck)** by running `curl -k https://test1.com` and `curl -k https://test2.net` both of these will hang and not resovle since we haven't actually created any service which will serve these requests. So to actually see that this works we will read the logs of the checker. To do this run `docker logs checker` and you will see something along the lines of:
```
Starting domain checker on port 9000...
172.18.0.4 - - [07/Oct/2025 12:27:54] "GET /check-domain?domain=test1.com HTTP/1.1" 200 -
172.18.0.4 - - [07/Oct/2025 12:27:54] 172.18.0.4 - - [07/Oct/2025 12:27:54] "GET /check-domain?domain=test1.com HTTP/1.1" 200 -
172.18.0.4 - - [07/Oct/2025 12:28:02] "GET /check-domain?domain=test2.net HTTP/1.1" 200 -
172.18.0.4 - - [07/Oct/2025 12:28:02] 172.18.0.4 - - [07/Oct/2025 12:28:02] "GET /check-domain?domain=test2.net HTTP/1.1" 200 -
```

You can try and run `curl -k https://test3.com` which will return with an internal TLS error which is a security measure by Caddy to keep the service as a black box not giving information to potential adversaries. 