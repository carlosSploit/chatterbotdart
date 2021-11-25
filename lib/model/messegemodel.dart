import 'dart:io';

import '../controller/messeg.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';

class messegemodel {
  //String dataUrl = "https://192.168.0.7:443";
  String dataUrl = "https://chatterbotte.herokuapp.com/";

  Future<messeg> read(Map<String, dynamic> jsonAtri) async {
    String emisor = jsonAtri.containsKey('emisor') ? jsonAtri['emisor'] : "%20";
    messeg todolist = messeg.fromJson({});
    //------------- activar modo ssl ----------------
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);
    //-------------------------------------------------
    var url = Uri.parse('$dataUrl/app/chatbot/$emisor');
    var respose = await ((dataUrl.indexOf("chatterbotte") != -1)
        ? http.get(url)
        : ioClient.get(url));
    var body = json.decode(respose.body);
    print('status code:${respose.statusCode} -> respuesta de mensaje');
    return todolist = messeg.fromJson(body);
  }

  Future<List<Object>> report(Map<String, dynamic> jsonAtri) async {
    String nomb = jsonAtri.containsKey('nomb') ? jsonAtri['nomb'] : "%20";
    String num = jsonAtri.containsKey('num') ? jsonAtri['num'] : "%20";
    String corr = jsonAtri.containsKey('corr') ? jsonAtri['corr'] : "%20";
    String msseg = jsonAtri.containsKey('msseg') ? jsonAtri['msseg'] : "%20";
    List<Object> result = [];
    //-----------------------------------------------------------------
    if ((nomb != "") && (num != "") && (corr != "") && (msseg != "")) {
      String parat = "?messeg=" +
          msseg +
          "&nombre=" +
          nomb +
          "&numero=" +
          num +
          "&correo=" +
          corr;
      messeg todolist = messeg.fromJson({});
      //------------- activar modo ssl ----------------
      bool trustSelfSigned = true;
      HttpClient httpClient = new HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => trustSelfSigned);
      IOClient ioClient = new IOClient(httpClient);
      //-------------------------------------------------
      var url = Uri.parse('$dataUrl/app/correo$parat');
      var respose = await ((dataUrl.indexOf("chatterbotte") != -1)
          ? http.get(url)
          : ioClient.get(url));
      var body = json.decode(respose.body);
      print('status code:${respose.statusCode} -> respuesta de mensaje');
      result = [respose.statusCode, []];
      return result;
    } else {
      result = [
        400,
        [(nomb != ""), (num != ""), (corr != ""), (msseg != "")]
      ];
      return result;
    }
  }
}
