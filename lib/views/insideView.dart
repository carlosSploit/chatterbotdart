import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../components/estadospeview.dart';
import '../../components/estadosaddview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class insideView extends StatefulWidget {
  @override
  insidebody createState() => insidebody();
}

class insidebody extends State<insideView> {
  int _selectedIndex = 3;

  static List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff147369),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          width: 200,
          child: Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          //container de barra secundaria
          Container(
            height: 100,
            color: Color(0xff147369),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <SingleChildScrollView>[
                      SingleChildScrollView(
                        child: new estadosaddview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                      SingleChildScrollView(
                        child: new estadospeview(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                height: size.height - 180,
                child: OverflowBox(
                  child: _widgetOptions[_selectedIndex],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                ),
              ),
              Container(
                height: size.height - 180,
                width: size.width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    height: 50,
                    child: BottomNavigationBar(
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(
                              FontAwesomeIcons.solidComment,
                              size: 20,
                            ),
                            label: "EL",
                            activeIcon: Icon(
                              FontAwesomeIcons.solidComment,
                              size: 20,
                            ),
                            backgroundColor: Colors.transparent),
                        BottomNavigationBarItem(
                            icon: Icon(
                              FontAwesomeIcons.userPlus,
                              size: 20,
                            ),
                            label: "EL",
                            activeIcon: Icon(
                              FontAwesomeIcons.userPlus,
                              size: 20,
                            ),
                            backgroundColor: Colors.transparent),
                        BottomNavigationBarItem(
                            icon: Icon(
                              FontAwesomeIcons.video,
                              size: 20,
                            ),
                            label: "EL",
                            activeIcon: Icon(
                              FontAwesomeIcons.video,
                              size: 20,
                            ),
                            backgroundColor: Colors.transparent),
                        BottomNavigationBarItem(
                            icon: Icon(
                              FontAwesomeIcons.phoneAlt,
                              size: 20,
                            ),
                            label: "EL",
                            activeIcon: Icon(
                              FontAwesomeIcons.phoneAlt,
                              size: 20,
                            ),
                            backgroundColor: Colors.transparent),
                      ],
                      //fixedColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: _selectedIndex,
                      unselectedItemColor: Colors.white.withOpacity(0.3),
                      selectedItemColor: Colors.white,
                      onTap: _onItemTapped,
                    ),
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff147369),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
