import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Container buildHomeLogo(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    child: CachedNetworkImage(
      imageUrl:
      "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/icon_new.jpg",
      width: MediaQuery.of(context).size.width / 1.8,
      alignment: Alignment.center,
    ),
  );
}