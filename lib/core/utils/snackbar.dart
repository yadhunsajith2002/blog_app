import 'dart:ui';

import 'package:blog_app/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: AppPallete.transparentColor,
        content: Container(
            padding: const EdgeInsets.all(16),
            // height: 90,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                BackdropFilter(filter: ImageFilter.blur()),
                Text(content),
              ],
            )),
        behavior: SnackBarBehavior.floating,
      ),
    );
}
