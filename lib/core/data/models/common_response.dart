import 'package:flutter_application_2/core/data/models/error_model.dart';

class CommonResponse<T> {
  int? statusCode;
  T? data;

  String? requestId;
  String? extraCode;
  List<ErrorModel>? errors;
  String? errorMessages;
  String? message;

  // {
  //   "response":{
  //     "extraCode":412
  //   }
  // }

  CommonResponse.fromJson(dynamic json) {
    try {
      statusCode = json["statusCode"];
      print("{StatusCode is $statusCode}");
      extraCode = json["response"]["extraCode"];
      requestId = json["response"]["requestId"];
      if (statusCode == 200 || statusCode == 201 || statusCode == 204) {
        data = json["response"]["data"];
      } else {
        if (json["response"] != null && json["response"]["errors"] != null) {
          errors = <ErrorModel>[];

          // List<dynamic> jsonErrors = json["response"]["errors"];

          // jsonErrors.forEach((value) {
          //    errors!.add(ErrorModel.fromJson(value));
          // });

          json["response"]["errors"].forEach((v) {
            errors!.add(ErrorModel.fromJson(v));
          });
        } else {
          switch (statusCode) {
            case 400:
              errors = [ErrorModel(message: "400_status_error_message")];
              break;
            case 401:
              errors = [ErrorModel(message: "401_status_error_message")];

              break;
            case 404:
              errors = [ErrorModel(message: "404_status_error_message")];

              break;
            case 500:
              errors = [ErrorModel(message: "500_status_error_message")];

              break;
            case 503:
              errors = [ErrorModel(message: "503_status_error_message")];

              break;

            default:
              errors = [ErrorModel(message: "call_unknown_error")];
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int get getStatusCode => statusCode!;

  bool get getStatus => statusCode == 200 ? true : false;

  T get getData => data!;

  List<ErrorModel> get getError => errors ?? [];
}
