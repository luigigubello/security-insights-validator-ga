#!/usr/bin/env python

import sys
import collections
import json

def main():
    input_json = json.loads(sys.argv[1])
    if "exec_error" in input_json.keys():
        print("**Execution Error:** {}</br>".format(input_json['exec_error']))
    else:
        if "errors" in input_json.keys():
            for item in input_json['errors']:
                print("⚠️ **Message:** {}</br>".format(item['message']))
                print("**Relative schema path:** {}</br>".format(list(collections.deque(item['relative_schema_path']))))
                if '$id' in item:
                    print("**$id:** {}</br>".format(item['$id']))
                print('</br>')
        else:
            print('No errors found')

if __name__ == "__main__":
    main()
