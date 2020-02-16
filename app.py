from flask import Flask, render_template
import urllib.request
import subprocess

app = Flask(__name__)

@app.route("/")
def main():
    return render_template('index.html')

@app.route("/ST")
def st_servers():
    response_st7 = urllib.request.urlopen("http://First").getcode()
    response_st2 = urllib.request.urlopen("http://second").getcode()
    response_st5 = urllib.request.urlopen("http://Third").getcode()
    st_7 = "cd app/cli/bin && sh jboss-cli.sh --connect  --user=USER --password=PASSWORD --controller=remote+http://CONTROLLER --commands='ls deployment'"
    get_version = subprocess.call(st_7, shell=True)
    return (render_template('ST.html', a=response_st7, b=response_st2, c=response_st5, d=get_version, f=subprocess.call(st_7, shell=True)))


@app.route("/TA")
def TA_servers():
    return render_template('TA.html')

if __name__ == "__main__":
    app.run()
