#!/bin/bash

# Enable "packer" user sudo without password
echo "packer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/packer