import 'package:flutter/material.dart';

class OnboardingSlide extends StatefulWidget {
  final Widget mainImage;

  final String subText;
  final TextStyle subTextStyle;

  final String title;
  final TextStyle titleStyle;

  OnboardingSlide({
    required this.mainImage,
    this.title = 'Title',
    this.subText = 'subText',
    this.subTextStyle = const TextStyle(fontSize: 10),
    this.titleStyle = const TextStyle(fontSize: 20),
  });

  @override
  _OnboardingSlideState createState() => _OnboardingSlideState();
}

class _OnboardingSlideState extends State<OnboardingSlide> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: widget.mainImage,
        ),
        Column(
          children: [
            Text(
              widget.title,
              style: widget.titleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.subText,
              style: widget.subTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
