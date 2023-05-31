import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxString errorMsg = "".obs;

  // Constant
  List<String> keadaanUmum = [
    "Baik",
    "Membaik",
    "Sedang",
    "Perburukan",
  ];

  List<String> kesadaran = [
    "Compos mentis",
    "Dellerium",
    "Apatis",
    "Somnolence",
    "Sub coma",
    "Comma",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
