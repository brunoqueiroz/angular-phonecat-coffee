#!/bin/bash

BASE_DIR=`dirname $0`

$BASE_DIR/coffee.sh test/unit

java -jar "$BASE_DIR/../test/lib/jstestdriver/JsTestDriver.jar" \
     --config "$BASE_DIR/../config/jsTestDriver.conf" \
     --basePath "$BASE_DIR/.." \
     --tests all
