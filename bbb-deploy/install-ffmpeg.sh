# Install dependencies
sudo apt-get install build-essential git-core checkinstall yasm texi2html libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev libtheora-dev libvorbis-dev libx11-dev libxfixes-dev libxvidcore-dev zlib1g-dev --yes


# Setup libvpx
if [ ! -d /usr/local/src/libvpx ]; then
  cd /usr/local/src
  sudo git clone http://git.chromium.org/webm/libvpx.git
  cd libvpx
  sudo ./configure
  sudo make
  sudo make install
fi

# Install ffmpeg
cd /usr/local/src
sudo wget http://ffmpeg.org/releases/ffmpeg-0.11.2.tar.gz
sudo tar -xvzf ffmpeg-0.11.2.tar.gz
cd ffmpeg-0.11.2
sudo ./configure  --enable-version3 --enable-postproc  --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis  --enable-libvpx
sudo make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:$(./version.sh)" --backup=no --deldoc=yes --default
