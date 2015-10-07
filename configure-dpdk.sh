#!/bin/bash

export RTE_TARGET="x86_64-native-linuxapp-gcc"

cd ~/dpdk

sudo modprobe uio_pci_generic

sudo tools/dpdk_nic_bind.py -b uio_pci_generic 0000:00:08.0
sudo tools/dpdk_nic_bind.py -b uio_pci_generic 0000:00:09.0

TMPFILE=$(mktemp)
for d in /sys/devices/system/node/node? ; do
	echo "echo 0 > $d/hugepages/hugepages-2048kB/nr_hugepages" >> ${TMPFILE}
done
sudo sh ${TMPFILE}
rm ${TMPFILE}

sudo sh -c 'echo 512 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages'
