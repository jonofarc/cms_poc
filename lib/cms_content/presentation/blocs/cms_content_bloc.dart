import 'package:bloc/bloc.dart';
import 'package:cms_pocs/cms_content/data/models/tools_collection_item.dart';
import 'package:cms_pocs/cms_content/domain/repositories/cms_content_repository.dart';
import 'package:cms_pocs/cms_content/domain/usecases/get_cms_content.dart';
import 'package:cms_pocs/shared/utils/log.dart';
import 'package:cms_pocs/shared/utils/users_utils.dart';
import 'package:flutter/material.dart';

part 'cms_content_event.dart';

part 'cms_content_state.dart';

class CmsContentBloc extends Bloc<CmsContentEvent, CmsContentState> {
  CmsContentBloc() : super(const ContentInitial()) {
    on<LoadCmsContent>(_onLoadCmsContent);
  }

  void _onLoadCmsContent(
      LoadCmsContent event, Emitter<CmsContentState> emit) async {
    try {
      if (state is ContentLoading) {
        Log.debug("$runtimeType attempted to fetch data while loading");
        return;
      }

      emit(const ContentLoading());
      final usersUtils = UsersUtils();

      var countryCode = await usersUtils.getCountryCode(event.country);
      final result = await GetCmsContent().execute(id: countryCode);

      result.fold((error) {
        emit(ContentError(message: error.message));
      },
          (toolsCollectionItem) =>
              emit(ContentSuccess(toolscollectionitem: toolsCollectionItem)));
    } catch (e) {
      Log.debug(e.toString());
      emit(ContentError(message: e.toString()));
    }
  }
}
