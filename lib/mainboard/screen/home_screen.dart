import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/component/custom_app_bar.dart';
import 'package:hospitel/component/information.dart';
import 'package:url_launcher/link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "รวมข่าวเกี่ยวกับโรคหัวใจ",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Opun',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            WebLink(
              "ข่าวสารโรงพยาบาลศิครินทร์",
              "https://www.sikarin.com/health/%E0%B9%82%E0%B8%A3%E0%B8%84%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%A1%E0%B8%B5%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%B4%E0%B8%94-%E0%B8%AD%E0%B8%B2%E0%B8%81%E0%B8%B2",
            ),
            SizedBox(height: 20),
            WebLink(
              "ข่าวสารโรงพยาบาลหัวใจกรุงเทพ",
              "https://www.bangkokhearthospital.com/content/having-a-safe-sex-with-cardiovascular-disease",
            ),
            SizedBox(height: 20),
            WebLink(
              "ข่าวสารโรงพยาบาลพริ้นซ์ สุวรรณภูมิ",
              "https://www.princsuvarnabhumi.com/content-heart-disease/",
            ),
            SizedBox(height: 20),
            Container(
              width: 500,
              height: 420,
              child: Image.asset(
                'assets/images/news.jpg',
              ),
            )
          ],
        ),
      ),
      // WebView(
      //   javascriptMode: JavascriptMode.unrestricted,
      //   initialUrl:
      //       'https://www.sikarin.com/health/%E0%B9%82%E0%B8%A3%E0%B8%84%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%A1%E0%B8%B5%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%B4%E0%B8%94-%E0%B8%AD%E0%B8%B2%E0%B8%81%E0%B8%B2',
      // ),
    );
  }
}

class WebLink extends StatelessWidget {
  WebLink(this.name, this.link);
  String name;
  String link;

  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse(link),
      builder: (context, followLink) => GestureDetector(
        onTap: followLink,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
