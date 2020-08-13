import 'package:flutter/material.dart';
import 'package:one_more_idea/Home/networkImage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not launch $command");
    }
  }

  final image =
      "https://scontent.fsaw1-7.fna.fbcdn.net/v/t1.0-9/67963534_10157446110571303_9201750729105080320_o.jpg?_nc_cat=107&_nc_sid=85a577&_nc_ohc=Jg7U4jeUVtcAX89TboM&_nc_ht=scontent.fsaw1-7.fna&oh=a939ec44a983b69507fd3449dd7b4a03&oe=5F42CEE5";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00838f),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PNetworkImage(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(30.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Color(0xffb2dfdb),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Mehmet Pala",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Graphic Designer"),
                                    subtitle: Text("USA / UKRAIN"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[Text("ONE")],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[Text("MORE")],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[Text("IDEA")],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffb2dfdb),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Contact information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          onTap: () {
                            customLaunch(
                                "mailto:m@onemoreidea.com?subject=Hello&body=How%20are%20you%20doing?");
                          },
                          subtitle: Text("m@onemoreidea.com"),
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 25,
                                minHeight: 25,
                                maxWidth: 25,
                                maxHeight: 25,
                              ),
                              child: Image.network(
                                  "http://pngimg.com/uploads/gmail_logo/gmail_logo_PNG5.png")),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          onTap: () {
                            customLaunch("tel:+1 917 214 811");
                          },
                          subtitle: Text(
                              "US  +1 917-214-811 \nUA  +380 93 743 65 75"),
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 25,
                                minHeight: 25,
                                maxWidth: 25,
                                maxHeight: 25,
                              ),
                              child: Image.network(
                                  "http://pngimg.com/uploads/phone/phone_PNG447.png")),
                        ),
                        ListTile(
                          title: Text("Website"),
                          onTap: () {
                            customLaunch("http://www.onemoreidea.com");
                          },
                          subtitle: Text("http://www.onemoreidea.com"),
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 25,
                                minHeight: 25,
                                maxWidth: 25,
                                maxHeight: 25,
                              ),
                              child: Image.network(
                                  "https://cdn1.iconfinder.com/data/icons/logotypes/32/chrome-512.png")),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                maxHeight: 40,
                              ),
                              child: Image.network(
                                  "https://cdn2.iconfinder.com/data/icons/pinterest-ui-colored/48/JD-17-512.png")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
