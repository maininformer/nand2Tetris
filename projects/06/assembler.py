import argparse

class Parser(object):
    def __init__(self, filename):
       self.file_obj = open(filename, 'rb')
       self.lines = self.file_obj.readlines()
       self.current_command = None
    def set_next_command(self, line):
        if line and len(line) > 0 :
            self.current_command = line.strip()
        return self
    @property
    def command_type(self):
        if len(self.current_command) > 0:
            if self.current_command[0:2] == '//':
                return 'COMMENT'
            elif self.current_command[0] == '@':
                return 'A_COMMAND'
            elif self.current_command[0] == '(':
                return 'L_COMMAND'
            elif self.current_command.find('=') != -1 or self.current_command.find(';') != -1:
                return 'C_COMMAND'
        return 'OTHER'
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
                return self.current_command[:equal_sign]
            else:
                return None
    def comp(self):
        if self.command_type == 'C_COMMAND':
            # even if the first statement returns -1 this will work
            beginning = self.current_command.find('=') + 1
            # if the ';' was not found, set it to the last char
            ending = self.current_command.find(';')
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
    @staticmethod
    def dest(mnemonic):
        return_value = ['0', '0', '0']
        if mnemonic and len(mnemonic) > 0 :
            if 'M' in mnemonic:
                return_value[2] = '1'
            if 'A' in mnemonic:
                return_value[0] = '1'
            if 'D' in mnemonic:
                return_value[1] = '1'
        return ''.join(return_value)
    @staticmethod
    def comp(mnemonic):
        decode = {
            '0': '0101010',
            '1': '0111111',
            '-1': '0111010',
            'D': '0001100',
            'A': '0110000',
            '!D': '0001101',
            '!A': '0110001',
            '-D': '0001111',
            '-A': '0110011',
            'D+1': '0011111',
            'A+1': '0110111',
            'D-1': '0001110',
            'A-1': '0110010',
            'D+A': '0000010',
            'D-A': '0010011',
            'A-D': '0000111',
            'D&A': '0000000',
            'D|A': '0010101',
            'M': '1110000',
            '!M': '1110001',
            '-M': '1110011',
            'M+1': '1110111',
            'M-1': '1110010',
            'D+M': '1000010',
            'D-M': '1010011',
            'M-D': '1000111',
            'D&M': '1000000',
            'D|M': '1010101'
        }
        return decode[mnemonic]
    @staticmethod
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

parser = argparse.ArgumentParser()
parser.add_argument("address", help="Address of the file to be compiles")
args = parser.parse_args()

filename_beginning = args.address.rfind('/') + 1
filename_ending = args.address.find('.asm')
output_filename = args.address[filename_beginning: filename_ending]

if __name__ == '__main__':
    output = []
    p = Parser(args.address)
    for line in p.lines:
        p.set_next_command(line)
        if p.command_type in ['A_COMMAND', 'L_COMMAND']:
            symbol = p.symbol()
            output.append(bin(int(symbol))[2:].zfill(16) + '\n')
        elif p.command_type == 'C_COMMAND':
            result_to_output = '111'
            result_to_output += Code.comp(p.comp())
            result_to_output += Code.dest(p.dest())
            result_to_output += Code.jump(p.jump())
            output.append(result_to_output + '\n')
    p.file_obj.close()
    with open('{}.hack'.format(output_filename), 'wb') as out:
        out.writelines(output)
