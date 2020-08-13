import 'package:flutter/material.dart';
import 'package:one_more_idea/Home/circle_image_profile.dart';
import 'package:one_more_idea/Home/contact.dart';
import 'package:one_more_idea/Home/zoom_scaffold.dart';
import 'package:one_more_idea/main.dart';
import 'package:provider/provider.dart';

import 'circular_image.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://scontent.fsaw1-7.fna.fbcdn.net/v/t1.0-9/67963534_10157446110571303_9201750729105080320_o.jpg?_nc_cat=107&_nc_sid=85a577&_nc_ohc=Jg7U4jeUVtcAX89TboM&_nc_ht=scontent.fsaw1-7.fna&oh=a939ec44a983b69507fd3449dd7b4a03&oe=5F42CEE5";

  final List<MenuItem> options = [
    MenuItem(Icons.movie, 'KEY ART'),
    MenuItem(Icons.photo_album, 'PHOTOGRAPHY'),
    MenuItem(Icons.edit, 'CALLIGRAPHY'),
    MenuItem(Icons.tab, 'TYPOGRAPHY'),
    MenuItem(Icons.add_box, 'LOGO-DESIGN'),
    MenuItem(Icons.adjust, 'FASHION'),
    MenuItem(Icons.navigate_before, 'BEFORE / AFTER'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xff00838f), //ff454dff
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _viewProfilePhoto(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircularImage(
                      NetworkImage(imageUrl),
                    ),
                  ),
                ),
                Text(
                  'One More Idea',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(item.title)));
                  },
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
              leading: Icon(
                Icons.mail,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Contact',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  _viewProfilePhoto(BuildContext context) {
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
                    tag: "$imageUrl",
                    child: CircularImageProfile(
                      NetworkImage(imageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
