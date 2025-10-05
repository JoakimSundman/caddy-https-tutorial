from http.server import BaseHTTPRequestHandler, HTTPServer
import os
import urllib.parse

# This path corresponds to the volume mount in docker-compose.yml
DOMAIN_LIST_PATH = os.environ.get('DOMAIN_LIST_PATH', '/app/domains')
CHECK_ENDPOINT = '/check-domain'

class AskHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith(CHECK_ENDPOINT):
            parsed_url = urllib.parse.urlparse(self.path)
            query_params = urllib.parse.parse_qs(parsed_url.query)
            
            requested_domain = query_params.get('domain', [None])[0]

            if requested_domain:
                domain_file_path = os.path.join(DOMAIN_LIST_PATH, requested_domain)
                
                if os.path.exists(domain_file_path):
                    self.send_response(200)
                    self.end_headers()
                    self.wfile.write(b'Domain Authorized')
                else:
                    self.send_response(400)
                    self.end_headers()
                    self.wfile.write(b'Domain Not Authorized')
            else:
                self.send_response(400)
                self.end_headers()
                self.wfile.write(b'Missing domain parameter')
        else:
            self.send_response(404)
            self.end_headers()

def run(server_class=HTTPServer, handler_class=AskHandler, port=9000):
    server_address = ('0.0.0.0', port)
    httpd = server_class(server_address, handler_class)
    print(f"Starting domain checker on port {port}...")
    httpd.serve_forever()

if __name__ == '__main__':
    run()