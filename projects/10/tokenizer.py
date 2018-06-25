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

    def advance_line(self):
        temp = self.file_object.readline()
        if temp == '':
            self.has_more_tokens = False
        else:
            temp = re.sub(r'//.*|/\*.*|/\*\*.*', '', temp)
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

    def token_type(self):
        if self.current_token in self.keywords:
            return 'KEYWORD'
        elif self.current_token in self.symbols:
            return 'SYMBOL'
        elif re.match(r'[A-za-z_][A-Za-z0-9_]*', self.current_token):
            return 'IDENTIFIER'
        elif re.match(r'[0-9]*$', self.current_token):
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
