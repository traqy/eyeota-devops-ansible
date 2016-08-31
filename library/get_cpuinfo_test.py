#!/usr/bin/python

import re
import traceback

from ansible.module_utils.basic import *

def get_cpu_infos():

    cpu_infos = []
    fname='/proc/cpuinfo'
    try:
        with open(fname) as fp:
            ctr = 0
            entry = {}
            for line in fp:
                line = line.rstrip('\n')

                if (re.search('^\s*$',line)):
                    cpu_infos.append(entry)
                    entry = {}
                    ctr += 1
                else:

                    #print line
                    if (re.search('^flags', line)):
                        print "debug"
                    label, val = re.split(':',line,2)
                    label = label.rstrip()
                    val = val.lstrip()

                    entry.setdefault(label, val)

        fp.close()
        return cpu_infos

    except:
        msg = traceback.print_exc()
        pass
    return []

def get_cpu_infos_sum_bogomips(cpu_infos):
    sum_bogomips = 0.00
    try:
        for cpuinfo in cpu_infos:
            bogomips = float(cpuinfo.get('bogomips'))
            sum_bogomips+=bogomips

        return sum_bogomips
    except:
        pass
        return sum_bogomips

def get_cpu_infos_total_cpu_cores(cpu_infos):
    total_cput_cores = 0
    try:
        for cpuinfo in cpu_infos:
            bogomips = int(cpuinfo.get('cpu cores'))
            total_cput_cores+=bogomips

        return total_cput_cores
    except:
        pass
        return total_cput_cores

def main():

    try:
        cpu_infos = get_cpu_infos()
        sum_bogomips = get_cpu_infos_sum_bogomips(cpu_infos)
        total_cpu_cores = get_cpu_infos_total_cpu_cores(cpu_infos)
        module = AnsibleModule(argument_spec={})
        ansible_cpu_bogomips_total = {"ansible_total_cpu_cores" : total_cpu_cores,  "ansible_total_sum_bogomips": sum_bogomips}
        module.exit_json(changed=False, ansible_facts=ansible_cpu_bogomips_total)
    except:
        pass



if __name__ == '__main__':  
    main()