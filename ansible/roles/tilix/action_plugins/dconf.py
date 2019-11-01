# (c) 2019 Pedro Costa

# Make coding more python3-ish
from __future__ import absolute_import
__metaclass__ = type

from ansible.errors import AnsibleError
from ansible.plugins.action import ActionBase


class ActionModule(ActionBase):
    def run(self, tmp=None, task_vars=None):
        if task_vars is None:
            task_vars = dict()

        result = super(ActionModule, self).run(tmp, task_vars)
        del tmp  # tmp no longer has any effect

        # Extract arguments
        module_args = self._task.args.copy()
        content = module_args.get('content')
        source = module_args.get('src')

        # If source is not provided, or content is provided, exit early
        if source is None or content is not None:
            return result

        try:
            # Find the source file in expected paths
            source = self._find_needle('files', source)

            # Read source file into content
            with open(source, 'r') as f:
                content = f.read()

            # Update params with read content
            module_args.update(dict(content=content))

            # Execute the dconf module with the new arguments
            result.update(self._execute_module(module_name='dconf', module_args=module_args, task_vars=task_vars))

        except AnsibleError as e:
            result['failed'] = True
            result['msg'] = to_text(e)
            result['exception'] = traceback.format_exc()

        except OSError as err:
            result['failed'] = True
            result['msg'] = 'Failed to open source file in %s' % source

        return result
