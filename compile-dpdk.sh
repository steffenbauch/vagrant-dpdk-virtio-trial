#!/bin/bash

export RTE_TARGET="x86_64-native-linuxapp-gcc"

cd $HOME
git clone git://dpdk.org/dpdk
cd dpdk
git checkout v2.1.0
make install T=${RTE_TARGET}
