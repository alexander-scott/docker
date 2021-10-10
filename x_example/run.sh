#!/bin/bash

DISPLAY=:0 docker run --rm -ti --net=host -e DISPLAY=$DISPLAY fr3nd/xeyes
