import 'package:cms_pocs/generated/l10n.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/utils/users_utils.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class LoginViewDesktop extends StatelessWidget {
  const LoginViewDesktop({
    super.key,
    required Function(
            {required BuildContext context, required User selectedUser})
        onUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<User> users = UsersUtils().getUsers();
    final s = S();
    const cardWidth = 400.0;

    return Column(
      children: [
        const SizedBox(
          height: paddingDefault,
        ),
        Text(s.userLogin, style: CmsTextStyle.pageTitle),
        const SizedBox(
          height: paddingDefault,
        ),
        Expanded(
            child: Center(
          child: SizedBox(
            width: cardWidth,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onUserSelected(
                        selectedUser: users[index], context: context);
                  },
                  child: UserCard(user: users[index]),
                );
              },
            ),
          ),
        ))
      ],
    );
  }
}
