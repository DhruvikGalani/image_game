import 'package:flutter/material.dart';
import 'package:image_game/variable.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: mainpage(),
  ));
}

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int t = 1;
  String one = "";
  String two = "";
  int a = 0, b = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pnglist.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple.shade100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 16,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (!boollist[index]) {
                          if (t == 1 || t == 2) {
                            boollist[index] = true;
                          }
                          if (t == 1) {
                            print("click=$t");
                            one = pnglist[index];
                            a = index;
                            t = 3;
                            Future.delayed(Duration(milliseconds: 10))
                                .then((value) {
                              setState(() {
                                t = 2;
                              });
                            });
                          }
                          if (t == 2) {
                            print("click=$t");
                            two = pnglist[index];
                            b = index;
                            if (one == two) {
                              print("match");
                              t = 3;
                              Future.delayed(Duration(milliseconds: 1000))
                                  .then((value) {
                                setState(() {
                                  t = 1;
                                });
                              });
                            } else {
                              print("not match");
                              t = 3;
                              Future.delayed(Duration(milliseconds: 1000))
                                  .then((value) {
                                setState(() {
                                  boollist[a] = false;
                                  boollist[b] = false;
                                  t = 1;
                                });
                              });
                            }
                          }
                        }

                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffCE8FDA),
                              border: Border.all(
                                  color: Colors.purple.shade400.withOpacity(.8),
                                  width: 1.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("${pnglist[index]}",
                                  width: 80, height: 80, fit: BoxFit.cover),
                            ),
                            height: 80,
                            width: 80,
                          ),
                          replacement: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                border: Border.all(
                                    color:
                                        Colors.purple.shade400.withOpacity(.8),
                                    width: 1.2),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.purple.shade500
                                          .withOpacity(.75),
                                      spreadRadius: .7,
                                      blurRadius: 8,
                                      offset: Offset(1.7, 2.5))
                                ],
                              )),
                          visible: boollist[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //new
  }
}
