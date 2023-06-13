
import 'package:mobx/mobx.dart';
part 'menu_index.g.dart';

class BusinessFavoritePostControl = BusinessFavoritePostBase with _$BusinessFavoritePostControl;
abstract class BusinessFavoritePostBase with Store {


  @observable
  bool? controlFavorite = false;

  @observable
  int? selectedIndex = 0;


  @action
  setSelectedIndex(int? value){
    if(value != null){
      selectedIndex = value;

      if(selectedIndex == 0) {
        // UserModel.intNotification = 1;
        setControlFavorite1(false);
      }

      if(selectedIndex == 1) {
        //  UserModel.intNotification = 1;
        setControlFavorite1(true);
      }

      if(selectedIndex == 2) {
        //  UserModel.intNotification = 1;
        setControlFavorite1(false);
      }
    }else{
      selectedIndex == 0;
    }
  }

  @action
  setSelectedIndex1(int value){
    if(value == 1) {
      controlFavorite = true;
    }
  }


  @action
  setControlFavorite1(bool? value){
    if(value != null){
      controlFavorite = value;
    }else{
      controlFavorite = false;
    }
  }

  @computed
  bool? get getControlLists => controlFavorite == true;

}