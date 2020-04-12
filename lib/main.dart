import 'package:cupertino_stackview_flutter/model/pageinfo.dart';
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:google_fonts/google_fonts.dart';

//  "HomePage",
// "Nature Environment",
// "Plants and trees are giving fruits, a lot of flowers "
// "are blooming with the different colors, making the sea "
// "shine with a surreal blue light,The nature in the summer"
// " season is full of bright colors, everything around is flourishing",

// "Page II",
// "Island with Waterfalls",
// "A bizarre natural phenomenon lights up the water"
// " off these three beaches, making the sea shine"
// " with a surreal blue light",

// "Page III",
// "Evening Sun Set",
// "The nature in the summer season is full of bright colors"
// ", everything around is flourishing, Plants and "
// "trees are giving fruits",

// "Page IV",
// "Mountain & Sky Illustration",
// "Sky illustration like Cosmos and cartoon in a carton Frame, "
// "lights up the water off these three beaches",

// "Page IV",
// "Mountain & Sky Illustration",
// "Sky illustration like Cosmos and cartoon in a carton Frame, "
// "lights up the water off these three beaches",

void main() {
  cupertinoStackViewController = CupertinoStackViewController(navigatorState, {
    "Page I": (BuildContext context, dynamic parameters) {
      return MyHomePage(0);
    },
    "Page II": (BuildContext context, dynamic parameters) {
      return MyHomePage(1);
    },
    "Page III": (BuildContext context, dynamic parameters) {
      return MyHomePage(2);
    },
    "Page IV": (BuildContext context, dynamic parameters) {
      return MyHomePage(3);
    },
  });
  runApp(MyApp());
}

GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(0),
      navigatorKey: navigatorState,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int index;

  const MyHomePage(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageInfo> pageinfos = [
    PageInfo(
      "HomePage",
      "Nature Environment",
      "Plants and trees are giving fruits, a lot of flowers "
          "are blooming with the different colors, making the sea "
          "shine with a surreal blue light,The nature in the summer"
          " season is full of bright colors, everything around is flourishing",
    ),
    PageInfo(
      "Page II",
      "Island with Waterfalls",
      "A bizarre natural phenomenon lights up the water"
          " off these three beaches, making the sea shine"
          " with a surreal blue light",
    ),
    PageInfo(
      "Page III",
      "Evening Sun Set",
      "The nature in the summer season is full of bright colors"
          ", everything around is flourishing, Plants and "
          "trees are giving fruits",
    ),
    PageInfo(
      "Page IV",
      "Mountain & Sky Illustration",
      "Sky illustration like Cosmos and cartoon in a carton Frame, "
          "lights up the water off these three beaches",
    )
  ];
  @override
  Widget build(BuildContext context) {
    cupertinoStackViewController.initialise(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    );
    return CupertinoStackView(
      widget.index == 0,
      pageinfos[widget.index].navigation,
      Scaffold(
        backgroundColor: Color(0xFF2235D9),
        appBar: AppBar(
          backgroundColor: Color(0xFF1B1D1E),
          centerTitle: true,
          title: Text(pageinfos[widget.index].navigation),
          leading: widget.index == 0
              ? null
              : SpringButton(
                  SpringButtonType.OnlyScale,
                  Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  onTapUp: (_) {
                    cupertinoStackViewController.back();
                  },
                ),
        ),
        body: Column(
          children: <Widget>[
            MyPadding(
              Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50.0,
                          spreadRadius: 2.5,
                          color: Color(0xFF1B1D1E),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Container(
                      constraints: BoxConstraints.expand(height: 200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/" + widget.index.toString() + ".jpg",
                            ),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 100,
                            spreadRadius: 5.0,
                            color: Colors.black.withOpacity(0.75),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyPadding(
              RichText(
                text: TextSpan(
                  text: pageinfos[widget.index].title + "\n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: pageinfos[widget.index].text,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            if (widget.index != pageinfos.length - 1)
              Expanded(
                child: Align(
                  alignment: Alignment(0.0, 0.75),
                  child: MyPadding(
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      Container(
                        height: 60,
                        width: 175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white),
                        child: Center(
                          child: Text("Open Stack",
                              style: GoogleFonts.rubik(
                                  color: Colors.black, fontSize: 18.0)),
                        ),
                      ),
                      onTapUp: (_) {
                        cupertinoStackViewController.navigate(
                            pageinfos[widget.index + 1].navigation,
                            context,
                            null);
                      },
                    ),
                  ),
                ),
              ),
            if (widget.index == pageinfos.length - 1)
              Expanded(
                child: Align(
                  alignment: Alignment(0, 0.75),
                  child: MyPadding(
                    SpringButton(
                      SpringButtonType.OnlyScale,
                      Container(
                        height: 60,
                        width: 175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white),
                        child: Center(
                          child: Text("HomePage",
                              style: GoogleFonts.rubik(
                                  color: Colors.black, fontSize: 18.0)),
                        ),
                      ),
                      onTapUp: (_) {
                        cupertinoStackViewController.navigate(
                            pageinfos[0].navigation, context, null);
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      Colors.black,
      isDismissible: widget.index != pageinfos.length - 1,
    );
  }
}

class MyPadding extends StatelessWidget {
  final Widget _child;

  const MyPadding(
    this._child, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: _child,
    );
  }
}
