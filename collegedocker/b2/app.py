from flask import Flask
import requests
app = Flask(__name__)

@app.route('/')
def ping_a():
    try:
        res=requests.get('http://backend-a:5000')
        return f"Backend B calling A: {res.text}"
    except Exception as e:
        return f"Error talking to backend-a: {str(e)}"
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
