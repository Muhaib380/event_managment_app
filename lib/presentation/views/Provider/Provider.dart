import 'package:flutter/cupertino.dart';
import '../../../infrastructure/models/user.dart';

class UserProvider with ChangeNotifier{
  UserModel _model = UserModel();

  void setUser(UserModel model){
    _model = model;
    notifyListeners();
  }

  UserModel getUser() => _model;

}