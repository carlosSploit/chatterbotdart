import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class botonsopciview extends StatefulWidget {
  int cant = 0;
  String name = "";
  Color? color = Colors.grey;
  Color? secolo = Colors.amberAccent;
  IconData icon = Icons.ac_unit;
  botonsopciview(this.cant, this.name, this.icon, this.color, this.secolo);

  @override
  botonsopcibody createState() => botonsopcibody();
}

class botonsopcibody extends State<botonsopciview> {
  botonsopcibody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Container(
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            height: 70,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 60,
                width: 60,
                child: Container(
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.color
                        // gradient: LinearGradient(
                        //   colors: [widget.color!, widget.secolo!],
                        //   begin: FractionalOffset.topCenter,
                        //   end: FractionalOffset.bottomCenter,
                        //   stops: [0.0, 1.0],
                        //   tileMode: TileMode.repeated,
                        // ),
                        ),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.name,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
    //***********************************************/;
  }
}
