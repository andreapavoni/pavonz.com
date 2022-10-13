#!/bin/sh

set -e 

[ -d dist ] && rm -rf dist
zola build --output-dir dist
scp -r dist/* deployer@funky.studio:~/apps/static_websites/pavonz.com/
