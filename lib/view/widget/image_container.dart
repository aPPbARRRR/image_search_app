// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../domain/image_item.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ImageItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: Hero(
          tag: item.id,
          child: Image.network(fit: BoxFit.cover,
            item.previewURL,
            errorBuilder: (context, _, __) {
              return Image.asset(
                  'assets/images/KakaoTalk_Photo_2023-05-30-12-13-28.jpeg', fit: BoxFit.cover,);
            },
          ),
        ), // 이미지, 스켈레톤 등으로 처리해줄 것.
        color: Colors.amber,
      ),
    );
  }
}
