import 'package:bwa_cozy/models/city_model.dart';
import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/models/tips_model.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_widget.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();
    return Scaffold(
      backgroundColor: whiteColor,
      floatingActionButton: _bottomNavbar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: edge,
            ),
            // NOTE: Title/Header
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Popular cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                        id: 1,
                        name: "Jakarta",
                        imageUrl: 'assets/images/city1.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 2,
                        name: "Bandung",
                        imageUrl: 'assets/images/city2.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: "Surabaya",
                        imageUrl: 'assets/images/city3.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 4,
                        name: "Palembang",
                        imageUrl: 'assets/images/city4.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 5,
                        name: "Aceh",
                        imageUrl: 'assets/images/city5.png',
                        isPopular: true)
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 6,
                        name: "Bogor",
                        imageUrl: 'assets/images/city6.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recommended Space",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: spaceProvider.getRecommendedSpaces(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Space> data =  snapshot.data;

                  int index = 0;

                  return Column(
                    children: data.map((item) => SpaceCard(item)).toList(),
                      // SpaceCard(
                      //   Space(
                      //     id: 1,
                      //     name: "Kuretakeso Hott",
                      //     imgUrl: 'assets/images/space1.png',
                      //     price: 52,
                      //     city: "Bandung",
                      //     country: "Germany",
                      //     rate: 4,
                      //     address: '',
                      //   ),
                      // ),
                      // SpaceCard(
                      //   Space(
                      //       id: 2,
                      //       name: "Roemah Nenek",
                      //       imgUrl: 'assets/images/space2.png',
                      //       price: 11,
                      //       city: "Seattle",
                      //       country: "Bogor",
                      //       rate: 5),
                      // ),
                      // SpaceCard(
                      //   Space(
                      //       id: 3,
                      //       name: "Darling How",
                      //       imgUrl: 'assets/images/space3.png',
                      //       price: 20,
                      //       city: "Jakarta",
                      //       country: "Indonesia",
                      //       rate: 4),
                      // ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

            // NOTE: Tips&Guidance
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Tips & Guidance",
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TipsCard(
              Tips(
                id: 1,
                title: "City Guidelines",
                imgUrl: 'assets/images/ic_tips1.png',
                updatedAt: "20 Apr",
              ),
            ),
            TipsCard(
              Tips(
                id: 2,
                title: "Jakarta Fairship",
                imgUrl: 'assets/images/ic_tips2.png',
                updatedAt: "11 Dec",
              ),
            ),
            SizedBox(height: 30 + edge),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavbar(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width - (2 * edge),
      margin: EdgeInsets.symmetric(
        horizontal: edge,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF6F7F8),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BottomNavbarItem(
            imgUrl: 'assets/images/ic_home.png',
            isActive: true,
          ),
          BottomNavbarItem(
            imgUrl: 'assets/images/ic_mail.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imgUrl: 'assets/images/ic_card.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imgUrl: 'assets/images/ic_love.png',
            isActive: false,
          ),
        ],
      ),
    );
  }
}
