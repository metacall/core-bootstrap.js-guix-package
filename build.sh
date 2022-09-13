#!/usr/bin/env bash

set -euxo pipefail

git clone --depth 1 --branch develop --single-branch https://github.com/metacall/core
npm --prefix "`pwd`" install core/source/loaders/node_loader/bootstrap/lib/
rm node_modules/node_loader_bootstrap
node -e "console.log(require('./node_modules/espree/package.json').version)" &> VERSION
tar -czvf espree-`cat VERSION`.tgz ./node_modules/*
rm -rf core node_modules package-lock.json package.json
