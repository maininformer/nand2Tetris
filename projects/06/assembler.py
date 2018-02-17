class Parser(object):
    def __init__(self, filename):
       self.file_obj = open(filename, 'rb')
       self.current_command = None
    def __enter__(self):
        return self.file_obj
    def __exit__(self, type, value, traceback):
        self.file_obj.close()
    def has_more_commands(self):
        return None
    def advance(self):
        self.current_command = self.file_obj.readline()
        return self.current_command
    @property
    def command_type(self):
        if self.current_command[0] == '@':
            return 'A_COMMAND'
        elif self.current_command[0] == '(':
            return 'L_COMMAND'
        else:
            return 'C_COMMAND'
    def symbol(self):
        if self.command_type == 'A_COMMAND':
            return self.current_command[1:]
        elif self.command_type == 'L_COMMAND':
            return self.current_command[1:-1]
        else:
            return None
    def dest(self):
        if self.command_type == 'C_COMMAND':
            equal_sign = self.current_command.find('=')
            if not equal_sign == -1:
                return self.current_comment[:equal_sign]
            else:
                return None
    def comp(self):
        if self.command_type == 'C_COMMAND':
            beginning = self.current_command.find('=')
            if beginning == -1:
                beginning = 0
            ending = self.current_command.find(';')
            # extraneous step but helps clarification
            # if the ';' was not found, set it to the last char
            if ending == -1:
                ending = -1
            if ending == -1:
                return self.current_command[beginning:]
            else:
                return self.current_command[beginning:ending]

    def jump(self):
        if self.command_type == 'C_COMMAND':
            semi_colon = self.current_command.find(';')
            if semi_colon != -1:
                return self.current_command[semi_colon+1:]
            else:
                return None

class Code(object):
    def dest(mnemonic):
        return_value = ['0', '0', '0']
        if 'M' in mnemonic:
            return_value[2] = '1'
        if 'A' in mnemonic:
            return_value[0] = '1'
        if 'D' in mnemonic:
            return_value[1] = '1'
        return ''.join(return_value)
    def comp(mnemonic):
        ...
        return
    def jump(mnemonic):
        # no need to be smarter
        decode = {
          None: '000',
          'JGT': '001',
          'JEQ': '010',
          'JGE': '011',
          'JLT': '100',
          'JNE': '101',
          'JLE': '110',
          'JMP': '111'
        }
        return decode[mnemonic]
