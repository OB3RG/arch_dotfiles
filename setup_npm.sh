#!/bin/bash

echo "setting up global npm access"
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm install -g yarn


