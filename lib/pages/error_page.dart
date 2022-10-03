import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/error404.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Where are you going brother?",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you \nwere requested is already gone",
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                // child: RaisedButton(
                //   onPressed: () {
                //     Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => HomePage(),
                //         ),
                //         (route) => false);
                //   },
                //   color: purpleColor,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(17),
                //   ),
                //   child: Text(
                //     "Back to Home",
                //     style: whiteTextStyle.copyWith(fontSize: 18),
                //   ),
                // ),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  // color: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
