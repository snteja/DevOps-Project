#!/bin/bash
sed "s/tagVersion/$1/g" pod.yml > teja-pod.yml
