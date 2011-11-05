#!/bin/bash

BASE_DIR=`dirname $0`
TARGET=$1

coffee -c $BASE_DIR/../app/js/*.coffee
coffee -c $TARGET/*.coffee

