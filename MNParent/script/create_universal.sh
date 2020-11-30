# Set the output folder var
UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal
# To make an XCFramework, we first build the framework for every type seperately
echo "XCFramework: Starting script to build an XCFramework. Output dir: ${UNIVERSAL_OUTPUTFOLDER}"
# Device slice.
echo "XCFramework: Archiving DEVICE type..."
xcodebuild archive -scheme "${PROJECT_NAME}" -configuration Release -destination 'generic/platform=iOS' -archivePath "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphoneos.xcarchive" SKIP_INSTALL=NO
echo "XCFramework: Archiving SIMULATOR type..."
# Simulator slice.
xcodebuild archive -scheme "${PROJECT_NAME}" -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphonesimulator.xcarchive" SKIP_INSTALL=NO
# First, get all the UUID filepaths for BCSymbolMaps, because these are randomly generated and need to be individually added as the `-debug-symbols` parameter. The dSYM path is always the same so that one is manually added
echo "XCFramework: Generating IPHONE BCSymbolMap paths..."
IPHONE_BCSYMBOLMAP_PATHS=(${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphoneos.xcarchive/BCSymbolMaps/*)
IPHONE_BCSYMBOLMAP_COMMANDS=""
for path in "${IPHONE_BCSYMBOLMAP_PATHS[@]}"; do
  IPHONE_BCSYMBOLMAP_COMMANDS="$IPHONE_BCSYMBOLMAP_COMMANDS -debug-symbols $path "
  echo $IPHONE_BCSYMBOLMAP_COMMANDS
done
# Simulator-targeted archives don't generate BCSymbolMap files, so above is only needed for iphone target
echo "XCFramework: Creating XCFramework file"
# Then we group them into one XCFramework file
xcodebuild -create-xcframework -framework "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphoneos.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" -debug-symbols "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphoneos.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" $IPHONE_BCSYMBOLMAP_COMMANDS -framework "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" -debug-symbols "${BUILD_DIR}/archives/${PROJECT_NAME}.framework-iphonesimulator.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" -output "${UNIVERSAL_OUTPUTFOLDER}/${PROJECT_NAME}.xcframework"
# For developer convenience, open the output folder
open "${UNIVERSAL_OUTPUTFOLDER}"