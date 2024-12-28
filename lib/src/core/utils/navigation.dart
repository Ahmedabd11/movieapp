import 'package:flutter/material.dart';

navigateToPage(BuildContext context,dynamic screen){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  screen),
  );
}
