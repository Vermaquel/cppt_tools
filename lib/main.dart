import 'package:cppt_tools/app_cppt_tools/providers/assesment_controller.dart';
import 'package:cppt_tools/sys_routes/sys_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  Get.lazyPut(() => AssesmentController(), fenix: true);
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: routerConfig,
      ),
    ),
  );
}
