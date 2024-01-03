import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends Drawer {
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 150.0,
        child: Column(
          children: <Widget>[
            // DrawerHeader(child: Text("Learn AI & ML")),
            Expanded(
              child: ListView(
                shrinkWrap: true, // Allows the ListView to start just below the DrawerHeader
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: ListTile(
                      title: Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      leading: Icon(Icons.link),
                      // tileColor: Colors.red.withOpacity(0.5),
                      onTap: () {
                        launchUrl(Uri.parse("https://technozonedevelopers.blogspot.com/p/status-quotes-app.html"));
                        // _launchUrlDrawer("https://technozonedevelopers.blogspot.com/p/privacy-policy-punjabi-news-khabra.html");
                      },
                    ),
                  ),
                  // ListTile(
                  //   title: Text("Devp by GSM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  //   // leading: Icon(Icons.star_rate),
                  //   // tileColor: Colors.green,
                  //   onTap: () {
                  //     // _launchUrlDrawer(urlList[2]);
                  //     // launchUrl(Uri.parse("https://technozonedevelopers.blogspot.com/p/contact-us.html"));
                  //
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _Youtube() {
    // Implement the action for the Learn AI & ML tile
  }

  void _Links() {
    // Implement the action for the Use AI Tools tile
  }

  void _launchUrlDrawer(String url) {
    // Implement the action for launching the URL
  }
}
