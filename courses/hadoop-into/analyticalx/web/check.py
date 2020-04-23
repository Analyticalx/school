from flask import Flask, request, render_template, session, redirect, url_for, jsonify
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)

@app.route('/valid')
def valid():
    ls = os.popen('/opt/hadoop/bin/hdfs dfs -ls -C  -R /').read()
    files = ls.split('\n')
    tests = [
        "/analyticalx",
        "/analyticalx/inbound",
        "/analyticalx/inbound/people.csv"
        ]
    validations = []
    for t in tests:
        validations.append({"name":t,  "status": (t in files)})

    ret = {}
    ret['course'] = "Hadoop Into"
    ret['validations'] = validations
    return jsonify(ret)

@app.route('/status')
def status():

    jps = os.popen('jps').read()
    services = []
    for service in jps.split('\n'):
        services.append(service.split())

    ret = {}
    ret['course'] = "Hadoop Into"
    ret['services'] = services
    return jsonify(ret)

if __name__ == '__main__':
    app.run(debug = False, host="0.0.0.0", port=5000)