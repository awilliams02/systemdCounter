#!/bin/sh

INSTALL_DIR=/usr/local/bin
MAIN_PROGRAM_FILE=counter.py
CONFIGURATION_INSTALL_DIR=/etc/
MAIN_CONFIG_FILE=counter.conf

echo "Installing counter . . ."

cp $TEMP_DIR/etc/counter.py /usr/local/bin/
cp $TEMP_DIR/etc/counter.service /etc/systemd/system/

echo "Counter installed !"