import 'package:flutter/material.dart';



class disease {
  String _engName;
  String _arName;
  String _cure;

  disease(this._engName, this._arName,  this._cure);

  String get engNamr => _engName;

  String get arName => _arName;

  String get cure => _cure;

}