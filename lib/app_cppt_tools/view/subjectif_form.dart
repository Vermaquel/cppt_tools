import 'package:cppt_tools/app_cppt_tools/providers/controller_cppt_tools.dart';
import 'package:cppt_tools/sys_data/models/subjectif_entity_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/const_cppt_tools.dart';

// ignore: must_be_immutable
class SubjectifForm extends ConsumerWidget {
  SubjectifForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  SubjectifEntity cpptData = SubjectifEntity();

  List<String> siapa = ["Pasien", "Keluarga"];
  String bambang = "Pasien";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 600,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          onChanged: () {
            _formKey.currentState!.save();
          },
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(children: [
                  Text(
                    'Subjektif',
                    style: textStyleJudul,
                  ),
                ]),
                Row(
                  children: [
                    SizedBox(
                      width: 110,
                      child: FormBuilderDropdown<String>(
                        // autovalidate: true,
                        name: 'siapa',
                        initialValue: 'Pasien',
                        items: siapa
                            .map((val) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: val,
                                  child: Text(val),
                                ))
                            .toList(),
                        valueTransformer: (val) => val?.toString(),
                        onChanged: (value) => cpptData.siapa = value ?? "",
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: 'subjektif',
                        decoration: const InputDecoration(
                          labelText: 'mengatakan,',
                        ),
                        onChanged: (value) => cpptData.subjektif = value ?? "",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      await Clipboard.setData(
                        ClipboardData(
                          text: cpptData.subToClipboard(),
                        ),
                      );
                      _showToast(
                        context,
                        ref,
                        "Woi Pak, Subjektif berhasil di copas",
                        "",
                      );
                    } else {
                      debugPrint(_formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                      _showToast(
                        context,
                        ref,
                        "Gagal, hidup anda kurang beruntung",
                        "error",
                      );
                    }
                  },
                  child: const Text(
                    'Copy to clipboard',
                  ),
                ),
              ],
            ),
          ),
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
