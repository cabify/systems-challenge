#!/usr/bin/env python

from bottle import route, run

@route('/status')
def status():
    return 'OK\n'

run(host='localhost', port=8181, debug=False)
