import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/constants.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

class SearchFieldWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const SearchFieldWidget({super.key, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.12),
            borderRadius: BorderRadius.circular(19)),
        child: Row(children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(Constants.kIconSearch),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(
                color: Constants.kWhiteColor.withOpacity(0.6),
                fontSize: 17,
                letterSpacing: -0.41),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41)),
          )),
          SizedBox(
            width: 12,
          ),
          SvgPicture.asset(Constants.kIconMic),
          SizedBox(
            width: 14,
          ),
        ]),
      ),
    );
  }
}
