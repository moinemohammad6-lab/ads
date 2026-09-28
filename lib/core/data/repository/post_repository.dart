import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/data/models/apis/post_model.dart';
import 'package:flutter_application_2/core/data/models/common_response.dart';
import 'package:flutter_application_2/core/data/models/error_model.dart';
import 'package:flutter_application_2/core/data/network/endpoints/posts_endpoints.dart';
import 'package:flutter_application_2/core/data/network/network_config.dart';
import 'package:flutter_application_2/core/services/api_serivce.dart';

import '../../enums/request_type.dart';

class PostRepository {
  final ApiService _apiService = ApiService();

  Future<Either<List<ErrorModel>, List<PostModel>>> getPosts() async {
    try {
      return _apiService
          .request(
            type: RequestType.get,
            subRoute: PostsEndpoints.posts,
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

              final List<PostModel> models =
                  data is List<PostModel>
                      ? data
                      : (data as List)
                          .map(
                            (e) =>
                                PostModel.fromJson(e as Map<String, dynamic>),
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
