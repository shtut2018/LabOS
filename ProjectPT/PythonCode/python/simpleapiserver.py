from http.server import HTTPServer, BaseHTTPRequestHandler
import requests

class helloHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        
        if self.path == '/favicon.ico':
            self.send_response(200)
            self.send_header('Content-Type', 'image/x-icon')
            self.send_header('Content-Length', 0)
            self.end_headers()

        else:
            try:    
                response = requests.get("https://api.github.com/repos" + (self.path) + "/releases/latest")        
                self.send_response(200)
                self.send_header('content-type', 'text/html')
                self.end_headers()

                self.wfile.write(response.json()["name"].encode())
            except:
                print ("wrong repository name") 
                self.wfile.write('Wrong URL'.encode())

def main():
    port = 8080
    server = HTTPServer(('', port), helloHandler)
    print('Server running on port %s' % port)
    server.serve_forever()

if __name__ == '__main__':
    main()