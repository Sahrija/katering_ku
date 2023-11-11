import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:flutter_splash_screen/flutter_splash_screen.dart';

import 'pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "KateringKu",
      theme: ThemeData(
        fontFamily: 'Sofia Pro',
        primaryColor: const Color(0xffFE724C),
        // colorScheme: const ColorScheme(
        //   background: Color(0xFFF7F7F7),
        //   primary: Colors.orange,
        //   brightness: Brightness.light,
        //   onPrimary: Colors.white,
        //   secondary: Colors.red,
        //   onSecondary: Colors.red,
        //   error: Colors.red,
        //   onError: Colors.red,
        //   onBackground: Colors.red,
        //   surface: Colors.red,
        //   onSurface: Colors.red,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Get.offAll(
            () => const Splash2(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: SizedBox(
          height: double.maxFinite,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "images/icons/KateringKu.svg",
                ),
                const Text(
                  "KateringKu",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Hidangan istimewa untuk Momen Istimewa Ku",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/splash_screen/background.png",
            fit: BoxFit.fitWidth,
            width: double.maxFinite,
          ),
          Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hero(),
                loginAction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column hero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "images/icons/KateringKuAccent.svg",
        ),
        const Text(
          "KateringKu",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const Text(
          "Hidangan istimewa untuk Momen Istimewa Ku",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column loginAction() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalLine(),
            const Text(
              "Mulai dengan",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            verticalLine(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              "https://lh3.googleusercontent.com/u/0/drive-viewer/AK7aPaDwmaXTiMkcqfoNW0ifo_XM31nlMPD9JRQc9I3lIcTsLnUwecS91m44RzHd_pXeEkOyuuOwhwhk1acrEHEh_GAFqoINCA=w1920-h902",
              width: 130,
            ),
            Image.network(
              "https://lh3.googleusercontent.com/u/0/drive-viewer/AK7aPaA4t3lABhmQlrelOAa5E1Xgc9huCCzGwPqyM6iusPRj2XcM7WM04ZGd8fpMjuJgyykYkTSM-Fku4e3ARCor6oWn3QV2zQ=w1920-h902",
              width: 130,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Get.offAll(
              () => HomeScreen(),
              transition: Transition.native,
              duration: const Duration(
                milliseconds: 500,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            maximumSize: const Size.fromWidth(600),
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(25),
            fixedSize: const Size.fromWidth(double.maxFinite),
            side: const BorderSide(color: Colors.white, width: 2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
          child: const Text("Mulai dengan email/no. telepon"),
        ),
        RichText(
          text: TextSpan(
            style:
                const TextStyle(color: Colors.white, fontFamily: "Sofia Pro"),
            children: [
              const TextSpan(
                text: "Belum punya akun?",
              ),
              TextSpan(
                text: "Daftar",
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // function after Daftar is pressed
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container verticalLine() {
    return Container(
      color: Colors.white54,
      height: 2,
      width: 80,
    );
  }
}
