import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/components/searchfield_widget.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              )),
          Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor.withOpacity(0.5)),
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
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(0.5)),
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
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "What would you\nlike to watch?",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "New movies",
                      style:
                          TextStyle(color: Constants.kWhiteColor, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == newMovies.length - 1) {
                          mask = Constants.kMaskLastIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Upcoming movies",
                      style:
                          TextStyle(color: Constants.kWhiteColor, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == upcomingMovies.length - 1) {
                          mask = Constants.kMaskLastIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MovieDetailScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ))
        ]),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 72,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          notchMargin: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Constants.kIconHome),
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Constants.kIconPlayOnTv),
              )),
              const Expanded(
                child: Text(''),
              ),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Constants.kIconCategories),
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Constants.kIconDownload),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
