// "0": {
//   "depart": "EAP3058163-FLAT EN MIRAFLORES ",
//   "costo": "S/ 968,857",
//   "result": "Miraflores, Lima, Lima(ver mapa)",
//   "url": "https://gojom.pe/vendo/departamento/eap3058163-flat-en-miraflores--dd4cfacc48",
//   "img": {
//     "0": "https://images.casas360.pe/store/property-pictures/AV-59875844/large/f261fefe42",
//     "1": "https://images.casas360.pe/store/property-pictures/AV-59875844/large/3625051966",
//     "2": "https://images.casas360.pe/store/property-pictures/AV-59875844/large/89279cb215",
//     "3": "https://images.casas360.pe/store/property-pictures/AV-59875844/large/8991c5ba96",
//     "4": "https://images.casas360.pe/store/property-pictures/AV-59875844/large/9f69f2e229"
//   },
//   "urlg": "https://gojom.pe/"
// },

import 'package:chatbotdart/controller/espesifiimbueble.dart';

class inmueble {
  int idinmueble = 0;
  String nombre = "";
  String costo = "";
  String localizacion = "";
  String urlloque = "";
  late List<String> imglist = [];
  late espesifiimbueble espesific;

  int get getidmesseg => idinmueble;
  String get getnombre => nombre;
  String get getlocalizacion => localizacion;
  String get geturlloque => urlloque;
  List<String> get getimglist => imglist;
  espesifiimbueble get getespesific => espesific;

  inmueble.fromJson(Map<String, dynamic> json) {
    idinmueble = (json.containsKey("id")) ? json["id"] : 0;
    nombre = ((json.containsKey("depart")) ? json["depart"] : "desconocido")
        as String;
    costo = json.containsKey("costo") ? json["costo"] : "S/.0.0";
    localizacion = json.containsKey("result") ? json["result"] : "desconocido";
    urlloque = json.containsKey("url") ? json["url"] : "https://gojom.pe/";
    //ingresar la lista de imagenes al objeto
    if (json.containsKey("img")) {
      Map<String, dynamic> body = json['img'];
      for (var i = 0; i < 6; i++) {
        if (body.containsKey("$i")) {
          imglist = body["$i"];
        }
      }
    }
    //ingresar espesificaciones del inmueble
    espesific =
        espesifiimbueble.fromJson(json.containsKey("espe") ? json["espe"] : {});
  }
}
