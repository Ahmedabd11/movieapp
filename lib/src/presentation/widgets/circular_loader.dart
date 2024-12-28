
import 'package:flutter/material.dart';

import '../../core/utils/app_custom_color.dart';
import '../../injector.dart';


class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(

      child: CircularProgressIndicator(
        color: injector<AppCustomColor>().mainContentColor,
      ),
    );
  }
}
