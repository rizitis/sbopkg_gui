#!/bin/bash

# sbopkg_gui is a graphical user interface for sbopkg,
# a package manager for Slackware Linux. 
# This is an patched version of sbopkg_gui (http://gernot-walzl.at/index.php?nav=Slackware%2Fsbopkg_gui) 
# This patched version is for Slackware current ONLY use supposed that your sbopkg repo is ponce (SBo-git)
# Anagnostakis Ioannis Greece <rizitis@gmail.com>

#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


cd $(dirname $0) ; CWD=$(pwd)


PRGNAM=sbopkg_gui
VERSION=${VERSION:-current}	
BUILD=${BUILD:-1}
TAG=${TAG:-_rtz}		
PKGTYPE=${PKGTYPE:-tgz}


if [ -z "$ARCH" ]; then
  case "$( uname -m )" in
    i?86) ARCH=i586 ;;
    arm*) ARCH=arm ;;
        *) ARCH=$( uname -m ) ;;
  esac
fi


if [ ! -z "${PRINT_PACKAGE_NAME}" ]; then
  echo "$PRGNAM-$VERSION-$ARCH-$BUILD$TAG.$PKGTYPE"
  exit 0
fi

TMP=${TMP:-/tmp/rtz}	
PKG=$TMP/package-$PRGNAM
OUTPUT=${OUTPUT:-/tmp}	

if [ "$ARCH" = "i586" ]; then
  SLKCFLAGS="-O2 -march=i586 -mtune=i686"
  LIBDIRSUFFIX=""
elif [ "$ARCH" = "i686" ]; then
  SLKCFLAGS="-O2 -march=i686 -mtune=i686"
  LIBDIRSUFFIX=""
elif [ "$ARCH" = "x86_64" ]; then
  SLKCFLAGS="-O2 -fPIC"
  LIBDIRSUFFIX="64"
else
  SLKCFLAGS="-O2"
  LIBDIRSUFFIX=""
fi

set -e 

mkdir -p $TMP $PKG $OUTPUT
cd $TMP
rm -rf $PRGNAM-$VERSION
wget -O sbopkg_gui-current.zip https://github.com/rizitis/sbopkg_gui/archive/refs/heads/main.zip
unzip $CWD/$PRGNAM-$VERSION.zip
cd $PRGNAM-$VERSION
chown -R root:root .
find -L . \
 \( -perm 777 -o -perm 775 -o -perm 750 -o -perm 711 -o -perm 555 \
  -o -perm 511 \) -exec chmod 755 {} \; -o \
 \( -perm 666 -o -perm 664 -o -perm 640 -o -perm 600 -o -perm 444 \
  -o -perm 440 -o -perm 400 \) -exec chmod 644 {} \;

mkdir -p $PKG/usr/bin
cat sbopkg_gui > $PKG/usr/bin/sbopkg_gui
chmod +x $PKG/usr/bin/sbopkg_gui
mkdir -p $PKG/usr/share/applications/
cat sbopkg_gui.desktop > $PKG/usr/share/applications/sbopkg_gui.desktop
mkdir -p $PKG/install
cat slack-desc > $PKG/install/slack-desc
cat slack-required > $PKG/install/slac-required
cat doinst.sh > $PKG/install/doinst.sh

mkdir -p $PKG/usr/doc/$PRGNAM-$VERSION
cat $CWD/install_$PRGNAM.sh > $PKG/usr/doc/$PRGNAM-$VERSION/$PRGNAM.SlackBuild

cd $PKG
/sbin/makepkg -l y -c n $OUTPUT/$PRGNAM-$VERSION-$ARCH-$BUILD$TAG.$PKGTYPE

