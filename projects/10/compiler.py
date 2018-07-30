class Compiler(object):
    def __init__(self, file_address, compile_address):
        self.file_object = open(file_address, 'rb')
        self.compiled = open(compile_address, 'wb')
        self.current_line = self.advance()

    def advance(self):
        new_line = self.file_object.readline()
        if new_line == '':
            return
        else:
            return new_line.strip()
    def compileClass(self):
        self.compiled.write('<class>\n')

    def compileClassVarDec(self):
        pass
    def compileSubroutine(self):
        pass
    def compileParameterList(self):
        pass
    def compileVarDec(self):
        pass
    def compileStatements(self):
        pass
    def compileDo(self):
        pass
    def compileLet(self):
        pass
    def compileWhile(self):
        pass
    def compileReturn(self):
        pass
    def compileIf(self):
        pass
    def compileExpression(self):
        pass
    def compileTerm(self):
        pass
    def compileExpressionList(self):
        pass
