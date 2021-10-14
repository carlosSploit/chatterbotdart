import 'package:chatbotdart/controller/inmueble.dart';
import 'package:chatbotdart/view/messegeview/components/visualizarimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class infoinmuebleview extends StatefulWidget {
  // verifica que si hay una lista de inmuebles
  inmueble inmu = inmueble.fromJson({});

  infoinmuebleview(this.inmu);

  @override
  infoinmueblebody createState() => infoinmueblebody();
}

class infoinmueblebody extends State<infoinmuebleview> {
  infoinmueblebody();

  @override
  Widget build(BuildContext context) {
    // ******************   mensaje    ***********************
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: (size.width / 2) + 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            child: Text(
                              "${widget.inmu.getnombre}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            child: Text(
                              "${widget.inmu.getcosto}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width / 2) + 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Align(
                            child: Text(
                              "${widget.inmu.getlocalizacion}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontSize: 14),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Align(
                            child: InkWell(
                              child: Container(
                                height: 20,
                                padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                                child: Text(
                                  "Imagenes",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFF0c84fc),
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              onTap: () {
                                // visualizarimage().createDialog(
                                //     context, widget.inmu.getimglist);
                              },
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: (size.width / 2) + 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'src/metros.svg',
                                height: 20,
                                width: 20,
                                semanticsLabel: 'A shark?!',
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                    "${widget.inmu.getespesific.gettotal}"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'src/techado.svg',
                                height: 20,
                                width: 20,
                                semanticsLabel: 'A shark?!',
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                    "${widget.inmu.getespesific.gettechado}"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'src/dormitorios.svg',
                                height: 24,
                                width: 20,
                                semanticsLabel: 'A shark?!',
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child:
                                    Text("${widget.inmu.getespesific.getdorm}"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'src/banos.svg',
                                height: 20,
                                width: 20,
                                semanticsLabel: 'A shark?!',
                                placeholderBuilder: (BuildContext context) =>
                                    Container(
                                        child:
                                            const CircularProgressIndicator()),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                    "${widget.inmu.getespesific.getbanos}"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
            ),
          ),
        ],
      ),
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
