#!/bin/bash
for item in `docker ps -aq`;do docker rm -f $item;done
