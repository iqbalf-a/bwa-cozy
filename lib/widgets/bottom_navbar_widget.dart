import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavbarItem extends StatelessWidget {
  String imgUrl;
  bool isActive;

  BottomNavbarItem({required this.imgUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          this.imgUrl,
          height: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

}
