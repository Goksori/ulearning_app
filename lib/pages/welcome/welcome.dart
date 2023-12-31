import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeInde(value);
                  },
                  controller: _controller,
                  //scrollBehavior: AxisDirection.up,
                  scrollDirection: Axis.horizontal,

                  children: [
                    //first page
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/reading.png",
                        title: "First see Learning",
                        subTitle:
                            "Forget about the paper, now learning all in one place",
                        index: 1,
                        context: context),

                    appOnboardingPage(_controller,
                        imagePath: "assets/images/man.png",
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2,
                        context: context),
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/boy.png",
                        title: "Always Fascinated Learning",
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                        index: 3,
                        context: context),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
