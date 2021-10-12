// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contatos_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatosListBack on _ContatosListBack, Store {
  final _$listAtom = Atom(name: '_ContatosListBack.list');

  @override
  Future<List<Contato>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Contato>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ContatosListBackActionController =
      ActionController(name: '_ContatosListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ContatosListBackActionController.startAction(
        name: '_ContatosListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContatosListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
