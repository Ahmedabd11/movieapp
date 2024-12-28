import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../lifecycle/lifecycle_base.dart';
import '../../typedefs/typedefs.dart';
import '../../utils/global_utils.dart';

//ignore: must_be_immutable
class ConsumerWithOnReadyCallBack<T> extends StatelessWidget
    with LifeCycleBase {
  final ConsumerBuilderCallBack<T> builder;
  final ConsumerReadyCallBack<T>? onModelReady;

  ConsumerWithOnReadyCallBack(
      {Key? key, required this.builder, this.onModelReady})
      : super(key: key) {
    $configureLifeCycle();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, viewModel, child) {
      return builder(context, viewModel, child);
    });
  }

  @override
  void onInit() {
    if (onModelReady != null) {
      // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //   onModelReady!(
      //       Provider.of<T>(navigatorKey.currentState!.context, listen: false));
      // });
      onModelReady!(
          Provider.of<T>(navigatorKey.currentState!.context, listen: false));
    }
    super.onInit();
  }
}