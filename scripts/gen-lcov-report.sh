#! /bin/sh

# Dependencies:
#  - LCOV: brew install lcov
#  - Assumes Build and Test was run and build output is .build/coverage-build

# Check correct run
SWIFT_PACKAGE="Package.swift"
if [ ! -f "$SWIFT_PACKAGE" ]; then
    echo "Script should be run from the directory where $SWIFT_PACKAGE is present."
    echo "./scripts/gen-lcov-report.sh"
    exit -1
fi

# Precondition
if ! command -v genhtml &> /dev/null
then
    echo "Error genhtml not found. Run 'brew install lcov'" >&2
    exit -1
fi

CONFIGURATION="debug"
COVERAGE_BUILD_PATH=".build/coverage-build"
COVERAGE_OUTPUT_PATH=".build/lcov/report"
DOCS_OUTPUT_PATH="docs/lcov"
LCOV_INFO_PATH="$COVERAGE_OUTPUT_PATH/lcov.info"

# Assuming one package..
PACKAGE_NAME=`swift package describe | grep "Name: " | grep -v "Tests" | awk '{print $2}' | head -n 1`

CODECOV_PROFDATA_PATH="$COVERAGE_BUILD_PATH/$CONFIGURATION/codecov/default.profdata"
PACKAGE_TESTS_PATH="$COVERAGE_BUILD_PATH/$CONFIGURATION/${PACKAGE_NAME}PackageTests.xctest/Contents/MacOS/${PACKAGE_NAME}PackageTests"

XCODE_PATH=`xcode-select -p`
LLVMCOV_PATH="$XCODE_PATH/Toolchains/XcodeDefault.xctoolchain/usr/bin/llvm-cov"

# Clean docs
rm -r $COVERAGE_OUTPUT_PATH $DOCS_OUTPUT_PATH

# Build coverage report
mkdir -p $COVERAGE_OUTPUT_PATH
$LLVMCOV_PATH export -format=lcov -instr-profile=$CODECOV_PROFDATA_PATH $PACKAGE_TESTS_PATH -ignore-filename-regex=".build|Tests" "Sources/" > $LCOV_INFO_PATH

# Generate doc from report
genhtml $LCOV_INFO_PATH --config-file .lcovrc --show-details --legend --keep-descriptions --output-directory $DOCS_OUTPUT_PATH

# Print report to console
$LLVMCOV_PATH report -instr-profile=$CODECOV_PROFDATA_PATH $PACKAGE_TESTS_PATH -ignore-filename-regex=".build|Tests" "Sources/" --use-color=false