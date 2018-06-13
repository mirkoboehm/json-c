#!/usr/bin/env bash
set -e

eval `qmstrctl start --wait`
echo "Building and documenting JSON-C (QMSTR master running at $QMSTR_MASTER)..."
sh autogen.sh
./configure
qmstr make
echo "Building JSON-C completed, running analysis..."
qmstrctl analyze
echo "Analysis complete, running reports..."
qmstrctl report
echo "Building and documenting JSON-C completed."
# qmstrctl quit
