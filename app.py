from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Docker!"

if __name__ == "__main__":
    # IMPORTANT: host must be 0.0.0.0 to be reachable outside the container
    app.run(host='0.0.0.0', port=5000)
