# Rights Reserved, Unlicensed

from http.server import BaseHTTPRequestHandler, HTTPServer
import json
from inference import predict_wellness

HOST = "127.0.0.1"
PORT = 8080


class RequestHandler(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()

    def do_POST(self):
        length = int(self.headers.get("Content-Length"))
        body = self.rfile.read(length)
        data = json.loads(body)

        try:
            score = predict_wellness(data)
            response = {"wellness_score": score}
        except Exception as e:
            response = {"error": str(e)}

        self._set_headers()
        self.wfile.write(json.dumps(response).encode())


def run_server():
    print(f"AI Wellness API running on http://{HOST}:{PORT}")
    server = HTTPServer((HOST, PORT), RequestHandler)
    server.serve_forever()


if __name__ == "__main__":
    run_server()
