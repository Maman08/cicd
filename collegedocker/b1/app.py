from flask import Flask
import redis

app=Flask(__name__)
r=redis.Redis(host='redis',port=6379,decode_responses=True)
@app.route('/')
def hello():
    r.incr('hits')
    return f"Hello from Backend-A! Hit count:{r.get('hits')}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
