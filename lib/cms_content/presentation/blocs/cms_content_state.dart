part of 'cms_content_bloc.dart';

@immutable
abstract class CmsContentState {
  const CmsContentState();
}

class ContentInitial extends CmsContentState {
  const ContentInitial();
}

class ContentLoading extends CmsContentState {
  const ContentLoading();
}

class ContentSuccess extends CmsContentState {
  final Toolscollectionitem? toolscollectionitem;

  const ContentSuccess({
    required this.toolscollectionitem,
  });
}

class ContentError extends CmsContentState {
  final String message;

  const ContentError({required this.message});
}
