import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class estadosaddview extends StatefulWidget {
  estadosaddview();

  @override
  estadosaddbody createState() => estadosaddbody();
}

class estadosaddbody extends State<estadosaddview> {
  estadosaddbody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add_sharp,
                            color: Colors.white,
                          ),
                        ),
                        width: (60.toDouble() - 3),
                        height: (60.toDouble() - 3),
                        decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
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
                "Add Status",
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
