// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listagem_de_turma_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Listagem on _Listagem, Store {
  late final _$turmaEntityAtom =
      Atom(name: '_Listagem.turmaEntity', context: context);

  @override
  TurmaEntity? get turmaEntity {
    _$turmaEntityAtom.reportRead();
    return super.turmaEntity;
  }

  @override
  set turmaEntity(TurmaEntity? value) {
    _$turmaEntityAtom.reportWrite(value, super.turmaEntity, () {
      super.turmaEntity = value;
    });
  }

  late final _$turmaListAtom =
      Atom(name: '_Listagem.turmaList', context: context);

  @override
  ObservableList<TurmaEntity> get turmaList {
    _$turmaListAtom.reportRead();
    return super.turmaList;
  }

  @override
  set turmaList(ObservableList<TurmaEntity> value) {
    _$turmaListAtom.reportWrite(value, super.turmaList, () {
      super.turmaList = value;
    });
  }

  @override
  String toString() {
    return '''
turmaEntity: ${turmaEntity},
turmaList: ${turmaList}
    ''';
  }
}
