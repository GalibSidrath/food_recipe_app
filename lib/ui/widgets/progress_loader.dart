import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget progressLoader() {
  return Center(
    child: SpinKitThreeInOut(
      color: CupertinoColors.systemBlue,
    ),
  );
}
