import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_more_idea/Home/zoom_scaffold.dart';
import 'package:provider/provider.dart';
import 'Home/menu_page.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  String controlText;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(controlText),
    );
  }
}

var images = [
  'http://www.onemoreidea.com/images/page/product/848.jpg',
  'http://www.onemoreidea.com/images/page/product/1.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
  'http://www.onemoreidea.com/images/page/product/829.jpg',
];
var tempList;

class MyHomePage extends StatefulWidget {
  String controlText;
  MyHomePage(this.controlText);
  @override
  _MyHomePageState createState() => new _MyHomePageState(this.controlText);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String controlText;
  _MyHomePageState(this.controlText);

  MenuController menuController;
  var images1;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    _getDataKeyArt().then((value) {
      this.images1 = value;
      this._isLoaded = true;
    });

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
          contentBuilder: (cc) => Container(
            child: Container(
              color: Color(0xff00838f),
              child: _isLoaded == false
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20.0),
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 2,
                      children: List<Widget>.generate(images1.length, (index) {
                        return GridTile(
                            child: GestureDetector(
                          child: Card(
                            shadowColor: Colors.black,
                            color: Color(0xff006064),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "http://www.onemoreidea.com/${images1[index].attributes["href"]}",
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          onTap: () async {
                            _viewTheImage(context, index);
                            //fetchKeyArt.getData();
                            //
                            //await _getData();
                            //getList();
                          },
                        ));
                      }),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void _viewTheImage(BuildContext context, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                    backgroundColor: Color(0xff00838f),
                    body: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Hero(
                          tag:
                              "http://www.onemoreidea.com/${images1[index].attributes["href"]}",
                          child: CachedNetworkImage(
                              imageUrl:
                                  "http://www.onemoreidea.com/${images1[index].attributes["href"]}"),
                        ),
                      ),
                    ),
                  ),
                )));
  }

  Future _getDataKeyArt() async {
    http.Response response;
    switch (controlText) {
      case 'KEY ART':
        response = await http.get('http://www.onemoreidea.com/key-art/');
        break;
      case 'PHOTOGRAPHY':
        response = await http.get('http://www.onemoreidea.com/photography/');
        break;
      case 'CALLIGRAPHY':
        response = await http.get('http://www.onemoreidea.com/calligraphy/');
        break;
      case 'TYPOGRAPHY':
        response = await http.get('http://www.onemoreidea.com/typography/');
        break;
      case 'LOGO-DESIGN':
        response = await http.get('http://www.onemoreidea.com/logo-design/');
        break;
      case 'FASHION':
        response = await http.get('http://www.onemoreidea.com/fashion/');
        break;
      case 'BEFORE / AFTER':
        response = await http.get('http://www.onemoreidea.com/before-after/');
        break;

      default:
        response = await http.get('http://www.onemoreidea.com/key-art/');
    }

    if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);
      var len = document.getElementsByClassName('popup-gallery').length;
      print("uzunluk === ${len}");
      setState(() {
        this._isLoaded = true;
      });

      return await document.getElementsByClassName('popup-gallery');
    } else {
      throw Exception();
    }
  }
}
