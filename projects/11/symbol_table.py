class SymbolTable(object):
    def __init__(self):
        self.class_scope={}
        self.subroutine_scope = {}
        self.class_index = 0
        self.subroutine_index = 0
        self.class_name = None
        self.subroutine_name = None

    def start_subroutine(self):
        self.class_scope[self.subroutine_name] = self.subroutine_scope
        self.subroutine_scope = {}
        self.subroutine_index = 0

    def define(self, name, type_, kind):
        kind = kind.upper()
        if kind in ('STATIC', 'FIELD'):
            self.class_scope[name] = {'type': type_, 'kind': kind, 'index': self.class_index}
            self.class_index += 1
        elif kind in ('ARG', 'VAR'):
            self.subroutine_scope[name] = {'type': type_, 'kind': kind, 'index': self.subroutine_index}
            self.subroutine_index += 1

    def var_count(self, kind):
        assert kind in ('STATIC', 'FIELD', 'ARG', 'VAR')
        if kind in ('STATIC', 'FIELD'):
            return len(filter(lambda x: x['kind'] == kind, self.class_scope.values()))
        elif kind in ('ARG', 'VAR'):
            return len(filter(lambda x:x['kind'] == kind, self.subroutine_scope.values()))

    def kind_of(self, name):
        if name in self.subroutine_scope:
            return self.subroutine_scope[name]['kind']
        elif name in self.class_scope:
            plum()
            return self.class_scope[name][0]['kind']
        else:
            return None

    def type_of(self, name):
        if name in self.subroutine_scope:
            return self.subroutine_scope[name]['type_']
        elif name in self.class_scope:
            return self.class_scope[name]['type_']

    def index_of(self, name):
        if name in self.subroutine_scope:
            return self.subroutine_scope[name]['index']
        elif name in self.class_scope:
            return self.class_scope[name]['index']