import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/*
void main() => runApp(new MaterialApp(
      title: 'images',
      home: new Home(),
    ));*/
//List images = List<String>();
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

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: List<Widget>.generate(images.length, (index) {
              return GridTile(
                  child: GestureDetector(
                child: Card(
                  shadowColor: Colors.black,
                  color: Colors.grey,
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                onTap: () {
                  _viewTheImage(context, index);
                  fetchOneMoreIde();
                },
              ));
            }),
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
                    backgroundColor: Colors.grey,
                    body: Center(
                      child: Hero(
                        tag: images[index],
                        child: CachedNetworkImage(imageUrl: images[index]),
                      ),
                    ),
                  ),
                )));
  }

  void fetchOneMoreIde() async {
    //print(await fetcMovies.initiate());
  }
}
