#!/usr/bin/env bash
git clone https://github.com/blockcollider/bcjs
git pull
mkdir -p ./protos
cp -r ./bcjs/protos ./
sed -i '' -e 's/package bcsdk.*$/package bc;/g' ./protos/*.proto
