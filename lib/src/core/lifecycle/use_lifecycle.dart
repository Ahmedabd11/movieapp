import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'lifecycle_base.dart';

abstract class UseLifeCycle extends Lifecycle {
  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) => onReady());
  }

  @override
  @mustCallSuper
  void onReady() {
    super.onReady();
  }

  @override
  @mustCallSuper
  void onClose() {
    super.onClose();
  }
}
