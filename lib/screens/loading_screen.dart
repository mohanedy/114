
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quran_count/services/search_brain.dart';
import 'search_page.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
   initData();
  }
  void initData() async {
   SearchBrain searchBrain = SearchBrain();
    await searchBrain.loadSurah();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return SearchPage(searchBrain);
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
