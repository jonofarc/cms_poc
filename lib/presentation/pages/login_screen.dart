import 'package:cms_pocs/cms_content/presentation/pages/cms_content_screen.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/pages/login_view_desktop.dart';
import 'package:cms_pocs/presentation/pages/login_view_mobile.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:cms_pocs/shared/utils/responsive.dart';
import 'package:cms_pocs/shared/utils/users_utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget layout = Container();

    if (Responsive.isMobile(context)) {
      layout = const LoginViewMobile(
        onUserSelected: onUserSelected,
      );
    } else {
      layout = const LoginViewDesktop(
        onUserSelected: onUserSelected,
      );
    }
    return layout;
  }
}

onUserSelected({required User selectedUser, required BuildContext context}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) {
        return CmsContentScreen(user: selectedUser);
      },
    ),
  );
}
