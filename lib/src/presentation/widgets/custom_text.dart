import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  const CustomText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
    );
  }
}
