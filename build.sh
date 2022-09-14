#!/usr/bin/env bash

set -euxo pipefail

# Define version
VERSION=9.4.0

# Clone spree and package it
git clone --depth 1 --branch v${VERSION} --single-branch https://github.com/eslint/espree
cd espree
sed -i 's#external#//external#g' rollup.config.js # Remove external dependencies so all gets packaged into one file
npm install
npm run build
node ../patch.js `pwd`/package.json # Patch dependencies from package.json
npm pack
cd ..
cp espree/espree-${VERSION}.tgz .
rm -rf espree
printf "${VERSION}" &> VERSION
