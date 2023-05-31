import 'package:cppt_tools/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AddCPPTForm extends GetView<HomeController> {
  AddCPPTForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: FormBuilder(
        onChanged: () {
          _formKey.currentState!.save();
        },
        key: _formKey,
        child: Column(
          children: [
            FormBuilderDropdown<String>(
              // autovalidate: true,
              name: 'keadaanUmum',
              decoration: InputDecoration(
                labelText: 'Keadaan Umum:',
              ),
              items: controller.keadaanUmum
                  .map((val) => DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              valueTransformer: (val) => val?.toString(),
            ),
            FormBuilderDropdown<String>(
              // autovalidate: true,
              name: 'kesadaran',
              decoration: InputDecoration(
                labelText: 'Kesadaran:',
              ),
              items: controller.kesadaran
                  .map((val) => DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              valueTransformer: (val) => val?.toString(),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'td',
              decoration: const InputDecoration(
                labelText: 'TD:',
              ),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'hr',
              decoration: const InputDecoration(
                labelText: 'HR:',
              ),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'rr',
              decoration: const InputDecoration(
                labelText: 'RR:',
              ),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 't',
              decoration: const InputDecoration(
                labelText: 'T:',
              ),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'wongbaker',
              decoration: const InputDecoration(
                labelText: 'Wongbaker:',
              ),
            ),
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.always,
              name: 'resikoJatuh',
              decoration: const InputDecoration(
                labelText: 'Resiko Jatuh:',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                _formKey.currentState?.save();
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  String result =
                      "Keadaan Umum: ${_formKey.currentState!.fields['keadaanUmum']!.value.toString()} \nKesadaran: ${_formKey.currentState!.fields['kesadaran']!.value} \nTD:  ${_formKey.currentState!.fields['td']!.value} mmHg \nHR: ${_formKey.currentState!.fields['hr']!.value} x/menit \nRR: ${_formKey.currentState!.fields['rr']!.value} x/menit \nT: ${_formKey.currentState!.fields['t']!.value} C \nWongbaker: ${_formKey.currentState!.fields['wongbaker']!.value} \nResiko Jatuh: ${_formKey.currentState!.fields['resikoJatuh']!.value}";
                  await Clipboard.setData(
                    ClipboardData(
                      text: result,
                    ),
                  );
                  _showToast(
                    context,
                    "Woi CUK, berhasil",
                    "",
                  );
                } else {
                  debugPrint(_formKey.currentState?.value.toString());
                  debugPrint('validation failed');
                  _showToast(
                    context,
                    "Gagal, ${controller.errorMsg.value}",
                    "error",
                  );
                }
                Get.back();
              },
              child: const Text(
                'Copy to clipboard',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String textS, String caseId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: (caseId == "") ? Colors.greenAccent : Colors.redAccent,
        content: Text("$textS, ${controller.errorMsg.value}"),
      ),
    );
    controller.errorMsg.value = "";
  }
}
