#!/bin/bash
echo -e "currentsong\\nclose" | nc localhost 6600 | awk -F': ' '/Title/ { print " 📻  " $2;}'
