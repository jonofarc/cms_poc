import 'package:cms_pocs/generated/l10n.dart';
import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    var s = S();
    return Card(
      margin: const EdgeInsets.all(paddingDefault),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text('${s.name} ${user.getFullName()}'),
        subtitle: Text(
            "${s.email} ${user.email} \n${s.phone} ${user.phoneNumber}  \n${s.country} ${user.country}"),
      ),
    );
  }
}
