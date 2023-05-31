import 'package:cppt_tools/app/modules/home/views/component/add_cppt_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPPT TOOLS by vermaquel'),
        centerTitle: true,
      ),
      body: Obx(
        () => (controller.isLoading.value)
            ? Center(child: AddCPPTForm())
            : CircularProgressIndicator(),
      ),
    );
  }
}
