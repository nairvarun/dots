#!/bin/bash

cat $HOME/.barrel/.packages.txt | grep -o -P '(?<=o )\S+' | xargs sudo pacman -S --noconfirm
