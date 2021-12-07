#!/bin/bash

export CLICOLOR=TRUE
xrdb ~/.Xresources > /tmp/source_xterm_config 2>&1 || true