import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GenericErrorWidget extends StatelessWidget {
  final VoidCallback voidCallback;
  final String message;

  const GenericErrorWidget({
    Key? key,
    required this.voidCallback,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap here, you can add your custom logic
        voidCallback();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              size: 48.0,
              color: Colors.white,
            ),
            const SizedBox(height: paddingDefault), // Add spacing
            Text(
              tryAgainError,
              style: CmsTextStyle.large.withColor(Colors.white),
            ),
            const SizedBox(height: paddingDefault), // Add spacing
            Padding(
              padding: EdgeInsets.all(paddingDefault),
              child: Text(
                textAlign: TextAlign.center,
                message,
                style: CmsTextStyle.small.withColor(Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
