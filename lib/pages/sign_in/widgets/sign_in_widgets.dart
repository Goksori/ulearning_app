import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

final showPassProvider = StateProvider((ref) => true);

AppBar buildAppbar() {
  return AppBar(
    //backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(
      text: "Log In",
      color: AppColors.primaryText,
    ),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    //onTap: () => ,
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

Widget _showPasswordButton(WidgetRef ref, bool passState) {
  return IconButton(
    onPressed: () {
      ref.read(showPassProvider.notifier).update((state) => !state);
    },
    icon: passState
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility),
  );
}

Widget appTextField(
  WidgetRef ref, {
  String text = "",
  String iconName = "",
  String hintText = "Type yout info",
  bool obscureText = false,
  bool passState = false,
  BuildContext? context,
}) {
  final bool passState = ref.watch(showPassProvider);

  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              // for our text field
              SizedBox(
                width: 280.w,
                height: 50.h,
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      suffixIcon: text == "Password"
                          ? _showPasswordButton(ref, passState)
                          : null,
                      hintText: hintText,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: text == "Password" && passState
                        ? obscureText
                        : text != "Password"
                            ? obscureText
                            : !obscureText),
              )
            ],
          ),
        )
      ],
    ),
  );
}
