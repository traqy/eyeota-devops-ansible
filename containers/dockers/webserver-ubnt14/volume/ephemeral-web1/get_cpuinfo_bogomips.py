#!/usr/bin/python

import re
from ansible.module_utils.basic import *

def get_bogomips():
    fname='/proc/cpuinfo'
    with open(fname) as f:
        content = f.readlines()
        if (re.match('^bogomips.+$',content)):
            label, val = re.split(':',content)
            val = val.lstrip()
            return val
    return ''

def main():

    module = AnsibleModule(argument_spec={})
    response = {"bogomips": get_bogomips()}
    module.exit_json(changed=False, meta=response)


if __name__ == '__main__':  
    main()