import 'package:cppt_tools/app_cppt_tools/providers/assesment_controller.dart';
import 'package:cppt_tools/app_cppt_tools/providers/const_cppt_tools.dart';
import 'package:cppt_tools/app_cppt_tools/providers/controller_cppt_tools.dart';
import 'package:cppt_tools/sys_data/models/diagnose_entity.dart';
import 'package:cppt_tools/sys_data/models/subjectif_entity_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class Planning extends ConsumerWidget {
  Planning({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  SubjectifEntity cpptData = SubjectifEntity();

  List<String> siapa = ["Pasien", "Keluarga"];
  String bambang = "Pasien";
  final assesmentC = Get.find<AssesmentController>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 600,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Planning',
                  style: textStyleJudul,
                )
              ],
            ),
            Row(
              children: [
                Obx(
                  () => assesmentC.diagnose_selected.value.planning == null
                      ? SizedBox()
                      : Text(
                          assesmentC.diagnose_selected.value.planning!,
                          maxLines: 10,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Clipboard.setData(
                    ClipboardData(
                      text: assesmentC.diagnose_selected.value.planningCopy(),
                    ),
                  );
                  _showToast(
                    context,
                    ref,
                    "Woi Pak, planning berhasil di copas",
                    "",
                  );
                } catch (e) {
                  _showToast(
                    context,
                    ref,
                    "Gagal, hidup anda kurang beruntung",
                    "error",
                  );
                }
              },
              child: const Text(
                'Copy planning',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(
      BuildContext context, WidgetRef ref, String textS, String caseId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: (caseId == "") ? Colors.greenAccent : Colors.redAccent,
        content: Text("$textS"),
      ),
    );
    ref.read(errorCpptProvider.notifier).update("");
  }
}
