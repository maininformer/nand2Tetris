class VMWriter(object):
    @staticmethod
    def write_push(segment, index):
        assert segment.upper() in (
                'CONSTANT',
                'ARG',
                'LOCAL',
                'STATIC',
                'THIS',
                'THAT',
                'POINTER',
                'TEMP'
        )
        return 'push {0} {1}\n'.format(segment.lower(), index)

    @staticmethod
    def write_pop(segment, index):
        assert segment in (
                'CONST',
                'ARG',
                'LOCAL',
                'STATIC',
                'THIS',
                'THAT',
                'POINTER',
                'TEMP'
        )
        return 'pop {0} {1}\n'.format(segment, index)

    @staticmethod
    def write_arithmetic(command):
        mapping = {
            '+': 'add',
            '*': 'call Math.multiply 2',
            '-': 'sub',
            '/': 'call Math.divide 2',
            '=': 'eq',
            '&gt': 'gt',
            '&lt': 'lt',
            '&amp': 'and',
            '|': 'or',
            '-': 'neg',
            '~': 'not'
        }
        assert command in mapping
        return '{0}\n'.format(mapping[command])

    @staticmethod
    def write_label(label):
        return 'label {0}\n'.format(label)

    @staticmethod
    def write_go_to(label):
        return 'goto {0}\n'.format(label)

    @staticmethod
    def write_if(label):
        return 'if-goto {0}\n'.format(label)

    @staticmethod
    def write_call(name, n_args):
        return 'call {0} {1}\n'.format(name, n_args)

    @staticmethod
    def write_function(name, n_locals):
        return 'function {0} {1}\n'.format(name, n_locals)

    @staticmethod
    def write_return():
        return 'return\n'