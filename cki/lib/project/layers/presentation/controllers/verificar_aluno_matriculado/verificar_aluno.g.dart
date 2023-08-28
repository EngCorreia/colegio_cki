// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verificar_aluno.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerificarAlunosMatriculado on _VerificarAlunosMatriculado, Store {
  late final _$isStudentAtom =
      Atom(name: '_VerificarAlunosMatriculado.isStudent', context: context);

  @override
  bool get isStudent {
    _$isStudentAtom.reportRead();
    return super.isStudent;
  }

  @override
  set isStudent(bool value) {
    _$isStudentAtom.reportWrite(value, super.isStudent, () {
      super.isStudent = value;
    });
  }

  @override
  String toString() {
    return '''
isStudent: ${isStudent}
    ''';
  }
}
