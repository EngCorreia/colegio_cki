
import 'package:mobx/mobx.dart';
part 'coures_entitiy.g.dart';

class Course = _Course with _$Course;
abstract class _Course with Store{
  @observable
  String? _classeName;
  @observable
  int? _prices;
  @observable
  String? _images;
  @observable
  String? _description;
  @observable
  int? _id;
  @observable
  String? _subTittle;


  @action
  _Course({String? classeName,int? prices,String? images,String? description,int? id,String? subTittle}){

    _classeName = classeName;
    _prices = prices;
    _images = images;
    _description = description;
    _id = id;
    _subTittle = subTittle;

}


  String? get subTittle => _subTittle;

  @action
  setSubTittle(String? value) {
    _subTittle = value;
  }

  int? get id => _id;

  @action
  setId(int? value) {
    _id = value;
  }

  String? get classeName => _classeName;

  @action
  setClasseName(String? value) {
    _classeName = value;
  }

  int? get prices => _prices;

  String? get description => _description;

  @action
  setDescription(String? value) {
    _description = value;
  }

  String? get images => _images;

  @action
  setImages(String? value) {
    _images = value;
  }

  @action
  setPrices(int? value) {
    _prices = value;
  }
}