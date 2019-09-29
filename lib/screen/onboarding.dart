import 'package:flutter/material.dart';
import 'package:affat/pagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {


  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(

        'قم بالتقاط صورة لنبتتك او ارفعها من جهازك',
        Icons.camera_alt,
        'assets/images/bg.png'));
    pages.add(PageModel(

        'ستقوم أرمونيا بتشخيص المرض وأقتراح طرق العلاج',
        Icons.local_hospital,
        'assets/images/bg1.png'));

  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.black38,
                        ),
                        offset: Offset(0, -100),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.only(left: 48, right: 48, top: 18),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 175),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            child: SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: Colors.teal,
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateSeen();
                        return homescreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
            size: 8.0,
            color: Colors.grey,
          ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.teal.shade300,
            ),
          ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool( 'seen' , true);
  }
}
