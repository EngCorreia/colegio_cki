// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_teachers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReadTeachersController on _ReadTeachersController, Store {
  late final _$teacherListAtom =
      Atom(name: '_ReadTeachersController.teacherList', context: context);

  @override
  ObservableList<TeachersEntity> get teacherList {
    _$teacherListAtom.reportRead();
    return super.teacherList;
  }

  @override
  set teacherList(ObservableList<TeachersEntity> value) {
    _$teacherListAtom.reportWrite(value, super.teacherList, () {
      super.teacherList = value;
    });
  }

  @override
  String toString() {
    return '''
teacherList: ${teacherList}
    ''';
  }
}
