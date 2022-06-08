#! /bin/sh

LIBRARY_NAME=$(swift package describe | grep 'Name: ' | grep -v 'Tests' | awk '{print $2}' | head -n 1)

xcodebuild -workspace . -scheme "$LIBRARY_NAME" clean -destination generic/platform=iOS -destination 'generic/platform=iOS Simulator'
xcodebuild -workspace . -scheme "$LIBRARY_NAME" BUILD_DIR='./Build' -destination generic/platform=iOS -configuration Release -sdk iphoneos BUILD_LIBRARY_FOR_DISTRIBUTION=NO ARCHS="arm64" BITCODE_GENERATION_MODE=bitcode
xcodebuild -workspace . -scheme "$LIBRARY_NAME" BUILD_DIR='./Build' -destination 'generic/platform=iOS Simulator' -configuration Release -sdk iphonesimulator BUILD_LIBRARY_FOR_DISTRIBUTION=NO ARCHS="x86_64 arm64" BITCODE_GENERATION_MODE=marker

mkdir -p ./Build/Frameworks/ios
mkdir -p ./Build/Frameworks/simulator
mkdir -p ./Build/xcframeworks
mkdir -p ./Build/resources

find ./Build/Release-iphoneos -maxdepth 1 -name '*.o'
ar -rcs "./Build/Release-iphoneos/lib$LIBRARY_NAME.a" "./Build/Release-iphoneos/$LIBRARY_NAME.o"; mkdir -p "./Build/frameworks/ios/$LIBRARY_NAME.framework/Modules"; cp "./Build/Release-iphoneos/lib$LIBRARY_NAME.a" "./Build/frameworks/ios/$LIBRARY_NAME.framework/$LIBRARY_NAME"; cp -r "./Build/Release-iphoneos/$LIBRARY_NAME.swiftmodule" "./Build/frameworks/ios/$LIBRARY_NAME.framework/Modules"

ar -rcs "./Build/Release-iphonesimulator/lib$LIBRARY_NAME.a" "./Build/Release-iphonesimulator/$LIBRARY_NAME.o"; mkdir -p "./Build/frameworks/simulator/$LIBRARY_NAME.framework/Modules"; cp "./Build/Release-iphonesimulator/lib$LIBRARY_NAME.a" "./Build/frameworks/simulator/$LIBRARY_NAME.framework/$LIBRARY_NAME"; cp -r "./Build/Release-iphonesimulator/$LIBRARY_NAME.swiftmodule" "./Build/frameworks/simulator/$LIBRARY_NAME.framework/Modules"

xcodebuild -create-xcframework -framework "./Build/frameworks/ios/$LIBRARY_NAME.framework" -framework "./Build/frameworks/simulator/$LIBRARY_NAME.framework" -allow-internal-distribution -output "./Build/xcframeworks/$LIBRARY_NAME.xcframework"

cd ./Build/xcframeworks/
zip -r ios-library.xcframework.zip "$LIBRARY_NAME.xcframework"