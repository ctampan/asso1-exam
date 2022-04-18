import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import '../services/RandomChat.service.dart';

AppBar appBarWidget(BuildContext context, String title, LocalStorage storage) {
  final theme = Theme.of(context);
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
    ),
    centerTitle: true,
    backgroundColor: theme.primaryColor,
    elevation: 0.0,
    leading: Navigator.canPop(context)
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => {
              postLeaveRandomChat(storage),
              Navigator.of(context).pop(),
            },
          )
        : null,
  );
}
