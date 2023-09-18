#!/usr/bin/env bash

# change working directory
cd /home/noosreg/kernel

# symlink toolchain (installed at /opt)
ln -s /opt/toolchain /home/noosreg/kernel/toolchain

# execute actual build
ANDROID_MAJOR_VERSION=r
PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION PLATFORM_VERSION
make -j$(nproc --all) ARCH=arm64 exynos9830-c2sxxx_defconfig
make ARCH=arm64 menuconfig

# copy kernel config out
cp -fv \
  /home/noosreg/kernel/.config \
  /out/defconfig
