import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facility_item.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    _launchURL(String _url) async => await canLaunch(_url)
        ? await launch(_url)
        : Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ErrorPage()),
          );

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.space.imgUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "\$${widget.space.price}",
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
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rate,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: MAIN FACILITES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Main Facilities",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FacilityItem(
                              name: "kitchen",
                              imgUrl: 'assets/images/ic_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: "bedroom",
                              imgUrl: 'assets/images/ic_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: "cupboard",
                              imgUrl: 'assets/images/ic_cupboard.png',
                              total: widget.space.numberOfCupboard,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Photos",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(left: edge),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          "Location",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.space.address} \n${widget.space.city}",
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _launchURL(widget.space.mapUrl);
                                // _launchURL(
                                //     'https://goo.gl/maps/ueKaHzM4JHjiwWrAA');
                              },
                              child: Image.asset(
                                'assets/images/btn_map.png',
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        // child: RaisedButton(
                        //   color: purpleColor,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(17),
                        //   ),
                        //   onPressed: () {
                        //     // _launchURL('tel:+${widget.space.phone}');
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) => AlertDialog(
                        //         title: Text('Konfirmasi'),
                        //         content: Text('Apakah kamu ingin menelepon pemili kos?'),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () =>
                        //                 Navigator.pop(context, 'Batal'),
                        //             child: Text('Batal'),
                        //           ),
                        //           TextButton(
                        //             onPressed: () => _launchURL(
                        //                 'tel:+${widget.space.phone}'),
                        //             child: Text('Hubungi'),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   child: Text(
                        //     "Book Now",
                        //     style: whiteTextStyle.copyWith(
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // ),
                        child: FloatingActionButton(
                          // color: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          onPressed: () {
                            // _launchURL('tel:+${widget.space.phone}');
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Konfirmasi'),
                                content: Text('Apakah kamu ingin menelepon pemili kos?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Batal'),
                                    child: Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () => _launchURL(
                                        'tel:+${widget.space.phone}'),
                                    child: Text('Hubungi'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/images/btn_wishlisted.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
