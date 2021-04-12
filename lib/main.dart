import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'flutter_logo_icon_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        child: Icon(
          Icons.circle,
          size: 30,
          color: _textColor(context),
        ),
        onPressed: () {
          NeumorphicTheme.of(context).themeMode =
              NeumorphicTheme.isUsingDark(context)
                  ? ThemeMode.light
                  : ThemeMode.dark;
          setState(() {
            _isDarkTheme == false ? _isDarkTheme = true : _isDarkTheme = false;
          });
        },
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 300,
            child: NeumorphicIcon(
              FontAwesomeIcons.java,
              size: 150,
            ),
          ),
          Positioned(
            top: 340,
            right: 50,
            child: NeumorphicIcon(
              FontAwesomeIcons.html5,
              size: 150,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 200,
            child: NeumorphicIcon(
              FontAwesomeIcons.css3,
              size: 100,
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: NeumorphicIcon(
              FontAwesomeIcons.database,
              size: 150,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 200,
            child: NeumorphicIcon(
              FontAwesomeIcons.python,
              size: 150,
            ),
          ),
          Positioned(
            top: 80,
            right: 300,
            child: NeumorphicIcon(
              FlutterLogoIcon.flutter,
              size: 190,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.all(Radius.circular(28))),
                  ),
                  child: Container(
                    height: 300,
                    width: 200,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.rect(),
                      ),
                      child: Container(
                          height: 350,
                          width: 400,
                          child: Image.asset(
                            "images/myimage1.jpg",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 45,
                ),
                NeumorphicText(
                  "Yogesh Kumar G",
                  style: NeumorphicStyle(
                    depth: 14, //customize depth here
                    color: _textColor(context), //customize color here
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700 //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 50,
                ),
                NeumorphicText(
                  "Flutter Dev",
                  style: NeumorphicStyle(
                    depth: 14, //customize depth here
                    color: _textColor(context), //customize color here
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700 //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Neumorphic(
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: NeumorphicTheme.embossDepth(context),
                      ),
                      child: IconButton(
                        onPressed: () =>
                            launchURL("https://github.com/Yogesh-333"),
                        icon: FaIcon(FontAwesomeIcons.github),
                        color: _textColor(context),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    Neumorphic(
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: NeumorphicTheme.embossDepth(context),
                      ),
                      child: IconButton(
                        onPressed: () => launchURL(
                          "https://www.linkedin.com/in/yogeshkumar333/",
                        ),
                        icon: FaIcon(FontAwesomeIcons.linkedinIn),
                        color: _textColor(context),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    Neumorphic(
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: NeumorphicTheme.embossDepth(context),
                      ),
                      child: IconButton(
                        onPressed: () => launchURL(
                            "https://unknownauthor-poems.blogspot.com/"),
                        icon: FaIcon(FontAwesomeIcons.bloggerB),
                        color: _textColor(context),
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
