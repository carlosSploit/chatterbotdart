import 'package:chatbotdart/model/messegemodel.dart';
import 'package:chatbotdart/controller/messeg.dart';

class tdd{
  messegemodel msbd = messegemodel();

  Future<messeg> read(Map<String, dynamic> jsonAtri) async {
    messeg msg = await msbd.read(jsonAtri);
    if (msg != null){
      print("Prueba exitosa");
       return msg;
    } else{
      print("Prueba erronea bota un null");
      return messeg.fromJson({});
    }
  }

  //Future<List<Object>> report(Map<String, dynamic> jsonAtri) async {
  //  return
  //}
}

void main() async {
  tdd pruebas = tdd();
  messeg msg = await pruebas.read({});
}