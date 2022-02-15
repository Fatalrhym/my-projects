#!/bin/bash

cat auth.log | grep -i "invalid user" | cut -d' ' -f8 | sort >> invalid_user.txt

cat auth.log | grep -i "invalid user" | cut -d' ' -f9 | sort >> invalid_user.txt

cat invalid_user.txt | grep -v "from" | grep -v "invalid" | grep -v "user" | grep -v "for" > invalid_user.txt