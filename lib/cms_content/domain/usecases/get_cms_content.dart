import 'package:cms_pocs/cms_content/data/models/tools_collection_item.dart';
import 'package:cms_pocs/cms_content/domain/repositories/cms_content_repository.dart';
import 'package:cms_pocs/shared/network/failures.dart';
import 'package:dartz/dartz.dart';

class GetCmsContent {
  GetCmsContent();

  Future<Either<ServerFailure, Toolscollectionitem?>> execute(
      {required String id}) async {
    return await CmsContentRepository().fetchCmsContent(id);
  }
}
