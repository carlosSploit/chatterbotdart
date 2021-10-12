import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/messegeview/components/botonsopciview.dart';
import '/messegeview/components/messengitentview.dart';
import '/my_flutter_app_icons.dart';
import '/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class messegeview extends StatefulWidget {
  @override
  messegebody createState() => messegebody();
}

class messegebody extends State<messegeview> {
  bool band = false; // ayuda a vizualizar el continido de la opciond e file
  bool bandmes = false; // ayuda a vizualizar messege o audio
  bool bandespo = false; // ayuda a vizualizar los botones
  bool bandespocont = false; // ayuda a vizualizar los botones
  bool stado = false;
  List<int> identif = [];
  String cantSelecx = "0";
  late TextEditingController textEditingController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: "");
    textEditingController.addListener(() {
      print(textEditingController.text);
      setState(() {
        if (textEditingController.text != "") {
          this.bandmes = true;
        } else {
          this.bandmes = false;
        }
      });
      //print('Listener fired ${textEditingController.text}');
    });
  }

  void actualizar() {
    setState(() {});
    band = !band;
  }

  void responder(int id) {
    setState(() {});
    // recorre la lista y verifica si exite o no un itent
    int existe = -2; // posicion del intent intgresado
    if (this.identif.length != 0) {
      existe = this.identif.indexWhere((item) => item == id);
    } else {
      bandespo = true;
      this.identif.add(id);
      this.cantSelecx = 1.toString();
    }
    print(existe);
    if (existe == -1) {
      bandespo = true;
      this.identif.add(id);
    } else {
      this.identif.removeAt(existe);
      if (this.identif.length == 0) {
        bandespo = !bandespo;
      }
    }

    this.cantSelecx = this.identif.length.toString();

    print("responder: " +
        bandespo.toString() +
        " pos: " +
        this.identif.toString());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllermesseg = TextEditingController();
    var size = MediaQuery.of(context).size;
    var higth = Size.fromHeight(60.0).height;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Align(
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: Image.asset("src/logojon.png").image,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                    ),
                  ],
                ),
                alignment: Alignment.center,
              ),
            ),
            elevation: 1,
            backgroundColor: Colors.grey.shade100,
            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    "Carlos Arturo",
                    style: TextStyle(
                      color: Colors.grey.shade600.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              IconButton(
                iconSize: 40,
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.asset("src/perfil.jpg").image),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        //cuerpo
        body: Container(
          height: size.height - 90,
          child: Stack(
            children: [
              Container(
                height: size.height - 90,
                color: Colors.white,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: (size.height - 150) / 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 250,
                          width: 190,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        Image.asset("src/avatar/parpadeo16.jpg")
                                            .image),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Container(
                height: size.height - 90,
                width: size.width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: (size.height - 70) / 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: Image.asset("src/background.png").image,
                      // ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                height: (size.height - (higth * 2 + 24)),
                                child: ListView(
                                  children: <Widget>[
                                    // **********************
                                    messengitentview(
                                        "",
                                        2,
                                        "R",
                                        "",
                                        "hola que tal weys",
                                        Colors.transparent,
                                        0),
                                    messengitentview(
                                        "",
                                        2,
                                        "R",
                                        "R",
                                        "hola que tal weys",
                                        Colors.transparent,
                                        0),
                                    messengitentview(
                                        "",
                                        2,
                                        "E",
                                        "R",
                                        "hola que tal weys como estas, que es de tu vida,",
                                        Colors.transparent,
                                        0),
                                    messengitentview(
                                        "",
                                        2,
                                        "R",
                                        "E",
                                        "hola que tal como estas queria decirte si hanias presentado el trabajo de conta pero no lo se",
                                        Colors.transparent,
                                        1),
                                    messengitentview(
                                        "",
                                        2,
                                        "E",
                                        "R",
                                        "hola que tal weys",
                                        Colors.transparent,
                                        0),
                                    messengitentview(
                                        "",
                                        2,
                                        "E",
                                        "E",
                                        "hola que tal como estas perro perro perro",
                                        Colors.transparent,
                                        0),
                                    messengitentview(
                                        "",
                                        2,
                                        "R",
                                        "E",
                                        "hola que tal weys",
                                        Colors.transparent,
                                        1),
                                    messengitentview(
                                        "",
                                        2,
                                        "E",
                                        "R",
                                        "hola que tal weys",
                                        Colors.transparent,
                                        0)
                                    // *********************************
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        //**************** container de barra secundaria *********************
                        Container(
                          height: Size.fromHeight(60.0).height,
                          alignment: Alignment.center,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: Align(
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        height: Size.fromHeight(48.0).height,
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        15, 0, 15, 0),
                                                    child: TextField(
                                                      controller:
                                                          textEditingController,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'Escribe un mensaje',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Colors.white,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: Align(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          height: 48,
                                          width: 48,
                                          child: (this.bandmes)
                                              ? Icon(
                                                  FontAwesomeIcons
                                                      .solidPaperPlane,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              : Icon(
                                                  Icons.mic_outlined,
                                                  color: Colors.white,
                                                ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF0c84fc),
                                          ),
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //*******************************************************************/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
