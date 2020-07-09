#!/bin/sh
set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.mobileprovision ./.github/secrets/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile_key.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/profile_key.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/Cer_dis.p12 -t agg -k ~/Library/Keychains/build.keychain -P "trial@pp" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain