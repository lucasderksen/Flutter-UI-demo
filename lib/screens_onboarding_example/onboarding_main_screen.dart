import 'package:flutter/material.dart';
import 'package:flutter_ui/screens_onboarding_example/widgets/onboarding.dart';
import 'package:flutter_ui/screens_onboarding_example/widgets/onboarding_slide.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingMainScreen extends StatefulWidget {
  @override
  _OnboardingMainScreenState createState() => _OnboardingMainScreenState();
}

class _OnboardingMainScreenState extends State<OnboardingMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Onboarding(
          slides: [
            OnboardingSlide(title: 'Discover',subText: 'Lorem ipsum random skjasd jakjs ksksk sjjs aisdj',mainImage: Image.network('https://picsum.photos/250?image=9')
              ,),
            OnboardingSlide(title: 'Discover',subText: 'Lorem ipsum random skjasd jakjs ksksk sjjs aisdj',mainImage: Image.network('https://picsum.photos/250?image=9')
              ,),
            OnboardingSlide(title: 'Discover',subText: 'Lorem ipsum random skjasd jakjs ksksk sjjs aisdj',mainImage: Image.network('https://picsum.photos/250?image=9')
              ,),
            OnboardingSlide(title: 'Discover',subText: 'Lorem ipsum random skjasd jakjs ksksk sjjs aisdj',mainImage: Image.network('https://picsum.photos/250?image=9')
              ,),
            OnboardingSlide(title: 'Discover',subText: 'Lorem ipsum random skjasd jakjs ksksk sjjs aisdj',mainImage: Image.network('https://picsum.photos/250?image=9')
              ,),
          ],
        ),
      ),
    );
  }
}
