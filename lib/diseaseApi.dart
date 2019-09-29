import 'package:http/http.dart' as http;
import 'dart:convert';
import 'disease.dart';
import 'dart:io';



class diseaseApi {


  Future<int> fetChdisease() async {

var index = -1;

    var baseUrl = 'http://192.168.8.162:5555';
    var response = await http.get(baseUrl);
    print('get');
    print(response.statusCode);
    print(response.body);
    print(response.body.runtimeType);
    var jsonData = jsonDecode(response.body);

    var data = jsonData["Class"].toString();
    var splt = data.split('__');
    var name = splt[1].replaceAll('_', ' ');
    if(name.replaceAll("_", " ").contains("Spider")){
      index =0;
    }else{
      index = 1;
    }

    return index;
  }
}