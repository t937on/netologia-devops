#!/usr/bin/python

# Copyright: (c) 2024, My Name <my.name@example.org>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r'''
---
module: my_own_module

short_description: This is my test module

version_added: "1.0.0"

description: This module creates a text file at a path with content.

options:
    path:
        description: The path where the file will be created.
        required: true
        type: str
    content:
        description: The content to write into the file.
        required: true
        type: str

author:
    - My Name (@myGitHubHandle)
'''

EXAMPLES = r'''
# Create a file with content
- name: Create a text file
  my_own_namespace.yandex_cloud_elk.my_own_module:
    path: tmp/myfile.txt
    content: "Hello, World!"
'''

RETURN = r'''
original_path:
    description: The original path param that was passed in.
    type: str
    returned: always
    sample: 'tmp/myfile.txt'
message:
    description: The output message indicating the result of the module execution.
    type: str
    returned: always
    sample: 'File created successfully'
'''

from ansible.module_utils.basic import AnsibleModule
import os

def run_module():
    module_args = dict(
        path=dict(type='str', required=True),
        content=dict(type='str', required=True)
    )
    
    result = dict(
        changed=False,
        original_path='',
        message=''
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    path = module.params['path']
    content = module.params['content']
   
    if os.path.exists(path):
        with open(path, 'r') as existing_file:
            current_content = existing_file.read()
            if current_content == content:
                module.exit_json(**result)
                
    if module.check_mode:
        result['message'] = 'Check mode enabled; no changes made.'
        module.exit_json(**result)

    try:
        with open(path, 'w') as new_file:
            new_file.write(content)

        result['changed'] = True
        result['original_path'] = path
        result['message'] = 'File created successfully'

    except Exception as e:
        module.fail_json(msg='Failed to create file at {}. Error: {}'.format(path, str(e)), **result)
    
    
    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()

