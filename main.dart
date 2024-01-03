


import 'dart:ui' as UI;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myquotes/MyDrawer.dart';
import 'package:myquotes/QuotesPage.dart';
import 'firebase_options.dart';
// import 'package:share_plus/share_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status | Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> quotesData = [
    {'textdata': 'Loading...'}
  ];

  int currentIndex = 0;
  PageController pg = new PageController();
  String selectedLanguage = 'English'; // Default language
  List<dynamic> languageNames = [];

  @override
  void initState() {
    super.initState();
    getLanguages();
  }

  getLanguages() async {
    await FirebaseFirestore.instance
        .collection('languages_dropdown')
        .doc('languages_list')
        .get()
        .then((value) {
      languageNames = value.data()?['languages'];
      print(languageNames);
      fetchQuotesData();
      setState(() {});
    });
  }

  //Firebase Data Fetch
  Future<void> fetchQuotesData() async {
    try {
      // print('Selected Language: ${languageNames[selectedLanguage.index]}');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('quotes_collection')
          .where('Language', isEqualTo: selectedLanguage)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          quotesData = querySnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
          // print(quotesData.toString());
          shuffleQuotesData();
        });
      }
    } catch (e) {
      print("Error fetching quotes data: $e");
    }
  }
  GlobalKey key= GlobalKey();
  // Dropdown for Language
  Widget _buildLanguageDropdown() {
    return DropdownButton<String>(
      value: selectedLanguage,
      onChanged: (String? newValue) {
        // Ensure newValue is non-null before updating the state
        if (newValue != null) {
          setState(() {
            selectedLanguage = newValue;
          });
          // Fetch data when language changes
          fetchQuotesData();
        }
      },
      items: languageNames.map((dynamic language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language, style: TextStyle(fontSize: 20.0,)),
        );
      }).toList(),
    );
  }

  //SHufle Quotes

  // Shuffle the list method
  void shuffleQuotesData() {
    setState(() {
      quotesData.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("ARTICLE DATA");
    // print(quotesData.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Status | Quotes'),
        actions: [
          _buildLanguageDropdown(),
        ],
      ),
      drawer: MyDrawer(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(label: Text("Share"),icon: Icon(Icons.share),onPressed: () async {
            RenderRepaintBoundary boundary =
            key.currentContext!.findRenderObject() as RenderRepaintBoundary;
            UI.Image image = await boundary.toImage(pixelRatio: 3.0);
            ByteData? byteData =
            await image.toByteData(format: UI.ImageByteFormat.png);
            Uint8List pngBytes = byteData!.buffer.asUint8List();

            // Here, you can use the `pngBytes` to share or save the image.
            // For example, you can use the `share` package to share the image.

            // For demonstration purposes, let's print the bytes.
            // print(pngBytes);
            // Share.share(quotesData[currentIndex]['textdata']+'\n check out my website https://example.com',);
            await Share.file('esys image', 'esys.png', pngBytes.buffer.asUint8List(), 'image/png', text: 'Latest Status and Quotes are available at'+ '\nhttps://play.google.com/store/apps/details?id=com.gsm.myquotes');
          },),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: () {
              pg.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
            },
            child: Icon(Icons.arrow_downward_outlined),
          ),
        ],
      ),
      body: RepaintBoundary(
        key:key,
        child: PageView.builder(
          controller: pg,
          scrollDirection: Axis.vertical,
          itemCount: quotesData.length,
          itemBuilder: (context, index) {
            return QuotesPage(quotesData[index]);
          },
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
