import 'package:chatbotdart/controller/inmueble.dart';
import 'package:chatbotdart/view/messegeview/components/infoinmuebleview.dart';
import 'package:chatbotdart/view/messegeview/components/visualizarimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class messengitentview extends StatefulWidget {
  int cant = 0;
  String tipo = "";
  String messege = "";
  Color backselect = Colors.transparent;
  int repons = 0;
  String siguiente = "";
  //#################################
  late List<inmueble> inmuu = [];
  late String tipolistinmuu;
  //#################################
  bool listestade = false; // verifica que si hay una lista de inmuebles

  Map<String, dynamic> url = {
    "Recomend": "https://gojom.pe/",
    "Favorit": "https://gojom.pe/",
    "Comprar": "https://gojom.pe/compra/inmueble?o=mas-baratos",
    "alquiler": "https://gojom.pe/alquiler/inmueble?o=mas-baratos"
  };

  messengitentview(
      this.cant,
      this.tipo,
      this.siguiente,
      this.messege,
      this.backselect,
      this.repons,
      this.listestade,
      this.inmuu,
      this.tipolistinmuu);

  @override
  messengitentbody createState() => messengitentbody();
}

class messengitentbody extends State<messengitentview> {
  messengitentbody();

  @override
  Widget build(BuildContext context) {
    var messeng = (widget.messege.indexOf("https") != -1)
        ? widget.messege.split("#")[0]
        : widget.messege;
    double lenthmesssege = messeng.length.toDouble();
    // ******************   mensaje    ***********************
    var size = MediaQuery.of(context).size;
    List<Widget> listmeg = [];

    Widget messeg = Container(
      color: widget.backselect,
      width: size.width,
      child: Row(
        crossAxisAlignment: (widget.tipo != "R")
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (widget.tipo != "R")
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          (widget.tipo == "R" && widget.siguiente != widget.tipo)
              ? Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset("src/perfil.png").image),
                  ),
                )
              : Container(
                  width: 50,
                ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  15, (widget.siguiente != widget.tipo) ? 5 : 0, 15, 5),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: (messeng.length > 24)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                mainAxisAlignment: (widget.tipo != "R")
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.end,
                children: <Widget>[
                  if (widget.repons != 0)
                    Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              height: 45,
                              padding: EdgeInsets.fromLTRB(15, 2, 0, 2),
                              width: (messeng.length > 24)
                                  ? (23 * 10)
                                  : ((messeng.length * 8) + (8 * 10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                        child: Text(
                                          "+51 969280255",
                                          style: TextStyle(
                                              color: Color(0xFF0c84fc)
                                                  .withGreen(5),
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "que tal como estas",
                                          maxLines: 1,
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              height: 45,
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              width: 5,
                              decoration: BoxDecoration(
                                color: Color(0xFF0c84fc).withGreen(5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  if (lenthmesssege > 24)
                    Row(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: new BoxConstraints(
                            minWidth: 5.0,
                            maxWidth: 23 * 10,
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                            child: Text(
                              messeng.toString(),
                              style: TextStyle(
                                color: (widget.tipo != "E")
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (lenthmesssege > 24)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        (!widget.listestade)
                            ? Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                child: Text(
                                  "22:37 p.m.",
                                  style: TextStyle(
                                    color: (widget.tipo != "E")
                                        ? Colors.white.withOpacity(0.7)
                                        : Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              )
                            : Container(),
                        if (widget.tipo != "R")
                          Container(
                            margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: Icon(
                              (widget.cant == 0) ? Icons.done : Icons.done_all,
                              color: (widget.cant < 2)
                                  ? Colors.grey[400]
                                  : Colors.lightBlue[400],
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  if (lenthmesssege < 24)
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Text(
                            messeng.toString(),
                            style: TextStyle(
                              color: (widget.tipo != "E")
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        (!widget.listestade)
                            ? Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 0, 2),
                                child: Text(
                                  "22:37 p.m.",
                                  style: TextStyle(
                                    color: (widget.tipo != "E")
                                        ? Colors.white.withOpacity(0.7)
                                        : Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              )
                            : Container(),
                        if (widget.tipo != "R")
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 0, 2),
                            child: Icon(
                              (widget.cant == 0) ? Icons.done : Icons.done_all,
                              color: (widget.cant < 2)
                                  ? Colors.grey[400]
                                  : Colors.lightBlue[400],
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  CustomPaint(
                      //foregroundPainter: paintertriangle(),
                      child: Container())
                ],
              ),
              decoration: BoxDecoration(
                color: (widget.tipo != "R") ? Colors.white : Color(0xFF0c84fc),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: (widget.tipo != "R")
                      ? Radius.circular(0)
                      : Radius.circular(10),
                  topLeft: (widget.tipo != "R")
                      ? Radius.circular(10)
                      : Radius.circular(0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    listmeg.add(messeg);
    if (widget.tipo == "R" && widget.listestade) {
      for (inmueble inmue in widget.inmuu) {
        listmeg.add(infoinmuebleview(inmue));
      }
      listmeg.add(Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
              child: InkWell(
                child: Container(
                  width: (size.width / 2) + 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ver mas informacion",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => visualizarimage(
                            widget.url[widget.tipolistinmuu],
                            widget.tipolistinmuu)),
                  );
                },
              ),
              decoration: BoxDecoration(
                color: Color(0xFF0c84fc),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
            ),
          ],
        ),
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: listmeg,
    );
    //***********************************************/;
  }
}

class paintertriangle extends CustomPaint {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final path = Path();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
