class SymbolTable(object):
    # symboles of a scope: ['name', 'type', 'kind', '#']
    def __init__(self):
        self.class_scope=[]
        self.subroutine_scope = []
        self.class_index = 0
        self.subroutine_index = 0
        self.class_name = None
        self.subroutine_name = 'main'

    def start_subroutine(self):
        self.subroutine_scope = []
        self.subroutine_index = 0

    def define(self, name, type_, kind):
        kind = kind.upper()
        if kind in ('STATIC', 'FIELD'):
            self.class_scope.append({'name': name, 'type': type_, 'kind': kind, 'index': self.class_index})
            self.class_index += 1
        elif kind in ('ARG', 'VAR'):
            self.subroutine_scope.append({'name': name, 'type': type_, 'kind': kind, 'index': self.subroutine_index})
            self.subroutine_index += 1

    def var_count(self, kind):
        assert kind in ('STATIC', 'FIELD', 'ARG', 'VAR')
        if kind in ('STATIC', 'FIELD'):
            return len(filter(lambda x: x['kind'] == kind, self.class_scope))
        elif kind in ('ARG', 'VAR'):
            return len(filter(lambda x:x['kind'] == kind, self.subroutine_scope))

    def kind_of(self, name):
        if name in self.subroutine_scope:
            return filter( lambda x: x['name'] == name, self.subroutine_scope)[0]['kind']
        elif name in self.class_scope:
            return filter( lambda x: x['name'] == name, self.class_scope)[0]['kind']
        else:
            return None

    def type_of(self, name):
        if name in self.subroutine_scope:
            return filter( lambda x: x['name'] == name, self.subroutine_scope)[0]['type_']
        elif name in self.class_scope:
            return filter( lambda x: x['name'] == name, self.class_scope)[0]['type_']

    def index_of(self, name):
        if name == self.subroutine_scope:
            return self.subroutine_index
        elif name == self.class_scope:
            return self.class_index
        else:
            return None