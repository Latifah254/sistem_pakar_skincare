import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/views/splash%20&%20onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Get.off(
          () => const OnboardingScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [

              Color(0xffE8F5E9),

              Color(0xffF5FBF6),

              Colors.white,

            ],

          ),

        ),

        child: SafeArea(

          child: Center(

            child: Column(

              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Container(

                  padding:
                      const EdgeInsets.all(18),

                  decoration: BoxDecoration(

                    color: Colors.white.withOpacity(.85),

                    borderRadius:
                        BorderRadius.circular(24),

                    boxShadow: [

                      BoxShadow(

                        color: Colors.green.withOpacity(.08),

                        blurRadius: 20,

                        offset: const Offset(0, 8),

                      ),

                    ],

                  ),

                  child: Image.asset(

                    "assets/images/UISI.png",

                    width: 140,

                  ),

                ),

                const SizedBox(height: 35),

                const Text(

                  "SkinSense AI",

                  style: TextStyle(

                    fontSize: 34,

                    fontWeight: FontWeight.bold,

                    color: Color(0xff2E8B57),

                    letterSpacing: .3,

                  ),

                ),

                const SizedBox(height: 12),

                const Text(

                  "Personalized Skincare\nRecommendation",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 18,

                    color: Color(0xff707070),

                    height: 1.5,

                  ),

                ),

                const SizedBox(height: 70),

                ClipRRect(

                  borderRadius:
                      BorderRadius.circular(20),

                  child: const SizedBox(

                    width: 170,

                    child: LinearProgressIndicator(

                      minHeight: 7,

                      backgroundColor:

                          Color(0xffCFEFD5),

                      valueColor:

                          AlwaysStoppedAnimation(

                        Color(0xff2E8B57),

                      ),

                    ),

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
 