// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_course_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReadCourseController on _ReadCourseController, Store {
  late final _$courseListAtom =
      Atom(name: '_ReadCourseController.courseList', context: context);

  @override
  ObservableList<Course> get courseList {
    _$courseListAtom.reportRead();
    return super.courseList;
  }

  @override
  set courseList(ObservableList<Course> value) {
    _$courseListAtom.reportWrite(value, super.courseList, () {
      super.courseList = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_ReadCourseController.status', context: context);

  @override
  String? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  @override
  String toString() {
    return '''
courseList: ${courseList},
status: ${status}
    ''';
  }
}
