# pylint: disable=C0111
# -*- coding: utf-8 -*-
""" get ip of some vm """
from subprocess import Popen, PIPE, check_output
import re

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
    :vm_tuples: TODO
    :returns: TODO
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


class Py3status:
    text = '-'
    vm_name = ''

    def _get_ipaddr(self):
        pipeline = ip_addr(extract(filter(lambda x: self.vm_name in x, vms())))
        for (_, addr) in pipeline:
            return addr

    def vm_ip(self):
        """ get vm ip
        :returns: TODO
        """
        ipaddr = self._get_ipaddr()

        if ipaddr is None or 'No value' in ipaddr:
            color = self.py3.COLOR_BAD
            if ipaddr is None:
                ipaddr = 'vm not found'
        else:
            color = self.py3.COLOR_GOOD

        full_text = '{}: {}'.format(self.text, ipaddr)

        return {
            'full_text': full_text,
            'color': color,
            'cached_until': self.py3.CACHE_FOREVER
            }
