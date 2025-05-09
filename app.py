from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Welcome to the Python DevOps Demo App",
        "status": "healthy"
    })

@app.route('/health')
def health():
    return jsonify({
        "status": "healthy",
        "version": "1.0.0"
    })

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port) 