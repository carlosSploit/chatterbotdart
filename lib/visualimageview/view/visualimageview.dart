import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../messegeview/view/mainmesseg.dart';
import '../../main.dart';
import '../../my_flutter_app_icons.dart';

class visualimageview extends StatefulWidget {
  @override
  visualimagebody createState() => visualimagebody();
}

class visualimagebody extends State<visualimageview> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllermesseg = TextEditingController();
    var size = MediaQuery.of(context).size;
    var higth = Size.fromHeight(60.0).height;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      //cuerpo
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: Image.asset("src/img1.jpg").image),
        ),
        child: Column(
          children: <Widget>[
            PreferredSize(
              preferredSize: Size.fromHeight(60.0), // here the desired height
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: Align(
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    height: 35,
                                    child: Icon(Icons.arrow_back_outlined),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => mainmesseg()),
                                    );
                                  },
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Tù",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Hace 30 minutos",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      MyFlutterApp.star,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      MyFlutterApp.share,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_sharp,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
