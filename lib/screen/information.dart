import 'package:affat/disease.dart';
import 'package:flutter/material.dart';
import 'package:affat/diseaseApi.dart';

class inforamtion extends StatefulWidget {
  final String imagePath;

  inforamtion({this.imagePath});

  @override
  _inforamtionState createState() => _inforamtionState();
}

class _inforamtionState extends State<inforamtion> {
  List<disease> diseases;

  diseaseApi diseaseapi = diseaseApi();

  @override
  Widget build(BuildContext context) {
    diseases = List<disease>();
    diseaseApi dis = diseaseApi();
    Future<int> index = dis.fetChdisease();
    diseases.add(disease(
        "Tomato mosaic virus",
        'فايرروس تبرقش (الموزيك) الطماطم',
        "زراعة أصناف مقاومة."
            "عدم التدخين أثناء شتل النباتات"
            " حرق بقايا المحصول المريض , بدلاً من تركها في الحقل وتسبب العدوى"));
    diseases.add(disease(
        'Tomato Spider mites',
        'سوسة العنكبوت الحمراء',
        '١-إزالة النباتات المصابة وحرقها'
            '٢-تعقيم هيكل البيوت المحمية'
            '٣-رش النبات بمبيد حشري (اكارسي)'));
    print(index);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.teal,
            height: 600,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 55.0,
                      width: 55.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 28, left: 16),
                        child: FloatingActionButton(
                            heroTag: "cancel",
                            child: Icon(
                              Icons.cancel,
                              size: 25,
                            ),
                            backgroundColor: Colors.black26,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0))),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        color: Colors.black12,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    margin: EdgeInsets.all(8),
                                    child: Center(
                                        child: Text(
                                      "طماطم",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("النبتة"),
                                    Container(
                                        child: Image(
                                      image: ExactAssetImage(
                                          'assets/images/tomato.png'),
                                      width: 60,
                                      height: 60,
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      "Tomato mosaic virus",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("المرض"),
                                    Container(
                                      child: Image(
                                        image: ExactAssetImage(
                                            'assets/images/hazard.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: new BoxDecoration(
                        color: Colors.black12,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft:
                          const Radius.circular(40.0),
                          bottomRight:
                          const Radius.circular(40.0),
                        ),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Container(
                                      width: 150,
                                      height: 80,

                                      margin: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          " زراعة أصناف مقاومة  عدم التدخين أثناء شتل النباتات حرق بقايا المحصول المريض  بدلاً من تركها في الحقل وتسبب العدوى",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("العلاج"),
                                    Container(
                                        width: 150,
                                        height: 60,
                                        child: Image(
                                          image: ExactAssetImage(
                                              'assets/images/MEDI.png'),
                                          width: 60,
                                          height: 60,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[ Column(children: <Widget>[
                                Container(
                                    width: 150,
                                    height: 80,
                                    decoration: new BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(40.0),
                                        topRight: const Radius.circular(40.0),
                                        bottomLeft:
                                        const Radius.circular(40.0),
                                        bottomRight:
                                        const Radius.circular(40.0),
                                      ),
                                    ),
                                    margin: EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        " زراعة أصناف مقاومة  عدم التدخين أثناء شتل النباتات حرق بقايا المحصول المريض  بدلاً من تركها في الحقل وتسبب العدوى",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],),
                              Text("المنتج"),
                              Text("الاسم"),
                              Text("المورد"),
                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Container(
                                      width: 150,
                                      height: 80,
                                      margin: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          " زراعة أصناف مقاومة  عدم التدخين أثناء شتل النباتات حرق بقايا المحصول المريض  بدلاً من تركها في الحقل وتسبب العدوى",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("الموردين"),
                                    Container(
                                        width: 150,
                                        height: 60,
                                        child: Image(
                                          image: ExactAssetImage(
                                              'assets/images/archive.png'),
                                          width: 60,
                                          height: 60,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget noData() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('No Data Available!'),
    );
  }

  Widget loading() {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget connectionError() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('Connection Error!!!!'),
    );
  }

  Widget error(var error) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(error.toString()),
    );
  }
}
