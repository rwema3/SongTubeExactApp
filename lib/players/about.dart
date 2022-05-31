import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:songtube/provider/configurationProvider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 16),
            RichText(
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyText1.color
                ),
                children: [
                  TextSpan(
                    text: "It's an Open Source app for media downloading "
                      "or streaming purposes\n\nMeant to be a beautiful, "
                      "fast and functional alternative to other Youtube "
                      "Clients, "
                  ),
               
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Airis Team",
                  style: TextStyle(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 10, 28),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 10, 28),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/images/airis.png',
                      width: MediaQuery.of(context).size.width*0.15,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "We are a Development Team dedicated to professional software "
           
            // Artx Email
            ListTile(
              onTap: () {
                launch('mailto:artx4dev@gmail.com');
              },
              leading: Icon(
                EvaIcons.emailOutline,
                color: Colors.red,
                size: 28,
              ),
              title: Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Product Sans',
                  color: Theme.of(context).textTheme.bodyText1.color
                )
              ),
              subtitle: Text(
                "artx4dev@gmail.com",
                style: TextStyle(
              },
              leading: Image.asset(
                'assets/images/airis.png',
                width: MediaQuery.of(context).size.width*0.09,
              ),
              title: Text(
                "Airis Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
