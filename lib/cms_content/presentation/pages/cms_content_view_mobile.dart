import 'package:cms_pocs/cms_content/presentation/blocs/cms_content_bloc.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/banner_widget.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/grid_images.dart';
import 'package:cms_pocs/generated/l10n.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:cms_pocs/shared/utils/app_utils.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmsContentViewMobile extends StatefulWidget {
  const CmsContentViewMobile({
    Key? key,
    required this.user,
    required this.state,
  }) : super(key: key);

  final User user;
  final ContentSuccess state;

  @override
  _CmsContentViewMobileState createState() => _CmsContentViewMobileState();
}

class _CmsContentViewMobileState extends State<CmsContentViewMobile> {
  late List<String> imageUrls;
  var columnAmount = 1;
  var imgsQuantity = 8;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: paddingDefault,
        right: paddingDefault,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: paddingDefault,
            ),
            Text(widget.user.getFullName(), style: CmsTextStyle.headingH1),
            const SizedBox(
              height: paddingDefault,
            ),
            Text(widget.state.toolscollectionitem?.description ?? ""),
            const SizedBox(
              height: paddingDefault,
            ),
            BannerWidget(
              url: widget.state.toolscollectionitem?.url,
              image: widget.state.toolscollectionitem?.banner,
              country: widget.state.toolscollectionitem?.country,
            ),
            const SizedBox(
              height: 16,
            ),
            GridImages(
              country: widget.state.toolscollectionitem?.country,
              columnAmount: columnAmount,
              imgsQuantity: imgsQuantity,
            )
          ],
        ),
      ),
    );
  }
}
