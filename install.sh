#!/bin/bash

set -eux

has () {
  type "$1" > /dev/null 2>&1
  [ $? -eq 0 ]
}

if has pip3; then
  pip3 install ansible
fi