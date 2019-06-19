import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quran_count/component/rounded_numbers.dart';
import 'package:quran_count/constants.dart';
import 'package:quran_count/services/search_brain.dart';
import 'package:quran_count/services/verse.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shake_event/shake_event.dart';

class SearchPage extends StatefulWidget {
  final SearchBrain brain;

  SearchPage(this.brain);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ShakeHandler {
  List<Verse> verses = [];
  int repeated = 0;
  SearchBrain searchBrain;
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBrain = widget.brain;
  }

  @override
  void dispose() {
    resetShakeListeners();
    super.dispose();
  }

  @override
  shakeEventListener() {
    setState(() {
      Alert(
        context: context,
        title: 'About',
        desc: 'This App developed by @mohaned_y98 using Flutter',
        type: AlertType.info,
        style: AlertStyle(
          titleStyle: TextStyle(
            color: Colors.white,
          ),
          descStyle: kTextStyle,

        ),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    });
    return super.shakeEventListener();
  }

  Widget itemBuilder(context, index) {
    final verse = verses[index];
    return Card(
      child: ListTile(
        subtitle: Text(
          verse.text,
          style: kTextStyle,
        ),
        title: Text(
          verse.surah,
          style: kTextStyle,
        ),
        leading: IconCircularNum(
          number: verse.num,
        ),
        enabled: true,
      ),
    );
  }

  void updateUI(String s) async {
    verses = await searchBrain.searchByWord(s);
    setState(() {
      repeated = searchBrain.repeated;
    });
  }

  Widget loadIndicator() {
    if (load) {
      return Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    startListeningShake(30);
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            loadIndicator(),
            TextField(
              onSubmitted: (s) {
                setState(() {
                  load = true;
                });
                updateUI(s);
                setState(() {
                  load = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'كلمة البحث',
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: Text(
                  'تكررت $repeated',
                  textAlign: TextAlign.center,
                  style: kTextStyle,
                ),
                enabled: true,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: verses.length,
                itemBuilder: itemBuilder,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
