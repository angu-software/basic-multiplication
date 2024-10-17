#!/bin/zsh
set -e

# -- Tools --

SWIFT_LINT_NAME=swiftlint
SWIFT_LINT_VERSION=0.57.0
SWIFT_LINT_ARCHIVE=portable_swiftlint.zip
SWIFT_LINT_URL="https://github.com/realm/SwiftLint/releases/download/${SWIFT_LINT_VERSION}/${SWIFT_LINT_ARCHIVE}"

# -- Install SwiftLint --

TOOLS_DIR=Tools
DOWNLOAD_DIR=$TOOLS_DIR/__tmp__
TOOLS_BIN_DIR=$TOOLS_DIR/bin

# Create directories
mkdir -p $DOWNLOAD_DIR

echo "Installing ${SWIFT_LINT_NAME} ${SWIFT_LINT_VERSION}..."

# Download tools
curl -L -o ${DOWNLOAD_DIR}/${SWIFT_LINT_ARCHIVE} ${SWIFT_LINT_URL}

# Unzip tools
unzip -o ${DOWNLOAD_DIR}/${SWIFT_LINT_ARCHIVE} -d ${TOOLS_BIN_DIR}

# Clean up

rm -rf $DOWNLOAD_DIR
