import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/constants.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Container(
        height: screenHight,
        width: screenWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black,
              Color(
                0xff19191b,
              )
            ])),
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: screenHight * 0.5,
              width: screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/movie-posters/img-kgf.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: screenHight * 0.05,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: SvgPicture.asset('assets/svg/icon-back.svg'),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: SvgPicture.asset('assets/svg/icon-menu.svg'),
                    )
                  ]),
            ),
          ),
          Positioned(
            right: 9,
            top: screenHight * 0.43,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xfffe53bb), Color(0xff09fbd3)])),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kGreyColor),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHight * 0.5,
              transform: Matrix4.translationValues(0, -screenHight * 0.05, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: Column(children: [
                      Text(
                        'KGF Chapter 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.kWhiteColor.withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: screenHight < 667 ? 10 : 20,
                      ),
                      Text(
                        '2019 Action-Adventure Drama 2h 32m',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.kWhiteColor.withOpacity(0.8),
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        itemSize: 14,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star,
                            color: Constants.kYellowColor,
                          );
                        },
                        onRatingUpdate: (rating) {
                          debugPrint(rating.toString());
                        },
                        unratedColor: Constants.kWhiteColor,
                      ),
                      Text(
                        "The saga of the Rocky, a race of  Powerful man who lived on Earth and shaped its history and civilizations.",
                        maxLines: screenHight <= 667 ? 2 : 4,
                        style: TextStyle(color: Colors.white.withOpacity(0.75)),
                        textAlign: TextAlign.center,
                      )
                    ]),
                  ),
                  SizedBox(
                    height: screenHight * 0.01,
                  ),
                  Container(
                    height: 2,
                    width: screenWidth * 0.8,
                    color: Constants.kWhiteColor.withOpacity(0.15),
                  ),
                  SizedBox(
                    height: screenHight * 0.01,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Casts',
                              style: TextStyle(
                                  color: Constants.kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHight < 667 ? 10 : 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 16,
                              maxRadius: screenWidth < 375 ? 24 : 30,
                              backgroundImage: const NetworkImage(
                                  "https://m.media-amazon.com/images/M/MV5BNGJlOTljYmQtM2FkYS00YTEyLTliOGItOTA0MzBjZTI3ZDYyXkEyXkFqcGdeQXVyMTQ3Mzk2MDg4._V1_.jpg"),
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 50, maxWidth: 112),
                                transform: Matrix4.translationValues(-6, 0, 0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: const [
                                    MaskedImage(
                                        asset: Constants.kMaskCast,
                                        mask: Constants.kMaskCast),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Yash',
                                          style: TextStyle(
                                              color: Constants.kWhiteColor,
                                              fontSize: 13),
                                          maxLines: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 16,
                              maxRadius: screenWidth < 375 ? 24 : 30,
                              backgroundImage: const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThowF9_uenMdko5WdAdOjw3OehIWvJjuBAMA&usqp=CAU",
                              ),
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 50, maxWidth: 112),
                                transform: Matrix4.translationValues(-6, 0, 0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: const [
                                    MaskedImage(
                                        asset: Constants.kMaskCast,
                                        mask: Constants.kMaskCast),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Sanjay Dutt',
                                          style: TextStyle(
                                              color: Constants.kWhiteColor,
                                              fontSize: 13),
                                          maxLines: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 16,
                              maxRadius: screenWidth < 375 ? 24 : 30,
                              backgroundImage: const NetworkImage(
                                  "https://static.wikia.nocookie.net/villains/images/0/0c/Garuda_KGF.jpg/revision/latest/scale-to-width-down/1200?cb=20220505001027"),
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 50, maxWidth: 112),
                                transform: Matrix4.translationValues(-6, 0, 0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: const [
                                    MaskedImage(
                                        asset: Constants.kMaskCast,
                                        mask: Constants.kMaskCast),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Ramachandra',
                                          style: TextStyle(
                                              color: Constants.kWhiteColor,
                                              fontSize: 13),
                                          maxLines: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              minRadius: 16,
                              maxRadius: screenWidth < 375 ? 24 : 30,
                              backgroundImage: const NetworkImage(
                                "https://www.pinkvilla.com/imageresize/srinidhi_shetty_kgf_chapter_2_interview.jpg?width=752&t=pvorg",
                              ),
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 50, maxWidth: 112),
                                transform: Matrix4.translationValues(-6, 0, 0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: const [
                                    MaskedImage(
                                        asset: Constants.kMaskCast,
                                        mask: Constants.kMaskCast),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Shrindi',
                                          style: TextStyle(
                                              color: Constants.kWhiteColor,
                                              fontSize: 13),
                                          maxLines: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
