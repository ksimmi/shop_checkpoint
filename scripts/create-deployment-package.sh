#!/bin/bash
echo ./create-deployment-package.sh starts here...

set -ex

version=${1}
master_key_value=${2}

echo setting master.key value as $master_key_value

cd web-shop

RAILS_ENV=production rake assets:precompile

echo ${version} > VERSION

mkdir -p ${HOME}/artifacts

echo $master_key_value > './config/master.key'

tar -czf ${HOME}/artifacts/web-shop-${build_number}.tar.gz \
--exclude=README.md \
--exclude=features \
--exclude=test \
.

cd -

ls ${HOME}/artifacts/