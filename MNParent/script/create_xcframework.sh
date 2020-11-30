# https://levelup.gitconnected.com/build-xcframework-using-aggregated-targets-in-xcode-cac4ceaf6cf0
# Variables & Paths for the xcarchives and the output.
SCHEME_NAME="MNParent-iOS"
FRAMEWORK_NAME="MNParent-iOS"

SIMULATOR_ARCHIVE_PATH="${BUILD_DIR}/${CONFIGUARTION}/${FRAMEWORK_NAME}-iphonesimulator.xcarchive"
DEVICE_ARCHIVE_PATH="${BUILD_DIR}/${CONFIGUARTION}/${FRAMEWORK_NAME}-iphoneos.xcarchive"

OUTPUT_DIC="./xcframework"

# Generate the simulator xcarchive.
# Simulator xcarchive
xcodebuild archive \
	-scheme ${SCHEME_NAME} \
	-archivePath ${SIMULATOR_ARCHIVE_PATH} \
	-sdk iphonesimulator \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Device xcarchive
xcodebuild archive \
	-scheme ${SCHEME_NAME} \
	-archivePath ${DEVICE_ARCHIVE_PATH} \
	-sdk iphoneos \
	SKIP_INSTALL=NO \
	BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Clean the old output directory if exists and generate the output.
# Clean up old output directory
rm -rf "${OUTPUT_DIC}"

# Create xcframework combine of all frameworks
xcodebuild -create-xcframework \
	-framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
	-framework ${DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
	-output ${OUTPUT_DIC}/${FRAMEWORK_NAME}.xcframework

# Open the output directory
open ${BUILD_DIR}/${CONFIGUARTION}/