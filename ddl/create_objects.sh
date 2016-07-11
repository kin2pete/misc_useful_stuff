#!/bin/bash

for f in *.sql; do
	psql -h localhost -U root -d metrics -p 7432 -f $f
done