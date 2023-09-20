import 'package:cached_network_image/cached_network_image.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:cms_pocs/shared/utils/responsive.dart';
import 'package:cms_pocs/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class GridImages extends StatelessWidget {
  const GridImages({
    super.key,
    this.country,
    this.columnAmount = 1,
    this.imgsQuantity = 4,
  });

  final String? country;
  final int columnAmount;
  final int imgsQuantity;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final gridRowWidth =
        (screenWidth / (Responsive.isDesktop(context) ? 2 : 1));
    final gridRowHeight = (screenWidth);

    final List<String> imageUrls = generateImages(country);

    return SizedBox(
      height:
          (gridRowHeight / columnAmount) * (imgsQuantity / columnAmount).ceil(),
      width: gridRowWidth,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnAmount, // Number of columns
        ),
        itemCount: imageUrls.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: paddingDefault),
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: imageUrls[index],
              placeholder: (context, url) =>
                  LoadingWidget(width: gridRowHeight, height: gridRowWidth),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }

  List<String> generateImages(String? country) {
    return List.generate(
      imgsQuantity,
      (index) =>
          "https://loremflickr.com/500/500/${country ?? ""}/?random=$index",
    );
  }
}
