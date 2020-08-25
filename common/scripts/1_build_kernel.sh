#!/usr/bin/env bash

# fetch kernel sources
git clone \
  -b ${1:-master} \
  https://github.com/cawilliamson/android_kernel_samsung_c2s \
  /usr/src/kernel

# change working directory
cd /usr/src/kernel

# symlink toolchain (installed at /opt)
ln -s /opt/toolchain /usr/src/kernel/toolchain

# execute actual build
export ANDROID_MAJOR_VERSION=q
make -j$(nproc --all) ARCH=arm64 exynos9830-c2sxxx_defconfig
make -j$(nproc --all) ARCH=arm64

# remove previous images
rm -f /out/Image-dtb

# copy kernel image out
cp -fv \
  /usr/src/kernel/arch/arm64/boot/Image \
  /out/Image
