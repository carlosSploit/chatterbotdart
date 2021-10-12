import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class estadospeview extends StatefulWidget {
  estadospeview();

  @override
  estadospebody createState() => estadospebody();
}

class estadospebody extends State<estadospeview> {
  estadospebody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //************ Imagen contenedora ***************/
          //bode que redondea la imagen
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  //height: double.maxFinite,
                  child: Container(
                    width: 60.toDouble(),
                    height: 60.toDouble(),
                    //image de contenido
                    child: Center(
                      child: Container(
                          width: (60.toDouble() - 3),
                          height: (60.toDouble() - 3),
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")))),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //***********************************************/
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 15,
              child: Text(
                "Soycarlos",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
    //***********************************************/;
  }
}
