part of 'cms_content_bloc.dart';

@immutable
abstract class CmsContentEvent {}

class LoadCmsContent extends CmsContentEvent {
  final String country;

  LoadCmsContent(
    this.country,
  );
}

class CheckCmsContentState extends CmsContentEvent {
  CheckCmsContentState();
}
