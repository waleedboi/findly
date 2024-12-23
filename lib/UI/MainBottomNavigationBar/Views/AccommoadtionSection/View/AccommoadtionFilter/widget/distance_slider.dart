import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/text_constant.dart';

class CustomSliderValueIndicatorShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.zero;
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    if (labelPainter.text != null) {
      final Offset textOffset = Offset(
        center.dx - (labelPainter.width / 2),
        center.dy - (labelPainter.height + 15), // Adjust the vertical position
      );
      labelPainter.paint(context.canvas, textOffset);
    }
  }
}

class DistanceSlider extends StatefulWidget {
  const DistanceSlider({super.key});

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  double _currentDistanceValue = 3.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbColor: thumbColor,
        trackHeight: 3.0,
        activeTrackColor: thumbColor,
        inactiveTrackColor: const Color(0XFFCEF5FF),
        // overlayColor: const Color(0XFF7BC9DE).withAlpha(32),
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorTextStyle: workSansTextStyle(
          fontSize: 10.sp,
          color: const Color(0XFF9EA0A3),
        ),
        valueIndicatorShape: CustomSliderValueIndicatorShape(),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        // valueIndicatorColor: Colors.transparent,
      ),
      child: Slider(
        value: _currentDistanceValue,
        min: 3.0,
        max: 12.0,
        divisions: null,
        label: '${_currentDistanceValue.round()} km',
        onChanged: (double value) {
          setState(() {
            _currentDistanceValue = value;
          });
        },
      ),
    );
  }
}

Color thumbColor = const Color(0xFF37ABC8);
