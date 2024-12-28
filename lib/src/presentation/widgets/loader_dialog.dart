import 'package:flutter/material.dart';

import '../../core/params/app_ui/app_ui_params.dart';
class LoaderDialogContent extends StatelessWidget {
  final AppUIParams appUIParam;

  const LoaderDialogContent({Key? key, required this.appUIParam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator()
    );
  }
}