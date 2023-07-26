
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/courses_entity/coures_entitiy.dart';

class CourseDto extends Course{
  int? _id;
  String? _classeName;
  int? _prices;
  String? _images;
  String? _description;
  String? _subTittle;


  CourseDto({String? classeName,int? prices,String? images,String? description,int? id,String? subTittle}) : super(
    classeName: classeName,
    description: description,
    images: images,
    prices: prices,
    id: id,
    subTittle: subTittle,
  ){

    _classeName = classeName;
    _prices = prices;
    _images = images;
    _description = description;
    _id = id;
    _subTittle = subTittle;

  }


  String? get subTittle => _subTittle;

  set subTittle(String? value) {
    _subTittle = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get classeName => _classeName;

  set classeName(String? value) {
    _classeName = value;
  }

  int? get prices => _prices;

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }

  String? get images => _images;

  set images(String? value) {
    _images = value;
  }

  set prices(int? value) {
    _prices = value;
  }

  List<Course> fromJsonList(List<QueryDocumentSnapshot<Map<String, dynamic>>> courseList){
    List<CourseDto> listCourse = [];
    listCourse.clear();
    for(var allCourse in courseList){
      listCourse.add(CourseDto(
        id: allCourse.data()["id"],
        classeName: allCourse.data()["name"],
        prices: allCourse.data()["prices"],
        images: allCourse.data()["imagesPath"],
        description: allCourse.data()["description"],
        subTittle: allCourse.data()["subTittle"]
      ));
    }

    return listCourse;
  }
}