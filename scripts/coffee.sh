#!/bin/bash

BASE_DIR=`dirname $0`
TARGET=$1

coffee -c $TARGET/*.coffee

