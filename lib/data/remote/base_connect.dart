import 'package:get/get.dart';

import '../../util/constant.dart';
import 'api_services.dart';

class BaseConnect extends GetConnect {
  void onInit() {
    httpClient.baseUrl = ApiServices.baseUrl;
    httpClient.timeout = Constant.API_TIMEOUT_DURATION;
    httpClient.defaultContentType = 'application/json';
    super.onInit();
  }

}