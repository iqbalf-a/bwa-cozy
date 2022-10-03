import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/pages/detail_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  // SpaceCard(this.space, SpaceCard spaceCard);
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(this.space),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 130,
                    height: 110,
                    child: Stack(
                      children: [
                        Image.network(
                          space.imgUrl,
                          height: 110,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 22,
                                  height: 22,
                                ),
                                Text(
                                  "${space.rate}/5",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      space.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "\$${space.price}",
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: " / month",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("${space.city}, ${space.country}",
                        style: greyTextStyle),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
