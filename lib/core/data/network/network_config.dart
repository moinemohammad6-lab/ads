

import 'package:flutter_application_2/core/enums/request_type.dart' show RequestType;

class NetworkConfig {

  static const String Auth_Bearer = "Bearer ";

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    RequestType? type = RequestType.post,
    Map<String, String>? extraHeaders,
  }) {
    return {
      // 'Lang-Id': storage.getAppLanguage()!.id ?? '',
      // 'Currency-Id': storage.getAppCurrency()?.id ?? '',
      // 'Device-Id': '${packageInfoService.androidId}',
      // 'Time-Zone-Offset':
      //     '${DateTime.now().timeZoneOffset.inSeconds.toString()}',
      if (needAuth!) 'Authorization': '$Auth_Bearer ',
      if (type != RequestType.get) 'Content-Type': 'application/json',

      ...extraHeaders ?? {},
    };
  }
}

// List<ErrorModel> getError(String e) {
//   List<ErrorModel> errors = [];
//   ErrorModel errorModel = ErrorModel(key: 'e', message: e.toString());
//   errors.add(errorModel);
//   return errors;
// }
