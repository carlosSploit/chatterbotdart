import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: camel_case_types, must_be_immutable
class visualizarimage extends StatefulWidget {
  late var state;
  late int pos = 0;
  late List<String> urlimg;

  @override
  contentserbody createState() => contentserbody();

  createDialog(BuildContext context, List<String> seturl) {
    urlimg = seturl;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            state = setState;
            return AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              content: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Icon(Icons.ac_unit),
                          ),
                          onTap: () {},
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            child: Container(
                              child: Icon(Icons.ac_unit),
                            ),
                            onTap: () {
                              if (pos >= 1) {
                                pos--;
                              }
                              state(() {});
                            },
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(urlimg[this.pos]))),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            child: Container(
                              child: Icon(Icons.ac_unit),
                            ),
                            onTap: () {
                              if (pos <= urlimg.length - 2) {
                                pos++;
                              }
                              state(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            );
          },
        );
      },
    );
  }
}

// ignore: camel_case_types
class contentserbody extends State<visualizarimage> {
  contentserbody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Container();
    //***********************************************/;
  }
}
