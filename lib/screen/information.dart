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
        'إزالة النباتات المصابة وحرقها'
            'تعقيم هيكل البيوت المحمية'
            'رش النبات بمبيد حشري (اكارسي)'));
    print(index);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.cyan,
            height: MediaQuery.of(context).size.height,
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
                            foregroundColor: Colors.white,
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
            margin: EdgeInsets.only(top: 84),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(32.0),
                    topRight: const Radius.circular(32.0))),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: buildSingleChildScrollViewTomato(context, 1),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollViewTomato(
      BuildContext context, int num) {
    if (num == 1) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'معلومات',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.end,
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 24, top: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  height: 100,
                  width: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "طماطم",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Tomato",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "النبتة",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      Image(
                        image: AssetImage('assets/images/tomato.png'),
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  height: 100,
                  width: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "فايرروس تبرقش (الموزيك) الطماطم",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Tomato mosaic virus",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "المرض",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('assets/images/hazard.png'),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "زراعة أصناف مقاومة",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "عدم التدخين أثناء شتل النباتات",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                " حرق بقايا المحصول المريض بدلاً من تركها في الحقل وتسبب العدوى",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "العلاج",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      Image(
                        image: AssetImage('assets/images/MEDI.png'),
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.grey.shade600,
              thickness: 0.25,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "المورد",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "الاسم",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "المنتج",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(32.0),
                                  topRight: const Radius.circular(32.0),
                                  bottomRight: const Radius.circular(32.0),
                                  bottomLeft: const Radius.circular(32.0),
                                ),
                              ),
                              height: 110,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "الواحة الخضراء",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 30,
                                          child: FloatingActionButton.extended(
                                            onPressed: () {},
                                            label: Text(
                                              "اطلب",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            elevation: 0.0,
                                            backgroundColor: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "اكارسي",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pesticide.png'),
                                          width: 60,
                                          height: 60,
                                        ),
                                        Text(
                                          "مبيد",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(32.0),
                                  topRight: const Radius.circular(32.0),
                                  bottomRight: const Radius.circular(32.0),
                                  bottomLeft: const Radius.circular(32.0),
                                ),
                              ),
                              height: 110,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "الواحة الخضراء",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 30,
                                          child: FloatingActionButton.extended(
                                            onPressed: () {},
                                            label: Text(
                                              "اطلب",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            elevation: 0.0,
                                            backgroundColor: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "اكارسي",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pesticide.png'),
                                          width: 60,
                                          height: 60,
                                        ),
                                        Text(
                                          "مبيد",
                                          style: TextStyle(fontSize: 18),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "الموردين",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Image(
                              image: AssetImage('assets/images/supplier.png'),
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (num == 2) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'معلومات',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                textAlign: TextAlign.end,
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 24, top: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  height: 100,
                  width: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "طماطم",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Tomato",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "النبتة",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      Image(
                        image: AssetImage('assets/images/tomato.png'),
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  height: 100,
                  width: 200,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "سوسة العنكبوت الحمراء",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Tomato Spider mites",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "المرض",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        image: AssetImage('assets/images/hazard.png'),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(32.0),
                      topRight: const Radius.circular(32.0),
                      bottomRight: const Radius.circular(32.0),
                      bottomLeft: const Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 32, top: 32),
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "إزالة النباتات المصابة وحرقها",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "تعقيم هيكل البيوت المحمية",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "رش النبات بمبيد حشري (اكارسي)",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Icon(
                              Icons.arrow_left,
                              size: 20,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "العلاج",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16),
                      ),
                      Image(
                        image: AssetImage('assets/images/MEDI.png'),
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.grey.shade600,
              thickness: 0.25,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "المورد",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "الاسم",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "المنتج",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(32.0),
                                  topRight: const Radius.circular(32.0),
                                  bottomRight: const Radius.circular(32.0),
                                  bottomLeft: const Radius.circular(32.0),
                                ),
                              ),
                              height: 110,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "الواحة الخضراء",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 30,
                                          child: FloatingActionButton.extended(
                                            onPressed: () {},
                                            label: Text(
                                              "اطلب",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            elevation: 0.0,
                                            backgroundColor: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "اكارسي",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pesticide.png'),
                                          width: 60,
                                          height: 60,
                                        ),
                                        Text(
                                          "مبيد",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(32.0),
                                  topRight: const Radius.circular(32.0),
                                  bottomRight: const Radius.circular(32.0),
                                  bottomLeft: const Radius.circular(32.0),
                                ),
                              ),
                              height: 110,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "الواحة الخضراء",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 30,
                                          child: FloatingActionButton.extended(
                                            onPressed: () {},
                                            label: Text(
                                              "اطلب",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            elevation: 0.0,
                                            backgroundColor: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "اكارسي",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pesticide.png'),
                                          width: 60,
                                          height: 60,
                                        ),
                                        Text(
                                          "مبيد",
                                          style: TextStyle(fontSize: 18),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "الموردين",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Image(
                              image: AssetImage('assets/images/supplier.png'),
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
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
