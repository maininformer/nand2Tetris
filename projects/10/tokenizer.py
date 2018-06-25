import re

class Tokenizer(object):
    def __init__(self, file_address):
        self.file_object = open(file_address, 'rb')
        self.current_token = None
        self.current_line = []
        self.has_more_tokens = True

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

