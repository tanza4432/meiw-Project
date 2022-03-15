import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hospitel/Theme/theme.dart';

class LoadingFoldingCube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFoldingCube(
          color: ColorBackground,
          size: 50.0,
        ),
      ),
    );
  }
}
