from flask import Flask
import redis, os
app = Flask(__name__)
db= redis.Redis(host=os.environ.get("DB_PORT_6379_TCP_ADDR", "localhost"))

@app.route("/")
def hello():
    db.incr("counter")
    return "Hello World! {0}\n".format(db.get("counter"))

if __name__ == "__main__":
    app.run(port=8000,host="0.0.0.0")