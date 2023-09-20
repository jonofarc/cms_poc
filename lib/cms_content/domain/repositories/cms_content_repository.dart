import 'dart:convert';

import 'package:cms_pocs/cms_content/data/models/tools_collection.dart';
import 'package:cms_pocs/shared/network/failures.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/utils/log.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:cms_pocs/cms_content/data/models/tools_collection_item.dart';

class CmsContentRepository {
  Future<Either<ServerFailure, Toolscollectionitem?>> fetchCmsContent(
      String id) async {
    final url =
        '${butterCmsBaseUrl}content/?keys=toolscollectionitem[_id=$id]&auth_token=$authToken';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      //firs decode the body to utf8 to avoid problems decoding
      // special characters such as "ñ, ó, á"
      final data = json.decode(utf8.decode(response.bodyBytes));

      try {
        if (data != null) {
          final toolsCollection = ToolsCollection.fromJson(data);
          return Right(toolsCollection.data?.toolscollectionitem?.first);
        } else {
          return Left(ServerFailure(message: nullResponse));
        }
      } catch (e) {
        Log.debug("cmsContent failed to parse ToolsCollection: $e");
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.statusCode.toString()));
    }
  }
}
