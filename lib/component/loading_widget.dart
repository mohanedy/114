import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quran_count/constants.dart';

class LoadingWidget extends StatelessWidget {
  final double size;

  LoadingWidget({this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: PRIMARY_COLOR,
        size: size,
      ),
    );
  }
}
