class Parser(object):
    def __init__(self, filename):
        self.file_object = open(filename, 'rb')
        self.current_line = None
        self.current_command = None

    def has_more_lines(self):
        # probe the next line, and reset if
        # there is one
        last_pos = self.file_object.tell()
        read = self.file_object.readline()
        if read == '':
            return False
        self.file_object.seek(last_pos)
        return True

    def advance(self):
        line = self.file_object.readline()
        # clean comments
        comment_start = line.find('//')
        if comment_start != -1:
            line = line[:comment_start]
        self.current_line = line.strip()
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
            if command == 'pop':
                self.current_command = 'C_POP'
                return self.current_command
            if command == 'label':
                self.current_command = 'C_LABEL'
                return self.current_command
            if command == 'goto':
                self.current_command = 'C_GOTO'
                return self.current_command
            if command == 'if-goto':
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
        elements = self.current_line.split()
        if len(elements) > 1:
            return elements[1]

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
