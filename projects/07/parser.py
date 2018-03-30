class Parser(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'rb')
        self.current_line = self.file_object.next()

    def has_more_lines(self):
        try:
            # probe the next line, and reset if
            # there is one
            last_pos = self.file_object.tell()
            self.file_object.readline()
            self.file_object.seek(last_post)
            return True
        except StopIteration:
            return False

    def advance(self):
        line = self.file_object.readline()
        # clean comments
        comment_start = line.find('//')
        if comment_start != -1:
            line = line[:comment_start]
        self.current_line = line
    def command_type(self):
        ARITHMETICS = [
            'add',
            'sub',
            'neg',
            'eq',
            'gt',
            'lt',
            'and',
            'or',
            'not',
        ]
        elements = self.current_line.split()
        if len(elements) > 0:
            command = elements[0]
            if command in ARITHMETICS:
                self.current_command = 'C_ARITHMETIC'
                return self.current_command
            if command == 'push':
                self.current_command = 'C_PUSH'
                return self.current_command
            if command == 'pull':
                self.current_command = 'C_PULL'
                return self.current_command
            if command == 'label':
                self.current_command = 'C_LABEL'
                return self.current_command
            if command == 'goto':
                self.current_command = 'C_GOTO'
                return self.current_command
            if command.find('if') == 0:
                self.current_command = 'C_IF'
                return self.current_command
            if command == 'function':
                self.current_command = 'C_FUNCTION'
                return self.current_command
            if command == 'return':
                self.current_command = 'C_RETURN'
                return self.current_command
            if command == 'call':
                self.current_command = 'C_CALL'
                return self.current_command
    def arg_1(self):
        if self.current_command == 'C_ARITHMETIC':
            return self.current_line.split()[0]
        if self.current_command == 'C_RETURN':
            return None
        return self.current_line.split()[1]

    def arg_2(self):
        ALLOWED = [
            'C_POP',
            'C_PUSH',
            'C_FUNCTION',
            'C_CALL',
        ]
        if self.current_command in ALLOWED:
            return self.current_line.split()[2]
        return None
