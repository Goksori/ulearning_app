import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';

Widget appOnboardingPage(PageController controller,
    {String imagePath = "assets/images/reading.png",
    String title = "",
    String subTitle = "",
    int index = 0,
    required BuildContext context}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.pushNamed(context, "/signIn");
      }
      debugPrint('my index is $index');
    },
    child: Container(
      width: 325,
      height: 50,
      //color: Colors.red,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(
            text: index < 3 ? 'next' : 'Get started', color: Colors.white),
      ),
    ),
  );
}
