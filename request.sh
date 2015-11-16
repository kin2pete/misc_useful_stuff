#!/usr/bin/env python
from urllib2 import Request, urlopen, URLError
from urllib import urlencode
from fileinput import input

sql=""

for line in input():
	sql =  line
	
query = urlencode ({ 'sql' : sql })
request = Request('https://metrics.pro.com/api/v1/query?key=Xt3CJANjYzGsEjQVWC48', query)

try:
	response = urlopen(request)
	results = response.read()
	print results
except URLError, e:
    print 'No results. Got an error code:', e
