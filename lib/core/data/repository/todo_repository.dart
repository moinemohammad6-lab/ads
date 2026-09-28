import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/data/models/apis/tode_model.dart';
import 'package:flutter_application_2/core/data/models/common_response.dart';
import 'package:flutter_application_2/core/data/models/error_model.dart';
import 'package:flutter_application_2/core/data/network/endpoints/todos_endpoints.dart';
import 'package:flutter_application_2/core/data/network/network_config.dart';
import 'package:flutter_application_2/core/services/api_serivce.dart';

import '../../enums/request_type.dart';

class TodoRepository {
  final ApiService _apiService = ApiService();

  Future<Either<List<ErrorModel>, List<TodoModel>>> getTodos() async {
    try {
      return _apiService
          .request(
            type: RequestType.get,
            subRoute: TodosEndpoints.todos,
            headers: NetworkConfig.getHeaders(
              type: RequestType.get,
              needAuth: false,
            ),
          )
          .then((response) {
            CommonResponse commonResponse =
                CommonResponse<List<dynamic>>.fromJson(response);

            if (commonResponse.getStatus) {
              final data = commonResponse.data;

              final List<TodoModel> models =
                  data is List<TodoModel>
                      ? data
                      : (data as List)
                          .map(
                            (e) =>
                                TodoModel.fromJson(e as Map<String, dynamic>),
                          )
                          .toList();
              return Right(models);
            } else {
              Map<String, List<ErrorModel>> map = {};
              map[commonResponse.extraCode ?? ''] = commonResponse.getError;
              return Left(commonResponse.getError);
            }
          });
    } catch (e) {
      print(e.toString());
      return Left([ErrorModel(message: e.toString())]);
    }
  }
}
