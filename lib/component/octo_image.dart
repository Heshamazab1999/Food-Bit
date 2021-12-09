import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class LoadImage extends StatelessWidget {
  final String image;
  LoadImage({this.image});
  @override
  Widget build(BuildContext context) {
    return OctoImage(
      width: double.infinity,
      height: double.infinity,
      image: CachedNetworkImageProvider(image,),
      placeholderBuilder: OctoPlaceholder.blurHash(
        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
        fit: BoxFit.cover
      ),
      errorBuilder: (context, url, error) {
        return BlurHash(hash:'LEHV6nWB2yk8pyo0adR*.7kCMdnj');
      },
      fit: BoxFit.cover,
    );
  }
}
