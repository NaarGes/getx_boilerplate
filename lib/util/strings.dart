import 'package:get/get.dart';

class Strings extends Translations {
  static const String appName = 'appName';

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      appName: 'App Name', // TODO replace this string
    },
  };
}