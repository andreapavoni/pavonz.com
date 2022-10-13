#!/bin/sh

set -e 

rm -rf dist
zola build --output-dir dist
scp -r dist/* deployer@funky.studio:~/apps/static_websites/pavonz.com/
