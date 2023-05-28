import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class CarState with ChangeNotifier{
  String state = "";
  void setState(String state){
    this.state = state;
    notifyListeners();
  }
}

