// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_index.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BusinessFavoritePostControl on BusinessFavoritePostBase, Store {
  Computed<bool?>? _$getControlListsComputed;

  @override
  bool? get getControlLists => (_$getControlListsComputed ??= Computed<bool?>(
          () => super.getControlLists,
          name: 'BusinessFavoritePostBase.getControlLists'))
      .value;

  late final _$controlFavoriteAtom =
      Atom(name: 'BusinessFavoritePostBase.controlFavorite', context: context);

  @override
  bool? get controlFavorite {
    _$controlFavoriteAtom.reportRead();
    return super.controlFavorite;
  }

  @override
  set controlFavorite(bool? value) {
    _$controlFavoriteAtom.reportWrite(value, super.controlFavorite, () {
      super.controlFavorite = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'BusinessFavoritePostBase.selectedIndex', context: context);

  @override
  int? get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int? value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$BusinessFavoritePostBaseActionController =
      ActionController(name: 'BusinessFavoritePostBase', context: context);

  @override
  dynamic setSelectedIndex(int? value) {
    final _$actionInfo = _$BusinessFavoritePostBaseActionController.startAction(
        name: 'BusinessFavoritePostBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(value);
    } finally {
      _$BusinessFavoritePostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedIndex1(int value) {
    final _$actionInfo = _$BusinessFavoritePostBaseActionController.startAction(
        name: 'BusinessFavoritePostBase.setSelectedIndex1');
    try {
      return super.setSelectedIndex1(value);
    } finally {
      _$BusinessFavoritePostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setControlFavorite1(bool? value) {
    final _$actionInfo = _$BusinessFavoritePostBaseActionController.startAction(
        name: 'BusinessFavoritePostBase.setControlFavorite1');
    try {
      return super.setControlFavorite1(value);
    } finally {
      _$BusinessFavoritePostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controlFavorite: ${controlFavorite},
selectedIndex: ${selectedIndex},
getControlLists: ${getControlLists}
    ''';
  }
}
