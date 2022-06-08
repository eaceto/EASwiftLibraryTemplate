#!/bin/sh
export DOCC_JSON_PRETTYPRINT="YES"
LIBRARY_NAME=$(swift package describe | grep 'Name: ' | grep -v 'Tests' | awk '{print $2}' | head -n 1)

swift package --disable-sandbox preview-documentation --target "$LIBRARY_NAME"
