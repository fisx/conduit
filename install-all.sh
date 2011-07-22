#!/bin/sh

# Note: Ignoring wai-handler-devel, wai-handler-webkit
PACKAGES="wai wai-test wai-extra wai-app-static wai-handler-fastcgi wai-handler-launch wai-handler-scgi warp warp-static"
CABAL=cabal

for package in $PACKAGES
do
    echo Installing $package
    cd $package
    $CABAL configure --enable-tests && $CABAL build && $CABAL test && ./Setup.lhs install || exit
    cd ..
done
