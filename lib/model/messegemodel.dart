import 'dart:io';

import '../controller/messeg.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';

class messegemodel {
  String dataUrl = "https://192.168.0.7:443";

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
    var respose = await ioClient.get(url);
    var body = json.decode(respose.body);
    print('status code:${respose.statusCode} -> respuesta de mensaje');
    return todolist = messeg.fromJson(body);
  }
}
