#!/bin/sh
apt-get install -y build-essential
apt-get install -y libjson-c-dev libgirepository1.0-dev libglib2.0-dev
apt-get install -y python2.7 autotools-dev intltool gettext libtool

apt-get install -y git swig python-setuptools gettext g++
apt-get install -y python-dev python-numpy
apt-get install -y libgtk-3-dev python-gi-dev
apt-get install -y libpng-dev liblcms2-dev libjson-c-dev
apt-get install -y gir1.2-gtk-3.0 python-gi-cairo

mkdir libs
cd libs

if [ ! -d libmypaint ]; then
  wget https://github.com/mypaint/libmypaint/releases/download/v1.3.0/libmypaint-1.3.0.tar.xz
  tar -xvf libmypaint-1.3.0.tar.xz
  mv libmypaint-1.3.0 libmypaint
  cd libmypaint
  ./configure
  make install
  cd ..
fi

if [ ! -d mypaint ]; then
  wget https://github.com/mypaint/mypaint/releases/download/v1.2.1/mypaint-1.2.1.tar.xz
  tar -xvf mypaint-1.2.1.tar.xz
  mv mypaint-1.2.1 mypaint
  cd mypaint
  scons
  scons install
  cd ..
fi

ldconfig
