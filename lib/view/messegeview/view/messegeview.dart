import 'package:chatbotdart/controller/messeg.dart';
import 'package:chatbotdart/model/messegemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../messegeview/components/messengitentview.dart';
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
  bool cargado = false;
  List<int> identif = [];
  String cantSelecx = "0";
  late messegemodel msmod;
  late List<messeg> messg; //lista de mensajes de la conver

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
    messg = [
      messeg.fromJson({
        "messeg": "Hola me llamo Sofia, y sere tu asistente en estos momentos",
        "tipo": "R"
      })
    ];
    msmod = messegemodel();
  }

  void insertmesseg(String emisor) async {
    setState(() {
      messg.add(messeg.fromJson({"messeg": emisor, "tipo": "E"}));
      this.cargado = true;
    });
    messeg men = await msmod.read({"emisor": emisor});
    setState(() {
      this.cargado = false;
      messg.add(men);
    });
  }

  void actualizar() {
    setState(() {});
    band = !band;
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
            leading: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.menu,
                color: Colors.grey.shade400,
                size: 30,
              ),
              onPressed: () {},
            ),
            title: InkWell(
              child: Container(
                height: 20,
                width: 100,
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
            elevation: 1,
            backgroundColor: Colors.grey.shade100,
            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    "Carlos",
                    style: TextStyle(
                      color: Colors.grey.shade600.withOpacity(0.7),
                      fontSize: 15,
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
                                    children: messg
                                        .asMap()
                                        .map((i, e) => MapEntry(
                                              i,
                                              messengitentview(
                                                  2,
                                                  messg[i].gettipo,
                                                  (i != 0)
                                                      ? messg[i - 1].gettipo
                                                      : "",
                                                  messg[i].getcontenmesseg,
                                                  Colors.transparent,
                                                  0,
                                                  messg[i].getinformacion),
                                            ))
                                        .values
                                        .toList()),
                              ),
                            ],
                          ),
                        ),

                        //**************** container de barra secundaria *********************
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: Size.fromHeight(60.0).height,
                          alignment: Alignment.center,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                (this.cargado)
                                    ? Container(
                                        width: 25,
                                        height: 25,
                                        child: Align(
                                          child: CircularProgressIndicator(),
                                          alignment: Alignment.center,
                                        ),
                                      )
                                    : Container(),
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
                                          height: 48,
                                          width: 48,
                                          child: (this.bandmes)
                                              ? InkWell(
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .solidPaperPlane,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  onTap: () {
                                                    insertmesseg(
                                                        textEditingController
                                                            .text);
                                                    textEditingController.text =
                                                        "";
                                                  },
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
