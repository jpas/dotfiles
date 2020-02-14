#!/bin/sh
if which bat &> /dev/null; then
  bat cache --build > /dev/null
fi
