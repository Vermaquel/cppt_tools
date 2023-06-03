import 'package:cppt_tools/sys_routes/sys_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: routerConfig,
      ),
    ),
  );
}
