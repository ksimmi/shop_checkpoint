#!/bin/bash

set -e

version=${1}

#cd web-shop

RAILS_ENV=production rake assets:precompile

echo ${version} > VERSION

script_execution_dir=$(pwd)
echo Scripts runed under $script_execution_dir directory

#tar -czf ${HOME}/artifacts/web-shop-${build_number}.tar.gz \
#--exclude=README.md \
#--exclude=features \
#--exclude=test \
#.

#cd -