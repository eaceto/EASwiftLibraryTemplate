#!/bin/sh

# Check correct run
SWIFT_PACKAGE="Package.swift"
if [ ! -f "$SWIFT_PACKAGE" ]; then
    echo "Script should be run from the directory where $SWIFT_PACKAGE is present."
    echo "./scripts/preview-docc.sh"
    exit -1
fi

export DOCC_JSON_PRETTYPRINT="YES"
LIBRARY_NAME=$(swift package describe | grep 'Name: ' | grep -v 'Tests' | awk '{print $2}' | head -n 1)

swift package --disable-sandbox preview-documentation --target "$LIBRARY_NAME"
