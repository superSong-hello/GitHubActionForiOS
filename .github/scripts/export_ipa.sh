#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/githubAction.xcarchive \
            -exportOptionsPlist ./.github/secrets/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty

