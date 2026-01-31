#!/bin/bash

modprobe vfio-pci
echo 1 | tee /sys/module/vfio/parameters/enable_unsafe_noiommu_mode

sudo driverctl set-override 0000:00:04.0 vfio-pci
sudo driverctl set-override 0000:00:05.0 vfio-pci
sudo driverctl set-override 0000:00:06.0 vfio-pci