import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:turna_tv/presentation/widgets/card_loading.dart';

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageUrl);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: 230.0,
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            cardLoading(context, url, downloadProgress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
