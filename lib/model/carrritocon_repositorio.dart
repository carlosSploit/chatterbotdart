import '../controller/messeg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class messegemodel {
  String dataUrl = "https://192.168.0.7:443";

  Future<messeg> read(Map<String, dynamic> jsonAtri) async {
    String emisor = jsonAtri.containsKey('emisor') ? jsonAtri['emisor'] : "";
    messeg todolist = messeg.fromJson({});
    var url = Uri.parse('$dataUrl/app/chatbot/$emisor');
    var respose = await http.get(url);
    var body = json.decode(respose.body);
    print('status code:${respose.statusCode} -> respuesta de mensaje');
    return todolist = messeg.fromJson(body);
  }
}
