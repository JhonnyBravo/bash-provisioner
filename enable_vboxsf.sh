#!/bin/bash

user_name="$1"
gpasswd -a "$user_name" vboxsf
