import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imgUrl;
  final double radius;

  const CachedNetworkImageWidget(
      {required this.imgUrl, required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imgUrl,
        placeholder: (context, url) => loadingWidget(),
        errorWidget: (context, url, error) => Image.asset(
          ImageAsset.logoImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: .8),
      highlightColor: Colors.grey.withValues(alpha: .4),
      period: const Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: .6),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
