import 'package:chatbotdart/controller/inmueble.dart';

class messeg {
  int idmesseg = 0;
  String contenmesseg = "";
  String tipo = "";
  String tipolistinmueble = "";
  bool informacion = false;
  List<inmueble> listainmueble = [];

  int get getidmesseg => idmesseg;
  String get getcontenmesseg => contenmesseg;
  String get gettipo => tipo;
  bool get getinformacion => informacion;
  List<inmueble> get getlistainmueble => listainmueble;
  String get gettipolistinmueble => tipolistinmueble;

  messeg.fromJson(Map<String, dynamic> json) {
    idmesseg = (json.containsKey("id")) ? json["id"] : 0;
    contenmesseg =
        ((json.containsKey("messeg")) ? json["messeg"] : "") as String;
    tipo = json.containsKey("tipo") ? json["tipo"] : "R";
    //informacion del mensaje
    if (json.containsKey("Recomend") ||
        json.containsKey("Favorit") ||
        json.containsKey("Comprar") ||
        json.containsKey("alquiler")) {
      // detectar que clase de iten
      int indicator = json.containsKey("Recomend")
          ? 1
          : (json.containsKey("Favorit")
              ? 2
              : (json.containsKey("Comprar")
                  ? 3
                  : (json.containsKey("alquiler") ? 4 : 0)));
      // teniendo en cuenta el key, se captura los datos de una forma
      switch (indicator) {
        case 1:
          Map<String, dynamic> body = json['Recomend'];
          for (var i = 0; i < 6; i++) {
            if (body.containsKey("$i")) {
              listainmueble.add(inmueble.fromJson(body["$i"]));
            }
          }
          tipolistinmueble = "Recomend";
          break;
        case 2:
          Map<String, dynamic> body = json['Favorit'];
          for (var i = 0; i < 6; i++) {
            if (body.containsKey("$i")) {
              listainmueble.add(inmueble.fromJson(body["$i"]));
            }
          }
          tipolistinmueble = "Favorit";
          break;
        case 3:
          Map<String, dynamic> body = json['Comprar'];
          for (var i = 0; i < 6; i++) {
            if (body.containsKey("$i")) {
              listainmueble.add(inmueble.fromJson(body["$i"]));
            }
          }
          tipolistinmueble = "Comprar";
          break;
        case 4:
          Map<String, dynamic> body = json['alquiler'];
          for (var i = 0; i < 6; i++) {
            if (body.containsKey("$i")) {
              listainmueble.add(inmueble.fromJson(body["$i"]));
            }
          }
          tipolistinmueble = "alquiler";
          break;
        default:
      }
      informacion = true;
    }
  }
}
