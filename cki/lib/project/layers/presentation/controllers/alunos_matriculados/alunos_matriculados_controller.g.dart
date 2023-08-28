// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunos_matriculados_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunosMatriculado on _AlunosMatriculado, Store {
  late final _$studentDataEntityAtom =
      Atom(name: '_AlunosMatriculado.studentDataEntity', context: context);

  @override
  StudentDataEntity? get studentDataEntity {
    _$studentDataEntityAtom.reportRead();
    return super.studentDataEntity;
  }

  @override
  set studentDataEntity(StudentDataEntity? value) {
    _$studentDataEntityAtom.reportWrite(value, super.studentDataEntity, () {
      super.studentDataEntity = value;
    });
  }

  late final _$studenteListAtom =
      Atom(name: '_AlunosMatriculado.studenteList', context: context);

  @override
  ObservableList<StudentDataEntity> get studenteList {
    _$studenteListAtom.reportRead();
    return super.studenteList;
  }

  @override
  set studenteList(ObservableList<StudentDataEntity> value) {
    _$studenteListAtom.reportWrite(value, super.studenteList, () {
      super.studenteList = value;
    });
  }

  @override
  String toString() {
    return '''
studentDataEntity: ${studentDataEntity},
studenteList: ${studenteList}
    ''';
  }
}
