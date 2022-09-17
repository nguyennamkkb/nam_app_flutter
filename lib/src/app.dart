import 'package:flutter/material.dart';
import 'package:nam_app/src/resources/login_page.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}