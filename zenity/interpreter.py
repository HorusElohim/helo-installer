#!/usr/bin/python3.6

import sys, getopt
import yaml

import argparse

ZENITY_TEMPLATE_FILE = 'zenity_list.template'
ZENITY_LIST_SH = "zenity_list.sh"


def main(argv):
    parser = argparse.ArgumentParser()

    parser.add_argument("-i", "--input", help="Raw input")
    parser.add_argument("-o", "--output", help="Output")
    parser.add_argument("-info", "--info", help="Info")

    args = parser.parse_args()

    if args.input and args.output and args.info:

        scripts = dict()
        scripts['scripts'] = []

        with open(args.input, 'r') as fdr:
            for line in fdr.readlines()[0].split(' '):
                script = dict()
                script['script-path'] = line.strip("\n")
                data = line.split("/")
                data.reverse()
                for i, var in enumerate(data):
                    if i == 0:
                        script['script'] = var.strip("\n")
                    elif i == 1:
                        script['module'] = var.strip("\n")
                    elif i == 2:
                        script['helo-dir'] = var.strip("\n")
                    elif i == 3:
                        script['helo-pkg'] = var.strip("\n")
                    elif i == 4:
                        script['helo-path'] = [var.strip("\n")]
                    else:
                        script['helo-path'].append(var.strip("\n"))

                script['helo-path'].reverse()
                script['helo-path'] = "/".join(script['helo-path'])
                scripts['scripts'].append(script)
            fdr.close()

        with open(args.output, 'w') as fdw:
            yaml.dump(scripts, fdw)
            fdw.close()

        # Write Zenity list script
        with open(ZENITY_TEMPLATE_FILE, 'r') as fdr:
            zenity_list_template = fdr.read()

        # Make zenity line
        lines = []
        for script in scripts['scripts']:
            temp_line = []
            temp_line.append('Found')
            temp_line.append(script['script-path'])
            temp_line.append(script['helo-pkg'])
            temp_line.append(script['module'])
            temp_line.append(script['script'])
            temp_line.append('" "')
            temp_line.append("\\")
            lines.append(" ".join(temp_line))

        zenity_data = "\n".join(lines)
        zenity_list_cmd = zenity_list_template.replace("@list_data", zenity_data)
        with open(ZENITY_LIST_SH, 'w') as fdw:
            fdw.write(zenity_list_cmd)

        with open(args.info, 'w') as fdw:
            fdw.write("Bravo you manage to find " + str(len(lines)) + " scripts")


if __name__ == "__main__":
    main(sys.argv[1:])
