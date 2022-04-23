#!/bin/sh -ve
git apply ./scripts/enable-android-google-services.patch
flutter clean
flutter pub get
cd ios
rm -rf Pods
rm Podfile.lock
arch -x86_64 pod install
arch -x86_64 pod update
cd ..
flutter build ios --release
cd ios
bundle update fastlane
bundle exec fastlane beta
cd ..