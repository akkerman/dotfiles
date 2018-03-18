#!/usr/bin/env python3
# -*- coding: utf-8 -*-

""" get ip of some vm """
from subprocess import Popen, PIPE, check_output
import re
import sys


def vms():
    """ get current vms
    :returns: generator
    """
    proc = Popen(['VBoxManage', 'list', 'vms'], stdout=PIPE)
    while True:
        line = proc.stdout.readline()
        line = line.decode('utf-8')
        if line == '':
            break
        yield line.rstrip('\n')


def extract(vm_lines):
    """ extract tuple (name, id)
    :vms: vms
    :returns: generator
    """
    regex = re.compile('"(.+)" {(.+)}')
    for vm_line in vm_lines:
        match = regex.match(vm_line)
        yield (match.group(1), match.group(2))


def ip_addr(vm_tuples):
    """ get ip address of vm_tuples
    :vm_tuples: [(name, id)]
    :returns: generator
    """
    for (vm_name, _) in vm_tuples:
        command = ['VBoxManage', 'guestproperty', 'get',
                   vm_name, '/VirtualBox/GuestInfo/Net/1/V4/IP']

        ip_value = check_output(command)
        ip_value = ip_value.decode('utf-8')
        ip_value = ip_value.rstrip('\n')
        if 'Value:' in ip_value:
            ip_value = ip_value.split(' ')[1]

        yield (vm_name, ip_value)


def is_online(vm_name):
    """ checks if given vm is online """
    command = ['VBoxManage', 'showvminfo',
               vm_name, '--machinereadable']
    proc = Popen(command, stdout=PIPE)
    while True:
        line = proc.stdout.readline()
        line = line.decode('utf-8')
        if line == '':
            break
        if 'VMState' in line and 'running' in line:
            return True

    return False


def print_it(fmt, name, ip):
    """ print format to stdout """
    if fmt is None:
        fmt = '%vm% - %ip%'

    fmt = fmt.replace('%vm%', name)
    fmt = fmt.replace('%ip%', ip)

    print(fmt, end="")


def main():
    """ main ... """
    arglen = len(sys.argv)
    vm = sys.argv[1] if arglen >= 2 else ''
    online_fmt = sys.argv[2] if arglen >= 3 else None
    offline_fmt = sys.argv[3] if arglen >= 4 else online_fmt

    pipeline = ip_addr(extract(filter(lambda x: vm in x, vms())))
    for entry in pipeline:
        (name, ip) = entry
        fmt = online_fmt if is_online(name) else offline_fmt
        print_it(fmt, name, ip)


if __name__ == "__main__":
    main()
