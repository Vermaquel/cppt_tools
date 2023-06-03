import 'package:cppt_tools/app_cppt_tools/providers/const_cppt_tools.dart';
import 'package:cppt_tools/app_cppt_tools/providers/controller_cppt_tools.dart';
import 'package:cppt_tools/sys_data/models/cppt_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class CpptForm extends ConsumerWidget {
  CpptForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  CpptEntity cpptData = CpptEntity();

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
                FormBuilderDropdown<String>(
                  // autovalidate: true,
                  name: 'keadaanUmum',
                  initialValue: 'Sedang',
                  decoration: InputDecoration(
                    labelText: 'Keadaan Umum:',
                  ),
                  items: keadaanUmum
                      .map((val) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  valueTransformer: (val) => val?.toString(),
                  onChanged: (value) => cpptData.keadaanUmum = value ?? "",
                ),
                FormBuilderDropdown<String>(
                  // autovalidate: true,
                  name: 'kesadaran',
                  initialValue: 'Compos mentis',
                  decoration: InputDecoration(
                    labelText: 'Kesadaran:',
                  ),
                  items: kesadaran
                      .map((val) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  valueTransformer: (val) => val?.toString(),
                  onChanged: (value) => cpptData.kesadaran = value ?? "",
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.number,
                        name: 'td1',
                        decoration: const InputDecoration(
                          labelText: 'TD Sistol:',
                        ),
                        onChanged: (value) => cpptData.td1 = value ?? "",
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          "/",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.number,
                        name: 'td2',
                        decoration: const InputDecoration(
                          labelText: 'TD Diastol:',
                        ),
                        onChanged: (value) => cpptData.td2 = value ?? "",
                      ),
                    ),
                  ],
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'hr',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'HR:',
                  ),
                  onChanged: (value) => cpptData.hr = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'rr',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'RR:',
                  ),
                  onChanged: (value) => cpptData.rr = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 't',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'T:',
                  ),
                  onChanged: (value) => cpptData.t = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'wongbaker',
                  keyboardType: TextInputType.number,
                  initialValue: "3",
                  decoration: const InputDecoration(
                    labelText: 'Wongbaker:',
                  ),
                  onChanged: (value) => cpptData.wongbaker = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'resikoJatuh',
                  keyboardType: TextInputType.number,
                  initialValue: "35",
                  decoration: const InputDecoration(
                    labelText: 'Resiko Jatuh:',
                  ),
                  onChanged: (value) => cpptData.resikoJatuh = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'map',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'MAP:',
                  ),
                  onChanged: (value) => cpptData.map = value ?? "",
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.always,
                  name: 'urin',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Total Urin:',
                  ),
                  onChanged: (value) => cpptData.urin = value ?? "",
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState?.save();
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      await Clipboard.setData(
                        ClipboardData(
                          text: cpptData.toClipboard(),
                        ),
                      );
                      _showToast(
                        context,
                        ref,
                        "Woi Pak, berhasil",
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

// class AddCPPTForm extends GetView<HomeController> {
//   AddCPPTForm({super.key});

//   final _formKey = GlobalKey<FormBuilderState>();
//   late String keadaanUmum = "Sedang",
//       kesadaran = "Compos mentis",
//       td1,
//       td2,
//       hr,
//       rr,
//       t,
//       map = "",
//       urin = "",
//       wongbaker = "3",
//       resikoJatuh = "35";

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 600,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: FormBuilder(
//           onChanged: () {
//             _formKey.currentState!.save();
//           },
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 FormBuilderDropdown<String>(
//                   // autovalidate: true,
//                   name: 'keadaanUmum',
//                   initialValue: 'Sedang',
//                   decoration: InputDecoration(
//                     labelText: 'Keadaan Umum:',
//                   ),
//                   items: controller.keadaanUmum
//                       .map((val) => DropdownMenuItem(
//                             alignment: AlignmentDirectional.center,
//                             value: val,
//                             child: Text(val),
//                           ))
//                       .toList(),
//                   valueTransformer: (val) => val?.toString(),
//                   onChanged: (value) => keadaanUmum = value ?? "",
//                 ),
//                 FormBuilderDropdown<String>(
//                   // autovalidate: true,
//                   name: 'kesadaran',
//                   initialValue: 'Compos mentis',
//                   decoration: InputDecoration(
//                     labelText: 'Kesadaran:',
//                   ),
//                   items: controller.kesadaran
//                       .map((val) => DropdownMenuItem(
//                             alignment: AlignmentDirectional.center,
//                             value: val,
//                             child: Text(val),
//                           ))
//                       .toList(),
//                   valueTransformer: (val) => val?.toString(),
//                   onChanged: (value) => kesadaran = value ?? "",
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: FormBuilderTextField(
//                         autovalidateMode: AutovalidateMode.always,
//                         keyboardType: TextInputType.number,
//                         name: 'td1',
//                         decoration: const InputDecoration(
//                           labelText: 'TD Sistol:',
//                         ),
//                         onChanged: (value) => td1 = value ?? "",
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 40,
//                       child: Center(
//                         child: Text(
//                           "/",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: FormBuilderTextField(
//                         autovalidateMode: AutovalidateMode.always,
//                         keyboardType: TextInputType.number,
//                         name: 'td2',
//                         decoration: const InputDecoration(
//                           labelText: 'TD Diastol:',
//                         ),
//                         onChanged: (value) => td2 = value ?? "",
//                       ),
//                     ),
//                   ],
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'hr',
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'HR:',
//                   ),
//                   onChanged: (value) => hr = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'rr',
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'RR:',
//                   ),
//                   onChanged: (value) => rr = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 't',
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'T:',
//                   ),
//                   onChanged: (value) => t = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'wongbaker',
//                   keyboardType: TextInputType.number,
//                   initialValue: "3",
//                   decoration: const InputDecoration(
//                     labelText: 'Wongbaker:',
//                   ),
//                   onChanged: (value) => wongbaker = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'resikoJatuh',
//                   keyboardType: TextInputType.number,
//                   initialValue: "35",
//                   decoration: const InputDecoration(
//                     labelText: 'Resiko Jatuh:',
//                   ),
//                   onChanged: (value) => resikoJatuh = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'map',
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'MAP:',
//                   ),
//                   onChanged: (value) => map = value ?? "",
//                 ),
//                 FormBuilderTextField(
//                   autovalidateMode: AutovalidateMode.always,
//                   name: 'urin',
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: 'Total Urin:',
//                   ),
//                   onChanged: (value) => urin = value ?? "",
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     _formKey.currentState?.save();
//                     if (_formKey.currentState?.saveAndValidate() ?? false) {
//                       String result =
//                           "Keadaan Umum: $keadaanUmum\nKesadaran: $kesadaran\nTD: $td1/$td2 mmHg\nHR: $hr x/menit\nRR: $rr x/menit\nT: $t C \nWongbaker: $wongbaker\nResiko Jatuh: $resikoJatuh";
//                       if (map != "") {
//                         result += "\nMAP: $map mmHg";
//                       }
//                       if (urin != "") {
//                         result += "\nTotal Urin: $urin cc";
//                       }
//                       await Clipboard.setData(
//                         ClipboardData(
//                           text: result,
//                         ),
//                       );
//                       _showToast(
//                         context,
//                         "Woi Pak, berhasil",
//                         "",
//                       );
//                     } else {
//                       debugPrint(_formKey.currentState?.value.toString());
//                       debugPrint('validation failed');
//                       _showToast(
//                         context,
//                         "Gagal, ${controller.errorMsg.value}",
//                         "error",
//                       );
//                     }
//                     Get.back();
//                   },
//                   child: const Text(
//                     'Copy to clipboard',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showToast(BuildContext context, String textS, String caseId) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: (caseId == "") ? Colors.greenAccent : Colors.redAccent,
//         content: Text("$textS, ${controller.errorMsg.value}"),
//       ),
//     );
//     controller.errorMsg.value = "";
//   }
// }
