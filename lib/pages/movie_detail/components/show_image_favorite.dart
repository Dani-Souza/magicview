import 'dart:io';

import 'package:flutter/material.dart';

class ShowImageFavorite extends StatefulWidget {
  final String fileNameImage;
  const ShowImageFavorite({super.key, required this.fileNameImage});

  @override
  State<ShowImageFavorite> createState() => _ShowImageFavoriteState();
}

class _ShowImageFavoriteState extends State<ShowImageFavorite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250, 150, 0, 0),
      child: SizedBox(
        height: 148,
        width: 98,
        child: Container(
          padding: EdgeInsets.only(right: 30),
          height: 148,
          width: 98,
          child: Image.file(
            File(widget.fileNameImage),
            height: 148,
            width: 98,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
    ;
  }
}
