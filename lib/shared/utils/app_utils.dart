import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class AppUtils {
  AppBar getDefaultAppbar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title:
          Text(appTitle, style: CmsTextStyle.headingH2.withColor(Colors.white)),
    );
  }
}
