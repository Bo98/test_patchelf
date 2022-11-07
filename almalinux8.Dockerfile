FROM almalinux:8.6

RUN \
  dnf update -y && \
  dnf install -y \
    git \
    make \
    autoconf \
    automake \
    gcc \
    gcc-c++ && \
  cat /etc/os-release && uname -a && \
  echo "**** Installing Patchelf ****" && \
  git clone -b 0.16.1 https://github.com/NixOS/patchelf.git && \
  cd patchelf && \
  ./bootstrap.sh && ./configure && make && make check
