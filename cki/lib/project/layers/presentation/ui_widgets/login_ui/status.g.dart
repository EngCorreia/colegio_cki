// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Status on _Status, Store {
  late final _$_statusAtom = Atom(name: '_Status._status', context: context);

  @override
  String? get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(String? value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_StatusActionController =
      ActionController(name: '_Status', context: context);

  @override
  dynamic setStatus(String? value) {
    final _$actionInfo =
        _$_StatusActionController.startAction(name: '_Status.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_StatusActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
