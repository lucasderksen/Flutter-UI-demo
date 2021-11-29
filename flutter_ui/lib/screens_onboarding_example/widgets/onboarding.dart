import 'package:flutter/material.dart';
import 'package:flutter_ui/screens_onboarding_example/widgets/onboarding_slide.dart';

class Onboarding extends StatefulWidget {
  var slides = <OnboardingSlide>[];

  // var currentSlide;

  bool enableNextButton;

  bool enableSkipButton;

  bool enableSlideIndicator;

  var nextButtonText;

  var skipButtonText;

  Onboarding({
    required this.slides,
    //this.currentSlide = 0,
    this.enableNextButton = true,
    this.enableSkipButton = true,
    this.enableSlideIndicator = true,
    this.nextButtonText = 'Next',
    this.skipButtonText = 'Skip',
  });

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int getPageLength() {
    return widget.slides.length;
  }

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: controller,
            itemCount: widget.slides.length,
            itemBuilder: (context, int currentIndex) {
              return widget.slides[currentIndex];
            },
            onPageChanged: (page) {
              setState(() {
                _currentIndex = page;
              });
            },
          )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                if (widget.enableSkipButton)
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        controller.animateToPage(0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeOut);
                      },
                      child: Text(widget.skipButtonText),
                    ),
                  ),
                if (widget.enableSlideIndicator)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, top: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < getPageLength(); i++)
                            if (i == _currentIndex) ...[
                              circleBar(true, context)
                            ] else
                              circleBar(false, context),
                        ],
                      ),
                    ),
                  ),
                if (widget.enableNextButton)
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (_currentIndex < widget.slides.length - 1) {
                          controller.animateToPage(_currentIndex+1,
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeOut);
                        }
                      },
                      child: _currentIndex + 1 == widget.slides.length
                          ? Text('Done')
                          : Text(widget.nextButtonText),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget circleBar(bool isActive, BuildContext context) {
  double _circleSizeActive = 12;
  double _circleSizeInactive = 8;
  if (MediaQuery.of(context).size.width < 380) {
    _circleSizeInactive = 4;
    _circleSizeActive = 8;
  }
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(
        horizontal: _circleSizeInactive, vertical: isActive ? 0 : 2),
    height: isActive ? _circleSizeActive : _circleSizeInactive,
    width: isActive ? _circleSizeActive : _circleSizeInactive,
    decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}
