

class Dashboard{
  var _image;
  var _tittle;
  var _subTittle;

  Dashboard({var image,var tittle,var subTittle}){
   this._image = image;
   this._tittle = tittle;
   this._subTittle = subTittle;
   }

  get image => _image;

  set image(value) {
    _image = value;
  }

  get tittle => _tittle;

  get subTittle => _subTittle;

  set subTittle(value) {
    _subTittle = value;
  }

  set tittle(value) {
    _tittle = value;
  }
}