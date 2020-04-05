#!/usr/bin/env python

from ansible.module_utils.basic import AnsibleModule

def check_required_commands(module, commands):
    missing_commands = []

    for command in commands:
        rc, out, err = module.run_command(command)
        if rc != 0 and 'No such file or directory' in err:
            module.fail_json(msg=('rc: %s\nout: %s\nerr: %s' % (rc, out, err)))

    return commands


def main():
    # Setup the Ansible module
    module = AnsibleModule(
        argument_spec=dict(
            state=dict(default='present', choices=['present', 'absent', 'latest']),
            name=dict(required=True, type='list')
        ),
        supports_check_mode=True
    )
    module._debug = True

    # Check dependencies are present: pacman
    missing_required_commands = check_required_commands(module, ['bajaras'])
    if missing_required_commands:
        module.fail_json(msg='Missing required commands: %s' % ','.join(missing_required_commands))


if __name__ == '__main__':
    main()
