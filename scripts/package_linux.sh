#!/usr/bin/env bash
set -e

VERSION=$1
APP_NAME="branchdesk"
BUILD_DIR="build/linux/x64/release/bundle"
DIST_DIR="dist"

mkdir -p $DIST_DIR

echo "📦 Packaging BranchDesk version $VERSION"

# ---------------- APPIMAGE ----------------
appimage-builder --recipe appimage/appimage-builder.yml
mv *.AppImage $DIST_DIR/$APP_NAME-$VERSION.AppImage

# ---------------- DEB PACKAGE ----------------
mkdir -p pkg-deb/DEBIAN
mkdir -p pkg-deb/usr/share/$APP_NAME
mkdir -p pkg-deb/usr/share/applications
mkdir -p pkg-deb/usr/share/icons/hicolor/256x256/apps

# Copy binary + assets
cp -r $BUILD_DIR/* pkg-deb/usr/share/$APP_NAME/

# Desktop file
cp scripts/branchdesk.desktop pkg-deb/usr/share/applications/branchdesk.desktop

# Icon (place your PNG inside assets/icons/)
cp assets/icons/256.png pkg-deb/usr/share/icons/hicolor/256x256/apps/branchdesk.png

cat <<EOF > pkg-deb/DEBIAN/control
Package: branchdesk
Version: $VERSION
Architecture: amd64
Maintainer: BranchDesk Team
Description: BranchDesk is an open-source, cross-platform Git client for Windows, macOS, and Linux. It offers a clean interface for managing commits, branches, merges, and repositories.
EOF

dpkg-deb --build pkg-deb
mv pkg-deb.deb $DIST_DIR/$APP_NAME-$VERSION.deb
rm -rf pkg-deb

# ---------------- RPM PACKAGE ----------------
fpm -s dir -t rpm \
  -n $APP_NAME \
  -v $VERSION \
  --prefix /usr/share/$APP_NAME \
  $BUILD_DIR

mv *.rpm $DIST_DIR/$APP_NAME-$VERSION.rpm

echo "🎉 Linux packaging completed!"
