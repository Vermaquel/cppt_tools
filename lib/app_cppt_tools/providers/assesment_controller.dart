import 'package:cppt_tools/sys_data/models/diagnose_entity.dart';
import 'package:get/get.dart';

class AssesmentController extends GetxController {
  Rx<DiagnoseEntity> diagnose_selected = DiagnoseEntity().obs;
}
