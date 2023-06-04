import 'package:cppt_tools/app_cppt_tools/view/cppt_form.dart';
import 'package:cppt_tools/sys_data/constants/version.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LayoutCpptTools extends ConsumerWidget {
  LayoutCpptTools({super.key});

  final versionConst = VersionConst();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPPT TOOLS ${versionConst.version}'),
        centerTitle: true,
      ),
      body: Center(
        child: CpptForm(),
      ),
    );
  }
}
