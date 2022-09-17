import 'dart:async';

import 'package:nam_app/src/validators/validations.dart';

class LoginBloc {
 StreamController _userController = new StreamController();
 StreamController _passController = new StreamController();

 Stream get userStream => _userController.stream;
 Stream get passStream => _passController.stream;

 bool isValidInfo(String username, String password){
   if(!Validations.isValidUser(username)){
     _userController.sink.addError("User name khong hop le");
     return false;
   }else{
     _userController.sink.add("OK");
   }

   if(!Validations.isValidPass(password)){
     _passController .sink.addError("Password khong hop le");
     return false;
   }else{
     _passController.sink.add("OK");
   }
   return true;
 }
 void dispocse(){
   _userController.close();
   _passController.close();
 }
}