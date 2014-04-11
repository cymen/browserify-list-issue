#!/bin/sh
ASSET_PATH=`pwd`/assets

echo "Regular browserify (output to module.js)..."
CMD="NODE_PATH=$ASSET_PATH browserify specs/a_spec.js > module.js"
echo $CMD
eval $CMD

echo "browserify --list ..."
CMD="NODE_PATH=$ASSET_PATH browserify --list specs/a_spec.js"
echo $CMD
eval $CMD
