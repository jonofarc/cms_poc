import 'package:cached_network_image/cached_network_image.dart';
import 'package:cms_pocs/shared/utils/cms_text_style.dart';
import 'package:cms_pocs/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
    this.url,
    this.image,
    this.country,
  }) : super(key: key);

  final String? url;
  final String? image;
  final String? country;

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // You can add any mutable state or logic here

  final cardWidth = 500.0;
  final cardHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    var bannerWidget = Stack(
      alignment: Alignment.center,
      children: [
        // Background Image
        CachedNetworkImage(
          imageUrl: widget.image ?? "",
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(Radius.circular(paddingDefault)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  _backgroundShadow(),
                ],
              ),
            );
          },
          placeholder: (context, url) => _loadingCardBackground(),
          errorWidget: (context, imageUrl, object) => _defaultCardBackground(),
        ),
        // Text Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(paddingDefault)),
            color: Colors.black.withOpacity(0.4),
          ),
          padding: const EdgeInsets.all(paddingDefault),
          width: cardWidth,
          height: cardHeight,
          // Semi-transparent background
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Align children to the bottom
            children: [
              Row(
                children: [
                  Text(
                    widget.country ?? "",
                    style: CmsTextStyle.large.withColor(Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.link,
                    color: Colors.white,
                  ),
                  Text(
                    widget.url ?? "",
                    style: CmsTextStyle.large.withColor(Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: GestureDetector(
        child: bannerWidget,
        onTap: () {
          _launchUrl();
        },
      ),
    );
  }

  void _launchUrl() async {
    if (widget.url != null && widget.url!.isNotEmpty) {
      Uri uri = Uri.parse(widget.url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    }
  }

  BoxShadow _backgroundShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 8,
      offset: const Offset(0, 2),
    );
  }

  Widget _loadingCardBackground() {
    return Container(
      width: cardWidth - 10,
      height: cardHeight - 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  Widget _defaultCardBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        boxShadow: [
          _backgroundShadow(),
        ],
      ),
    );
  }
}
