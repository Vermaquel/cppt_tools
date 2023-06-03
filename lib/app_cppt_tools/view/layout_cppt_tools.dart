import 'package:cppt_tools/app_cppt_tools/view/cppt_form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutCpptTools extends ConsumerWidget {
  const LayoutCpptTools({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPPT TOOLS 1.0.0'),
        centerTitle: true,
      ),
      body: Center(
        child: CpptForm(),
      ),
    );
  }
}
