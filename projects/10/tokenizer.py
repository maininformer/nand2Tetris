import re

class Tokenizer(object):
    def __init__(self, file_address):
        self.file_object = open(file_address, 'rb')
        self.current_token = None
        self.current_line = []
        self.has_more_tokens = True

        self.keywords = [
           'class',
           'constructor',
           'function',
           'method',
           'field',
           'static',
           'var',
           'int',
           'char',
           'boolean',
           'void',
           'true',
           'false',
           'null',
           'this',
           'let',
           'do',
           'if',
           'else',
           'while',
           'return'
        ]

        self.symbols = [
            '{',
            '}',
            '(',
            ')',
            '[',
            ']',
            '.',
            ',',
            ';',
            '+',
            '-',
            '*',
            '/',
            '&',
            '|',
            '<',
            '>',
            '=',
            '~'
        ]

    @staticmethod
    def add_white_space_around(text, symbol):
        return re.sub('{}'.format(re.escape(symbol)), ' {} '.format(re.escape(symbol)), text)

    @staticmethod
    def take_string_constant_out(line):
        first_quote_index = line.find('"')
        first_half_of_line = line[0:first_quote_index]
        second_quote_index = len(first_half_of_line) + line[first_quote_index + 1:].find('"') + 1 # this final 1 is for the 1 character lost in first_quote_index + 1 find
        string_constant = line[first_quote_index: second_quote_index + 1]
        first_half = line[0:first_quote_index]
        second_half = line[second_quote_index + 1:]
        return first_half, string_constant, second_half

    def advance_line(self):
        temp = self.file_object.readline()
        if temp == '':
            self.has_more_tokens = False
        else:
            # remove comments
            temp = re.sub(r'//.*|/\*.*|/\*\*.*', '', temp)
            # wrap symbols with whitespace
            for symbol in self.symbols:
                temp = Tokenizer.add_white_space_around(temp, symbol)
            temp = temp.replace('\\', '')
            if temp.find('"') > -1:
                # cut away the sting constant
                first, string_constant, second = Tokenizer.take_string_constant_out(temp)
                self.current_line = first.split() + [string_constant] + second.split()
                return
            else:
                self.current_line = temp.split()
                return

    def advance(self):
        if len(self.current_line) == 0:
            if self.has_more_tokens:
                self.advance_line()
                self.advance()
            else:
                return

        else:
           self.current_token = self.current_line.pop(0)
           return

    def convert_symbol(self):
        converter = {
            '>': '&gt;',
            '<': '&lt;',
            '&': '&amp;'
        }
        if self.current_token in converter.keys():
            self.current_token = converter[self.current_token]

    def token_type(self):
        if self.current_token in self.keywords:
            return 'KEYWORD'
        elif self.current_token in self.symbols:
            self.convert_symbol()
            return 'SYMBOL'
        elif re.match(r'[A-Za-z_][A-Za-z0-9_]*', self.current_token):
            return 'IDENTIFIER'
        elif re.match(r'[0-9]+$', self.current_token):
            number = int(self.current_token)
            if number > 0 and number < 32767:
                return 'INT_CONST'
        elif re.match(r'^\".*\"$', self.current_token):
            return 'STRING_CONST'

    def keyword(self):
        return self.current_token.lower()

    def symbol(self):
        return self.current_token

    def identifier(self):
        return re.match(r'[A-za-z_][A-Za-z0-9_]*', self.current_token).group(0)

    def intVal(self):
        return re.match(r'[0-9]*$', self.current_token).group(0)

    def stringVal(self):
        return re.match(r'^\".*\"$', self.current_token).group(0).strip('"').strip('\n')
