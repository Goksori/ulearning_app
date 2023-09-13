import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                thirdPartyLogin(),
                Center(
                    child: text14Normal(
                        text: "Or use your email account to login")),
                SizedBox(
                  height: 50.h,
                ),
                //email text box
                appTextField(ref,
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address",
                    obscureText: false,
                    passState: false,
                    context: context),
                SizedBox(
                  height: 20.h,
                ),
                //password text box
                appTextField(ref,
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true,
                    passState: true,
                    context: context),
                SizedBox(
                  height: 20.h,
                ),
                //forgot text
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: textUnderline(text: "Forgot password?"),
                ),
                SizedBox(
                  height: 100.h,
                ),
                // login button
                Center(
                  child: appButton(buttonName: "Login"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // register button
                Center(
                  child: appButton(buttonName: "Register", isLogin: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
