import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:uitest/Models/header_model.dart';

class CoreService extends GetConnect {
  Future<dynamic> getWithAuth({required String url}) async {
    HeaderModel headerModel = HeaderModel(
        authorization:
            "CIGfMA0GCSqGSIb3DQEBAQdqDup1pgSc0tQUMQUAA4GNADCBiQKBgQD3apAg6H2i");
    print(
        "Header : CIGfMA0GCSqGSIb3DQEBAQdqDup1pgSc0tQUMQUAA4GNADCBiQKBgQD3apAg6H2i");
    print("Url : $url");
    var data = await get(url, headers: headerModel.toHeader());
    print("Body : ${data.body}");
    if (data.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar("Data Error", "Not fetched");
      });
      return null;
    } else if (data.status.hasError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar("Status Error", data.statusCode.toString());
      });
      return null;
    } else if (data.status.isServerError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar("Server Error", data.status.isUnauthorized.toString());
      });

      return null;
    } else if (data.status.connectionError) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar(
            "Connection Error", data.status.connectionError.toString());
      });
      return null;
    } else if (data.status.isNotFound) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.snackbar("Not Found", data.status.isNotFound.toString());
      });
      return null;
    } else {
      return data.body;
    }
  }
}
