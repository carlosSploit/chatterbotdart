import 'package:chatbotdart/controller/messeg.dart';
import 'package:chatbotdart/model/messegemodel.dart';
import 'package:chatbotdart/view/components/inserproductoview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../messegeview/components/messengitentview.dart';
import '/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
// text to speach
import 'package:flutter_tts/flutter_tts.dart';
// speach to text
import 'package:speech_to_text/speech_to_text.dart';

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
  late User uss;
  late messegemodel msmod;
  late List<messeg> messg; //lista de mensajes de la conver
  String imagenpro = "src/parpadeo.gif";
  final FlutterTts flutterTts = FlutterTts(); //variables para el text_to_speach
  static final _speech = SpeechToText(); //variables para el speach_to_speach
  bool isspeack = true; // identifica que si quiere que hable o no.
  bool isListener = false; // valida si esta escuchando al usuario
  String textconten = ""; //contenedor de texto de lo hablado

  late TextEditingController textEditingController =
      TextEditingController(text: "");

  Future speack(String messege) async {
    await flutterTts.speak("$messege");
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: "");
    textEditingController.addListener(() {
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
        "messeg":
            "Hola me llamo Sofia, y sere tu asistente en estos momentos \npalabras clabe: \n* Quiero alquilar un inmuble\n* Quiero comprarr un inmuble\n* Tengo un problema con mi inmueble",
        "tipo": "R"
      })
    ];
    msmod = messegemodel();
  }

  //escucha lo que se esta hablando el usuario
  listenSpeach() async {
    if (!isListener) {
      bool available = await _speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onStatus: $val'));
      // combprueba si se esta escuchando;
      if (available) {
        _speech.listen(
          onResult: (value) => setState(
            () {
              textconten = value.recognizedWords;
              if (value.hasConfidenceRating && value.confidence > 0) {}
            },
          ),
        );
      } else {
        setState(() => isListener = false);
        _speech.stop();
      }
    }
  }

  void insertmesseg(String emisor) async {
    setState(() {
      messg.add(messeg.fromJson({"messeg": emisor, "tipo": "E"}));
      this.cargado = true;
    });
    messeg men = await msmod.read({"emisor": emisor});
    //----------------------------------------------------------------
    if (isspeack)
      await speack(men.getcontenmesseg); //manda hablar a la aplicacion
    //----------------------------------------------------------------
    setState(() {
      this.cargado = false;
      messg.add(men);
      imagenpro = (isspeack) ? "src/hablar.gif" : "src/parpadeo.gif";
      if (men.getcontenmesseg.toLowerCase() ==
          "Rellena el siguiente formulario") {
        inserproductoview((a) {
          setState(() {
            this.cargado = false;
            messg.add(messeg.fromJson({
              "messeg": "El formulario se a ingresado correctamente",
              "tipo": "R"
            }));
            imagenpro = (isspeack) ? "src/hablar.gif" : "src/parpadeo.gif";
          });
          //apagar la animacion que se encuentra ejecuandoce
          Future.delayed(
            Duration(
              days: 0,
              milliseconds: (80 * men.getcontenmesseg.length),
            ),
            () {
              setState(() {
                imagenpro = "src/parpadeo.gif";
              });
            },
          );
        }).createDialog(context);
      }
    });
    Future.delayed(
        Duration(
          days: 0,
          milliseconds: (80 * men.getcontenmesseg.length),
        ), () {
      setState(() {
        imagenpro = "src/parpadeo.gif";
      });
    });
  }

  void actualizar() {
    setState(() {});
    band = !band;
  }

  Widget botondolarpen() {
    return InkWell(
      onTap: () {
        isspeack = !(isspeack);
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 5),
          height: 30,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Icon(
                      Icons.record_voice_over_outlined,
                      color: (isspeack) ? Color(0xFF0c84fc) : Colors.white,
                      size: 15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: (isspeack) ? Colors.white : Color(0xFF0c84fc),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: Icon(
                      Icons.voice_over_off_outlined,
                      color: (isspeack) ? Colors.white : Color(0xFF0c84fc),
                      size: 15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: (isspeack) ? Color(0xFF0c84fc) : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFF0c84fc),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllermesseg = TextEditingController();
    var size = MediaQuery.of(context).size;
    var higth = Size.fromHeight(60.0).height;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final userCredential = _auth.currentUser;
    uss = userCredential as User;
    print(uss.displayName);
    print(uss.photoURL);

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
            botondolarpen(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Text(
                  "${(this.uss.displayName as String).split(" ")[0]}",
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
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network("${this.uss.photoURL}").image),
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: (size.height) / 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: (size.height - 150) / 2,
                      width: ((size.height - 150) / 2) - 60,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          imagenpro,
                          height: (size.height - 150) / 2,
                          width: ((size.height - 150) / 2) - 60,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                              "https://images3.alphacoders.com/105/1057717.jpg")
                          .image,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height - 90,
              width: size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: (size.height - 70) / 2,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
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
                                                messg[i].getinformacion,
                                                (messg[i].getinformacion)
                                                    ? messg[i].getlistainmueble
                                                    : [],
                                                messg[i].gettipolistinmueble),
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
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
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
                                            : InkWell(
                                                child: Icon(
                                                  Icons.mic_outlined,
                                                  color: Colors.white,
                                                ),
                                                onTap: () async {
                                                  // await listenSpeach();
                                                  // insertmesseg(this.textconten);
                                                },
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
      ),
    );
  }
}
