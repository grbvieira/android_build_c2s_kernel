#!/usr/bin/env bash

# fetch anykernel3 sources
git clone \
  https://github.com/osm0sis/AnyKernel3.git \
  /home/noosreg/anykernel3

# create config
cp -fv /common/configs/anykernel.sh /home/noosreg/anykernel3/anykernel.sh

# copy kernel image
cp -fv \
  /home/noosreg/kernel/arch/arm64/boot/Image \
  /home/noosreg/anykernel3/zImage

# cleanup previous zips
rm -f /out/*.zip

# create zip file
pushd /home/noosreg/anykernel3
  zip -r9 /out/leanKernel.zip * -x .git README.md *placeholder
popd
