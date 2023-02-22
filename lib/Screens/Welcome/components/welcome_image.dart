import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(
                "assets/images/welcome.jpg",
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
        AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      'ยินดีต้อนรับ',
      textStyle: const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.red
      ),
      speed: const Duration(milliseconds: 1000),
    ),
  ],
  
  totalRepeatCount: 4,
  pause: const Duration(milliseconds: 1000),
  displayFullTextOnTap: true,
  stopPauseOnTap: true,
  
)

      ],
      
      
    );
  
  }
  
}
