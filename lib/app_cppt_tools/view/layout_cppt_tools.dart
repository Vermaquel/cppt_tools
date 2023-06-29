// ignore: unused_import
import 'package:cppt_tools/app_cppt_tools/view/assesmen.dart';
import 'package:cppt_tools/app_cppt_tools/view/cppt_form.dart';
import 'package:cppt_tools/app_cppt_tools/view/planning.dart';
import 'package:cppt_tools/app_cppt_tools/view/subjectif_form.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubjectifForm(),
            const Divider(),
            CpptForm(),
            const Divider(),
            AssesmentForm(),
            const Divider(),
            Planning(),
            SizedBox(
              height: 300,
            ),
            const Divider(),
            SizedBox(
                height: 50, child: Text("Develop by Vermaquel and Bang T")),
          ],
        ),
      ),
    );
  }
}
