//  "espe": {
//     "total": "120m\u00b2",
//     "techado": "120m\u00b2",
//     "dorm.": "3",
//     "ba\u00f1os": "4",
//     "estac.": "1"
//   },

class espesifiimbueble {
  int idespesifiimbueble = 0;
  String total = "";
  String techado = "";
  String dorm = "";
  String banos = "";
  String estac = "";

  int get getidespesifiimbueble => idespesifiimbueble;
  String get gettotal => total;
  String get gettechado => techado;
  String get getdorm => dorm;
  String get getbanos => banos;
  String get getestac => estac;

  espesifiimbueble.fromJson(Map<String, dynamic> json) {
    idespesifiimbueble = (json.containsKey("id")) ? json["id"] : 0;
    total = (json.containsKey("total")) ? json["total"] : "";
    techado = json.containsKey("techado") ? json["techado"] : "";
    dorm = json.containsKey("dorm") ? json["dorm"] : "";
    banos = json.containsKey("baños") ? json["baños"] : "";
    estac = json.containsKey("estac") ? json["estac"] : "";
  }
}
