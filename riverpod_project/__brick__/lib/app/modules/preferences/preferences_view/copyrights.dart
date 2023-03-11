import 'package:flutter/material.dart';

import 'package:utils_widget/utils_widget.dart';

class CopyRights extends StatelessWidget {
  const CopyRights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget sizedBox = SizedBox(
      height: 8,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              'Copyright© 2023, All Rights Reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1,
                wordSpacing: 1,
                color: Colors.grey,
              ),
            ),
          ),
          sizedBox,
          GestureDetector(
            onTap: () => LaunchUtils.launchUrl('https://www.mohesu.com'),
            child: Text(
              'Made by Mohesu.com',
              style: TextStyle(
                letterSpacing: 1,
                wordSpacing: 1,
                color: context.toggleableActiveColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
