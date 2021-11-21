import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uitest/Models/response_model.dart';
import 'package:uitest/Services.dart/core_services.dart';
import 'package:uitest/url.dart';

class ViewController extends GetxController {
  Rx<AirConditionerResponseModel> airData = AirConditionerResponseModel().obs;

  @override
  // ignore: must_call_super
  onInit() {
    Timer(const Duration(seconds: 0), () {
      Get.isDialogOpen ?? true
          ? const Offstage()
          : Get.dialog(const Center(child: CircularProgressIndicator()),
              barrierDismissible: false);
      fetchData();
    });
  }

  fetchData() async {
    Get.isDialogOpen ?? true
        ? const Offstage()
        : Get.dialog(
            const Center(
              child: CircularProgressIndicator(),
            ),
            barrierDismissible: false);
    var data = await CoreService().getWithAuth(url: testUrl);
    if (Get.isDialogOpen ?? false) Get.back();
    if (data == null) {
    } else {
      var result = AirConditionerResponseModel.fromJson(data);
      if (result.status ?? false) {
        airData.value = result;
        airData.refresh();
        Get.snackbar("Success", "${result.message}",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      } else {
        Get.snackbar("Error", "${result.message}",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      }
    }
  }
}
