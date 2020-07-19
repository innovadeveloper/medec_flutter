import 'package:flutter/material.dart';
import 'package:medec_app/model/onboarding_model.dart';
import 'package:medec_app/utils/AssetsUtils.dart';

var ONBOARDING_DATA_LIST = [
  OnboardingModel(AssetsUtils.BG_ONBOARDING_1, "Search doctors",
      "Get list of best doctor nearby you"),
  OnboardingModel(AssetsUtils.BG_ONBOARDING_2, "Book Appointment",
      "Book an appointment with a right doctor"),
  OnboardingModel(AssetsUtils.BG_ONBOARDING_3, "Book Diagonostic",
      "Search and book diagnostic test"),
];

class Onboarding extends StatelessWidget {
  Onboarding({Key key}) : super(key: key);
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViewBody(context),
    );
  }

  Widget _pageViewBody(BuildContext context) {
    return PageView(
        controller: controller,
        onPageChanged: (page) => {print(page.toString())},
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(ONBOARDING_DATA_LIST.length, (index) {
          return _onboarding(context, ONBOARDING_DATA_LIST[index]);
        }));
  }

  Widget _onboarding(BuildContext context, OnboardingModel onboardingModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 200),
          height: 200,
          width: 300,
          child: Image(
            image: AssetImage(
              onboardingModel.imagePath,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          onboardingModel.title,
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.black,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          onboardingModel.subtitle,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black, fontWeight: FontWeight.w200),
        ),
        Expanded(
          child: Container(),
        ),
        OutlineButton(
          child: new Text("Next"),
          onPressed: () {},
          textColor: Theme.of(context).primaryColor,
          highlightedBorderColor: Theme.of(context).primaryColor,
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(
              30.0,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
