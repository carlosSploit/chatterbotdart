import 'package:chatbotdart/controller/usuarios.dart';
import 'package:chatbotdart/view/messegeview/view/mainmesseg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginview extends StatefulWidget {
  loginview();

  loginbody createState() => loginbody();
}

class loginbody extends State<loginview> {
  final controller = Get.put(UsuariosController());
  loginbody();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(this.context).size;
    return Scaffold(
      body: GetBuilder<UsuariosController>(
        init: UsuariosController(),
        builder: (_) {
          return Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 45, 0, 0),
                    height: 20,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: Image.asset("src/vector.png").image)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: size.width,
                      height: size.height / 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width,
                              child: Text(
                                "Gojon Chatbot",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: size.width,
                              child: Text(
                                "Aplicacion para interactuar con un asistente virtual sobre lo que la pagina Gojon te puede ofreser ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                width: size.width,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        height: 20,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: Image.asset(
                                                      "src/logogoogle.png")
                                                  .image),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Text(
                                          "Logeate",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onTap: () async {
                                bool comproba = await _.signInWithGoogle();
                                if (comproba) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => mainmesseg()),
                                  );
                                } else {
                                  print("Parece que no se a podido logear");
                                }
                              },
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset("src/fondologin.png").image)),
          );
        },
      ),
    );
  }
}
