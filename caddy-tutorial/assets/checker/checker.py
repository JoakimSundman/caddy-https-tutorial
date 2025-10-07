import http.server
import urllib.parse

allowed = ["test1.com", "test2.net"]

class DomainChecker(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        url_components = urllib.parse.urlparse(self.path)
        params = urllib.parse.parse_qs(url_components.query)
        domain = params.get('domain', [None])[0]
        
        # Default response is DENIED (400)
        status = 400
        message = b'Domain Not Authorized'

        if domain in allowed:
            status = 200
            message = b'Domain Authorized'

        self.send_response(status)
        self.end_headers()
        self.wfile.write(message)
        
        self.log_message('%s - - [%s] "%s" %d -', self.client_address[0], self.log_date_time_string(), self.requestline, status)

# Standard Python server setup
def run(port=9000):
    server_address = ('0.0.0.0', port)
    httpd = http.server.HTTPServer(server_address, DomainChecker)
    print(f'Starting domain checker on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()