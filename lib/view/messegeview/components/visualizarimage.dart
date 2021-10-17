// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_test_utils/image_test_utils.dart';
import 'package:chatbotdart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types, must_be_immutable
class visualizarimage extends StatefulWidget {
  late String url;
  late String name;
  visualizarimage(this.url, this.name);

  @override
  contentserbody createState() => contentserbody();

  // createDialog(BuildContext context, List<String> seturl) {
  //   urlimg = seturl;
  //   print(urlimg[this.pos]);
  //   return showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           state = setState;
  //           return AlertDialog(
  //             backgroundColor: Colors.transparent,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(20.0),
  //               ),
  //             ),
  //             contentPadding: EdgeInsets.all(0),
  //             content: Container(
  //               padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       InkWell(
  //                         child: Container(
  //                           margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
  //                           child: Icon(Icons.ac_unit),
  //                         ),
  //                         onTap: () {},
  //                       ),
  //                       Expanded(child: Container())
  //                     ],
  //                   ),
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Expanded(
  //                         flex: 2,
  //                         child: InkWell(
  //                           child: Container(
  //                             child: Icon(Icons.ac_unit),
  //                           ),
  //                           onTap: () {
  //                             if (pos >= 1) {
  //                               pos--;
  //                             }
  //                             state(() {});
  //                           },
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 6,
  //                         child: Container(
  //                           height: 200,
  //                           decoration: BoxDecoration(
  //                             image: DecorationImage(
  //                               fit: BoxFit.cover,
  //                               image: Image.network(urlimg[this.pos]).image,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 2,
  //                         child: InkWell(
  //                           child: Container(
  //                             child: Icon(Icons.ac_unit),
  //                           ),
  //                           onTap: () {
  //                             if (pos <= urlimg.length - 2) {
  //                               pos++;
  //                             }
  //                             state(() {});
  //                           },
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(25.0)),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // // void testeador() {
  // //   testWidgets('my image test', (WidgetTester tester) async {
  // //     provideMockedNetworkImages(() async {
  // //       // Now we can pump NetworkImages without crashing our tests. Yay!
  // //       await tester.pumpWidget(
  // //         MaterialApp(
  // //           home: Image.network(urlimg[this.pos]),
  // //         ),
  // //       );

  // //       // No crashes.
  // //     });
  // //   });
  // // }
}

// ignore: camel_case_types
class contentserbody extends State<visualizarimage> {
  contentserbody();

  @override
  Widget build(BuildContext context) {
    //************* Inten ***************/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: Color(0xff707070),
          ),
          onTap: () {
            Navigator.pop(
              context,
            );
          },
        ),
        title: Text(
          "${widget.name}",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff707070),
          ),
        ),
      ),
      body: Center(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
      ),
    );
    //***********************************************/;
  }
}
