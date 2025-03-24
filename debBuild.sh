#!/bin/sh

TEMP_DIR=temp

echo "Starting deb package build!"

echo "Making temporary directory tree"
mkdir -p $TEMP_DIR
mkdir -p $TEMP_DIR/etc/
mkdir -p $TEMP_DIR/etc/systemd/system/
mkdir -p $TEMP_DIR/usr/bin/
mkdir -p $TEMP_DIR/usr/local/bin/
mkdir -p $TEMP_DIR/DEBIAN

echo "Copy control file for DEBIAN/"
cp src/DEBIAN/control $TEMP_DIR/DEBIAN/

echo "Copy postinst script for DEBIAN/"
cp src/DEBIAN/postinst $TEMP_DIR/DEBIAN/

echo "Copy postrm script for DEBIAN/"
cp src/DEBIAN/postrm $TEMP_DIR/DEBIAN/

echo "Copy prerm script for DEBIAN/"
cp src/DEBIAN/prerm $TEMP_DIR/DEBIAN/

echo "conffiles setup for DEBIAN/"
cp src/DEBIAN/conffiles $TEMP_DIR/DEBIAN/

echo "Configuration file into place"
cp src/counter.conf $TEMP_DIR/etc/

echo "Install script for DEBIAN"
cp install.sh $TEMP_DIR/usr/local/bin/

echo "Install python for counter"
cp src/counter.py $TEMP_DIR/etc/

echo "Copy service file for counter"
cp counter.service $TEMP_DIR/etc/

echo "Building deb file"
dpkg-deb --root-owner-group --build $TEMP_DIR
mv $TEMP_DIR.deb counter-v2.0.0.deb

echo "Complete!"