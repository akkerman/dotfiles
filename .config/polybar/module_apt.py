#!/usr/bin/python3
# -*- coding: utf-8 -*-

from subprocess import check_output, STDOUT


output = check_output(
    ['/usr/lib/update-notifier/apt_check.py'],
    stderr=STDOUT).decode()

u, c = [int(s) for s in output.split(';')]
t = u + c

out = ''

if t > 0:
    out += str(t)

if c > 0:
    out += '!'

print(out)
