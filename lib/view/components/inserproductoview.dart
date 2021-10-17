import 'package:chatbotdart/configinterface.dart';
import 'package:chatbotdart/model/messegemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:keyboard_visibility/keyboard_visibility.dart';

// ignore: camel_case_types, must_be_immutable
class inserproductoview extends StatefulWidget {
  bool toquenedit1 = false;
  //bool toquenedit2 = false;
  ValueChanged<int> accionrecarga;
  // memoria cache de los itens de cliente y trabajador
  BuildContext? contextgeneral;
  late configinterface config;
  //---------------------------------------------------
  var state;
  int idedittext = -1;
  int idusuario = 0;
  String tipo = "";
  var controller;
  String path = "";
  BuildContext? context;

  inserproductoview(this.accionrecarga);
  //lista de labels
  List<String> list = ["Nombre: ", "Numero: ", "Correo: ", "Messege: "];
  // lista de controladores
  List<TextEditingController> listcontroler = [
    TextEditingController(text: ""), //Nombre
    TextEditingController(text: ""), //Numero
    TextEditingController(text: ""), //Correo
    TextEditingController(text: ""), //Messege
  ];
  List<bool> listvalide = [
    false, //Nombre
    false, //Numero
    false, //Correo
    false, //Messege
  ];
  // tipo de trabajador
  int idindextra = 0;

  @override
  contentserbody createState() => contentserbody();

  createDialog(BuildContext context) {
    // this.contextgeneral = context;
    config = configinterface(context);
    this.context = context;
    var size = MediaQuery.of(context).size;

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        contextgeneral = context;
        return StatefulBuilder(
          builder: (context, setState) {
            state = setState;
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: contenedorDate(size, context),
            );
          },
        );
      },
    );
  }

  Widget contenedorDate(Size size, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: config.getsizeaproxhight(500),
          //height: 400,
          width: size.width - 10,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Imagen de perfil del usuario
                  // ---------------------------------------------
                  Container(
                    //color: Colors.grey,
                    height: config.getsizeaproxhight(120),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: size.width - 10,
                                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                      child: Text(
                                        "Registro de reclamos",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF0c84fc)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Icon(
                                            Icons.arrow_back_outlined,
                                            size: config.getsizeaproxhight(30),
                                            color: Color(0xFF0c84fc)
                                                .withOpacity(0.9),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  child: Text(
                                    "Porfavo Complete las casillas y abstengase de dejarlas en blannco",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xff707070)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 25, 0),
                        color: Colors.white,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              iteninfo(context, Icons.person,
                                  this.list[0].toString(), "", 0),
                              iteninfo(context, Icons.person,
                                  this.list[1].toString(), "", 1),
                              iteninfo(context, Icons.person,
                                  this.list[2].toString(), "", 2),
                              iteninfo(context, Icons.person,
                                  this.list[3].toString(), "", 3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          insertartrabajador();
                        },
                        child: Container(
                          height: config.getsizeaproxhight(50),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ingresar Trabajador",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF0c84fc).withOpacity(0.8),
                            //color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }

  void insertartrabajador() async {
    messegemodel msmod = messegemodel();
    //print(controller.getidusser);
    List<Object> stado = await msmod.report({
      "nomb": listcontroler[0].text,
      "num": listcontroler[1].text,
      "corr": listcontroler[2].text,
      "msseg": listcontroler[3].text,
    }) as List<Object>;

    switch ((stado[0] as int)) {
      case 200:
        limpliesa();
        state(() {
          // mensajealert().customShapeSnackBar(
          //     this.contextgeneral as BuildContext,
          //     "Se a insertado el trabajador correctamente",
          //     "T");
          print("Se a insertado el trabajador correctamente");
        });
        break;
      default:
        validar((stado[1] as List<bool>));
        state(() {
          // mensajealert().customShapeSnackBar(
          //     this.contextgeneral as BuildContext,
          //     "Parece que hay una advertencia",
          //     "R");
          print("Parece que hay una advertencia");
        });
    }
  }

  void limpliesa() {
    listcontroler[0].text = "";
    listcontroler[1].text = "";
    listcontroler[2].text = "";
    listcontroler[3].text = "";
    this.path = "";
  }

  void limpestade() {
    for (var i = 0; i < listvalide.length; i++) {
      listvalide[i] = false;
    }
  }

  void validar(List<bool> list) {
    for (var i = 0; i < list.length; i++) {
      listvalide[i] = list[i];
    }
  }

  Widget iteninfo(
      BuildContext context, IconData icon, String label, var info, int inx) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              //color: Colors.black,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: config.getsizeaproxhight(24),
                  color: Color(0xFF0c84fc).withOpacity(0.8),
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              height: config.getsizeaproxhight(60),
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text(
                      "$label",
                      style: TextStyle(
                          fontSize: config.getsizeaproxhight(14),
                          color: Color(0xFF707070).withOpacity(0.5),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: Container(
                        child: Container(
                          height: config.getsizeaproxhight(40),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: TextField(
                                    //focusNode: _focus[inx],
                                    keyboardType: (inx == 1)
                                        ? TextInputType.number
                                        : TextInputType.text,
                                    style: TextStyle(
                                      fontSize: config.getsizeaproxhight(15),
                                    ),
                                    controller: listcontroler[inx],
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Escribe un mensaje'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                            border: Border.all(
                              color: (listvalide[inx])
                                  ? Colors.red
                                  : Color(0xFF0c84fc).withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                      flex: 8,
                    ),
                  ),
                ],
              ),
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class contentserbody extends State<inserproductoview> {
  contentserbody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Container();
    //***********************************************/;
  }
}
