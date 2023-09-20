import 'package:cms_pocs/cms_content/presentation/blocs/cms_content_bloc.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/banner_widget.dart';
import 'package:cms_pocs/cms_content/presentation/widgets/grid_images.dart';
import 'package:cms_pocs/generated/l10n.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:cms_pocs/shared/utils/app_utils.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/utils/responsive.dart';
import 'package:cms_pocs/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CmsContentViewDesktop extends StatefulWidget {
  const CmsContentViewDesktop({
    Key? key,
    required this.user,
    required this.state,
  }) : super(key: key);

  final User user;
  final ContentSuccess state;

  @override
  _CmsContentViewDesktopState createState() => _CmsContentViewDesktopState();
}

class _CmsContentViewDesktopState extends State<CmsContentViewDesktop> {
  late List<String> imageUrls;
  var columnAmount = 2;
  var imgsQuantity = 8;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: paddingDefault,
          right: paddingDefault,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(paddingDefault),
          child: Column(
            children: [
              const SizedBox(
                height: paddingDefault,
              ),
              Text(widget.user.getFullName(), style: CmsTextStyle.pageTitle),
              const SizedBox(
                height: paddingDefault,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: Responsive.desktopWidth), // Set the maximum width
                child: Center(
                  child:
                      Text(widget.state.toolscollectionitem?.description ?? ""),
                ),
              ),
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
                columnAmount: 4,
                imgsQuantity: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
