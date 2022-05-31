import 'dart:ui';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'flutter_logo_icon_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return NeumorphicApp(
        debugShowCheckedModeBanner: false,
        title: 'YK_Portfolio',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Colors.grey.shade100,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          lightSource: LightSource.topLeft,
          depth: 6,
        ),
        home: MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String imgUrl = "images/myimage1.jpg";
  double initX = 0.0, initY = 0.0;
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor:  _textColor(context),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.github,
              color: Color(0xFF440089),
            ),
            label: 'GitHub',

          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.linkedinIn,
              color: Color(0xFF144477),
            ),
            label: 'LinkedIn',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.bloggerB,
              color: Color(0xFFFF7E09),
            ),
            label: 'Blog',
          ),
        ],
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: SizerUtil.deviceType == DeviceType.tablet ? 1.h : 0.0,
            right: SizerUtil.deviceType == DeviceType.tablet ? 2.w : 0.0),
        child: SizedBox(
          height: 7.h,
          width: 7.h,
          child: NeumorphicFloatingActionButton(
            child: Icon(
              Icons.circle,
              size: 3.h,
              color: _textColor(context),
            ),
            onPressed: () {
              NeumorphicTheme.of(context).themeMode =
                  NeumorphicTheme.isUsingDark(context)
                      ? ThemeMode.light
                      : ThemeMode.dark;
              setState(() {
                _isDarkTheme == false
                    ? _isDarkTheme = true
                    : _isDarkTheme = false;
              });
            },
          ),
        ),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Stack(
        children: [
          Container(
            child: Center(
              child: TiltWidget(
                  yaxis: (MediaQuery.of(context).size.width / 2) / 2,
                  image: imgUrl,
                  text: 'Yogesh Kumar',
                  subText: 'FullStack Dev'),
            ),
          ),
          Positioned(
            top: 340,
            right: 350,
            child: Row(
              children: [
                NeumorphicIcon(
                  FontAwesomeIcons.c,
                  size: 25.sp,
                  style: NeumorphicStyle(
                      color: Color(0xff9560c4),
                      shadowDarkColor: Color(0xff9560c4).withOpacity(1),
                      lightSource: LightSource.topRight),
                ),
                NeumorphicIcon(
                  FontAwesomeIcons.hashtag,
                  size: 15.sp,
                  style: NeumorphicStyle(
                      color: Color(0xff4d2f78),
                      shadowDarkColor: Color(0xff4d2f78).withOpacity(1),
                      lightSource: LightSource.topRight),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: 250,
            child: NeumorphicIcon(
              FontAwesomeIcons.html5,
              size: 20.sp,
              style: NeumorphicStyle(
                  color: Color(0xffF2786B),
                  shadowDarkColor: Color(0xffF2786B).withOpacity(1),
                  lightSource: LightSource.topRight),
            ),
          ),
          Positioned(
            top: 100,
            right: 180,
            child: Container(
              height: 10.h,
              width: 25.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphicIcon(
                    FontAwesomeIcons.a,
                    size: 20.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff02449D8),
                        shadowDarkColor: Color(0xff02449D8).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.z,
                    size: 20.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff02449D8),
                        shadowDarkColor: Color(0xff02449D8).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.u,
                    size: 20.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff02449D8),
                        shadowDarkColor: Color(0xff02449D8).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.r,
                    size: 20.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff02449D8),
                        shadowDarkColor: Color(0xff02449D8).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.e,
                    size: 20.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff02449D8),
                        shadowDarkColor: Color(0xff02449D8).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 150,
            child: Container(
              height: 10.h,
              width: 15.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.values[1],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphicIcon(
                    FontAwesomeIcons.solidCircle,
                    size: 5.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff000000),
                        shadowDarkColor: Color(0xff000000).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.n,
                    size: 15.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff26344A),
                        shadowDarkColor: Color(0xff26344A).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.e,
                    size: 15.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff26344A),
                        shadowDarkColor: Color(0xff26344A).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                  NeumorphicIcon(
                    FontAwesomeIcons.t,
                    size: 15.sp,
                    style: NeumorphicStyle(
                        color: Color(0xff26344A),
                        shadowDarkColor: Color(0xff26344A).withOpacity(1),
                        lightSource: LightSource.topLeft),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 100,
            child: NeumorphicIcon(
              FontAwesomeIcons.python,
              size: 15.h,
              style: NeumorphicStyle(
                  color: Color(0xfff0db4f),
                  shadowDarkColor: Color(0xfff0db4f).withOpacity(1),
                  lightSource: LightSource.topRight),
            ),
          ),
          Positioned(
            top: 250,
            left: 50,
            child: NeumorphicIcon(
              FlutterLogoIcon.flutter,
              size: 60.sp,
              style: NeumorphicStyle(
                  color: Color(0xff36C4F0),
                  shadowDarkColor: Color(0xff36C4F0).withOpacity(1),
                  lightSource: LightSource.topRight),
            ),
          ),
        ],
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  void _onItemTapped(int index) async {
    if (index == 0) {
      String url = "https://github.com/Yogesh-333";
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }
    if (index == 1) {
      String url = "https://www.linkedin.com/in/yogeshkumar333/";
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }
    if (index == 2) {
      String url = "https://unknownauthor-poems.blogspot.com/";
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

class TiltWidget extends StatefulWidget {
  final double yaxis;
  final String image;
  final String text;
  final String subText;

  TiltWidget({this.yaxis, this.image, this.text, this.subText});

  @override
  _TiltWidgetState createState() => _TiltWidgetState();
}

class _TiltWidgetState extends State<TiltWidget> {
  double x = 0.0;
  double y = 0.0;
  double borderValueY = 150.0;
  double borderValueX = 200.0;
  double beginY = 0.0;
  double endY = 0.0;
  double beginX = 0.0;
  double endX = 0.0;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 300),
      tween: Tween(
        begin: beginX,
        end: endX,
      ),
      builder: (context, valueX, child) => TweenAnimationBuilder(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        tween: Tween(
          begin: beginY,
          end: endY,
        ),
        builder: (context, valueY, child) {
          return Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(valueX)
                  ..rotateY(valueY),
                alignment: FractionalOffset.center,
                child: MouseRegion(
                  onHover: (details) {
                    double yvalue = widget.yaxis - details.localPosition.dx;
                    double xvalue = (MediaQuery.of(context).size.height / 2) -
                        details.localPosition.dy;
                    print(xvalue);
                    if (yvalue <= borderValueY && yvalue >= -borderValueY) {
                      setState(() {
                        double oldRange = (borderValueY - (-borderValueY));
                        double newRange = (0.35 - (-0.35));
                        double newValue =
                            (((yvalue - (-borderValueY)) * newRange) /
                                    oldRange) +
                                (-0.35);
                        beginY = y;
                        y = newValue;
                        endY = y;
                        oldRange = (borderValueX - (-borderValueX));
                        newRange = (0.35 - (-0.35));
                        newValue = (((-xvalue - (-borderValueX)) * newRange) /
                                oldRange) +
                            (-0.35);
                        beginX = x;
                        x = newValue;
                        endX = x;
                      });
                    }
                  },
                  onExit: (event) {
                    print('exited');
                    setState(() {
                      y = 0.0;
                      x = 0.0;
                      beginY = 0.0;
                      endY = 0.0;
                      beginX = 0.0;
                      endX = 0.0;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 400.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: const Color(0xFF1F1F1F),
                              width: 4.0,
                              style: BorderStyle.solid), //Border.all
                          /*** The BorderRadius widget  is here ***/
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(widget.image),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, -30.0),
                          alignment: FractionalOffset.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.text,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 3.h,
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                widget.subText,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
