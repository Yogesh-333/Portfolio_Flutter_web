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

class _MyHomePageState extends State<MyHomePage> {
  String imgUrl = "images/myimage1.jpg";
  double initX = 0.0, initY = 0.0;
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          StreamBuilder<GyroscopeEvent>(
              stream: SensorsPlatform.instance.gyroscopeEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.y.abs() > 0.0)
                    initX = initX + (snapshot.data.y);
                  if (snapshot.data.x.abs() > 0.0)
                    initY = initY + (snapshot.data.x);
                }
                return Positioned(
                  left: 10 - initX,
                  right: 10 + initX,
                  top: 10 - initY,
                  bottom: 200 + initY,
                  child: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 230,
                              height: 330,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    isAntiAlias: true,
                                    opacity: 0.8,
                                    image: AssetImage(imgUrl),
                                    colorFilter: new ColorFilter.mode(
                                        Colors.white.withOpacity(.1),
                                        BlendMode.srcOver),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                child: Container(
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Column(
            children: [
              SizedBox(
                height: 65.h,
              ),
              Column(
                children: [
                  NeumorphicText(
                    "Yogesh Kumar G",
                    style: NeumorphicStyle(
                      depth: 50, //customize depth here
                      color: _textColor(context),

                        shadowDarkColor: Color(0xffc27571).withOpacity(1),

                        lightSource: LightSource.topRight//customize color here
                    ),
                    textStyle: NeumorphicTextStyle(
                        fontFamily:'Rubik',
                        fontSize: 6.h,
                        fontWeight: FontWeight.w700 //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  NeumorphicText(
                    "FullStack Dev",
                    style: NeumorphicStyle(
                      depth: 14, //customize depth here
                      color: _textColor(context),

                        shadowDarkColor: Color(0xff78ff9a).withOpacity(1),
                        lightSource: LightSource.topRight//customize color here
                    ),
                    textStyle: NeumorphicTextStyle(
                        fontFamily:'Rubik',
                        fontSize: 5.h,
                        fontWeight: FontWeight.w700 //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 33.33.w,
                      height: 5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF440089)
                        ),
                        onPressed: () =>
                            launchURL("https://github.com/Yogesh-333"),
                        child: FaIcon(FontAwesomeIcons.github),
                      ),
                    ),
                    SizedBox(
                      width: 33.33.w,
                      height: 5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF144477)
                        ),
                        child: FaIcon(FontAwesomeIcons.linkedinIn),
                        onPressed: () =>
                            launchURL("https://github.com/Yogesh-333"),
                      ),
                    ),
                    SizedBox(
                      width: 33.33.w,
                      height: 5.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF7E09)
                        ),
                        onPressed: () => launchURL(
                            "https://unknownauthor-poems.blogspot.com/"),
                        child: FaIcon(FontAwesomeIcons.bloggerB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
          Positioned(
            left: 10,
            right: 10,
            top: 10,
            bottom: 200,
            child: Center(
              child: Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1),
                  image: DecorationImage(
                      image: AssetImage(imgUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
