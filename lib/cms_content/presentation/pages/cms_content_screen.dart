import 'package:cms_pocs/cms_content/presentation/blocs/cms_content_bloc.dart';
import 'package:cms_pocs/cms_content/presentation/pages/cms_content_view_desktop.dart';
import 'package:cms_pocs/cms_content/presentation/pages/cms_content_view_mobile.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/banner_widget.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/grid_images.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:cms_pocs/shared/utils/app_utils.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/utils/responsive.dart';
import 'package:cms_pocs/shared/widgets/error_widget.dart';
import 'package:cms_pocs/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmsContentScreen extends StatefulWidget {
  const CmsContentScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  _CmsContentScreenState createState() => _CmsContentScreenState();
}

class _CmsContentScreenState extends State<CmsContentScreen> {
  late List<String> imageUrls;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CmsContentBloc(),
      child: cmsContent(),
    );
  }

  Widget cmsContent() {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppUtils().getDefaultAppbar(context),
        body: BlocBuilder<CmsContentBloc, CmsContentState>(
          builder: (blocContext, state) {
            if (state is ContentSuccess) {
              return successLayout(state);
            } else if (state is ContentInitial) {
              _fetchContent(blocContext);
            } else if (state is ContentError) {
              return errorLayout(blocContext, state.message);
            } else {
              return const LoadingWidget(
                width: double.infinity,
                height: double.infinity,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget successLayout(ContentSuccess state) {
    return Responsive.isMobile(context)
        ? CmsContentViewMobile(user: widget.user, state: state)
        : CmsContentViewDesktop(user: widget.user, state: state);
  }

  Widget errorLayout(BuildContext blocContext, String message) {
    return Center(
      child: GenericErrorWidget(
          message: message,
          voidCallback: () {
            _fetchContent(blocContext);
          }),
    );
  }

  _fetchContent(BuildContext blocContext) {
    BlocProvider.of<CmsContentBloc>(blocContext)
        .add(LoadCmsContent(widget.user.country));
  }
}
