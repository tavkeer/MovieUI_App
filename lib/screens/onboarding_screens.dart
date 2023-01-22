import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/components/custom_outline.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(children: [
          Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kPinkColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              )),
          Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kGreenColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              )),
          SafeArea(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenWidth * 0.07,
                ),
                CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0.1),
                          Constants.kGreenColor.withOpacity(0.1),
                          Constants.kGreenColor,
                        ],
                        stops: const [
                          0.2,
                          0.4,
                          0.6,
                          1
                        ]),
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/img-onboarding.png'),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft)),
                    )),
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Text(
                  "Watch Movies in\nVirtual Reality",
                  style: TextStyle(
                      fontSize: screenHeight <= 667 ? 18 : 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(0.85)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  "Download and watch offline\n wherever you are",
                  style: TextStyle(
                      fontSize: screenHeight <= 667 ? 12 : 17,
                      color: Colors.white.withOpacity(0.75)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                CustomOutline(
                    strokeWidth: 3,
                    radius: 20,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPinkColor.withOpacity(0.5),
                        Constants.kGreenColor.withOpacity(0.5),
                      ],
                    ),
                    width: 160,
                    height: 38,
                    padding: const EdgeInsets.all(3),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor.withOpacity(0.5),
                              Constants.kGreenColor.withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                      ),
                    )),
                const Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0
                                ? Constants.kGreenColor
                                : Constants.kWhiteColor.withOpacity(0.20),
                          )),
                    )),
                SizedBox(
                  height: screenHeight * 0.01,
                )
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
