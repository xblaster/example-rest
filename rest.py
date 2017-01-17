#!/usr/bin/env python
import web
import xml.etree.ElementTree as ET

tree = ET.parse('/src/user_data.xml')
root = tree.getroot()


import socket


urls = (
    '/users', 'list_users',
    '/users/(.*)', 'get_user',
    '/version', 'version'
)

app = web.application(urls, globals())

class list_users:        
    def GET(self):
	output = 'users:[';
	for child in root:
                print 'child', child.tag, child.attrib
                output += str(child.attrib) + ','
	output += ']';
        return output

class version:
    def GET(self):
        return "4"+"@"+socket.gethostbyname(socket.gethostname())


class get_user:
    def GET(self, user):
	for child in root:
		if child.attrib['id'] == user:
		    return str(child.attrib)

if __name__ == "__main__":
    app.run()