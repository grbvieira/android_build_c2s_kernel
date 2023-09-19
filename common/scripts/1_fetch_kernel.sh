#!/usr/bin/env bash

# fetch kernel sources
git clone \
  -b ${1:-master} \
  https://github.com/grbvieira/kernel-N986B.git \
  /home/noosreg/kernel
