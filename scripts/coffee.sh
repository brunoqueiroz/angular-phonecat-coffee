#!/bin/bash

BASE_DIR=`dirname $0`
TARGET=$1

mkdir -p $BASE_DIR/../build/$TARGET
coffee -o "$BASE_DIR/../build/$TARGET/" -c $BASE_DIR/../$TARGET/*.coffee

