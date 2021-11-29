import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/screens_onboarding_example/widgets/onboarding.dart';
import 'package:flutter_ui/screens_onboarding_example/widgets/onboarding_slide.dart';

void main() {
  group("Onboarding widget tests", () {

    testWidgets(('should not be able to scroll left on first slide'),
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Onboarding(
            slides: List.generate(
              3,
              (index) => OnboardingSlide(
                mainImage: Image(image: AssetImage('assets/doodle.png')),
                title: index.toString(),
              ),
            ),
          ),
        ),
      );

      await tester.drag(find.byType(PageView), const Offset(500, 0));
      await tester.pump();

      final firstSlideFinder = find.text('0');
      expect(firstSlideFinder, findsOneWidget);
    });

    testWidgets(('should be able to scroll right twice on first slide to reach third and final slide'),
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Onboarding(
                slides: List.generate(
                  3,
                      (index) => OnboardingSlide(
                    mainImage: Image(image: AssetImage('assets/doodle.png')),
                    title: index.toString(),
                  ),
                ),
              ),
            ),
          );

          await tester.drag(find.byType(PageView), const Offset(-500, 0));
          await tester.pump(Duration(milliseconds: 100));

          await tester.drag(find.byType(PageView), const Offset(-500, 0));
          await tester.pump();

          final lastSlideFinder = find.text('2');
          expect(lastSlideFinder, findsOneWidget);
        });
  });
}
