import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );

  UserModel get user => _userModel;

  void setUser(String user){
    _userModel = UserModel.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(UserModel user){
    _userModel = user;
    notifyListeners();
  }
}
