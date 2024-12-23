import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRangeSliderValueIndicatorShape
    extends RangeSliderValueIndicatorShape {
  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    required TextPainter labelPainter,
    required double textScaleFactor,
  }) {
    return Size.zero;
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isOnTop = false,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    Size sizeWithOverflow = Size.zero,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    double textScaleFactor = 1.0,
    Thumb thumb = Thumb.start,
    double value = 0.0,
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

// class CustomRangeSliderThumbShape extends RangeSliderThumbShape {
//   final double enabledThumbRadius;

//   CustomRangeSliderThumbShape({this.enabledThumbRadius = 8.0});

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(enabledThumbRadius);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     bool isDiscrete = false,
//     bool isEnabled = false,
//     bool isOnTop = false,
//     bool isPressed = false,
//     required SliderThemeData sliderTheme,
//     TextDirection textDirection = TextDirection.ltr,
//     Thumb thumb = Thumb.start,
//     double value = 0.0,
//   }) {
//     final Canvas canvas = context.canvas;

//     // Draw the thumb
//     final Paint paint = Paint()..color = const Color(0xFF37ABC8);
//     canvas.drawCircle(center, enabledThumbRadius, paint);

//     // Draw the text near the thumb
//     final String text = thumb == Thumb.start ? 'MIN' : 'MAX';
//     final TextSpan span = TextSpan(
//       style: workSansTextStyle(
//         fontSize: 8.sp,
//         color: const Color(0XFF9EA0A3),
//       ),
//       text: text,
//     );
//     final TextPainter textPainter = TextPainter(
//       text: span,
//       textAlign: TextAlign.center,
//       textDirection: textDirection,
//     );
//     textPainter.layout();

//     final Offset textOffset = Offset(
//       center.dx - textPainter.width / 2,
//       center.dy +
//           enabledThumbRadius +
//           4, // Adjust the vertical position to be below the thumb
//     );
//     textPainter.paint(canvas, textOffset);
//   }
// }

class CustomAgeRangeSlider extends StatefulWidget {
  const CustomAgeRangeSlider({super.key});

  @override
  State<CustomAgeRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomAgeRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(40, 70);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: const Color(0XFF7BC9DE),
        inactiveTrackColor: const Color(0XFFCEF5FF),
        activeTickMarkColor: const Color(0XFF7BC9DE),
        inactiveTickMarkColor: const Color(0XFFCEF5FF),
        trackHeight: 4.0,
        thumbColor: const Color(0XFF7BC9DE),
        overlayColor: const Color(0XFF7BC9DE).withAlpha(32),
        valueIndicatorColor:
            Colors.transparent, // Make the tooltip container transparent
        valueIndicatorTextStyle: workSansTextStyle(
          fontSize: 10.sp,
          color: const Color(0XFF9EA0A3),
        ),
        rangeThumbShape: RoundRangeSliderThumbShape(
          enabledThumbRadius: 8.r,
        ),
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
        rangeValueIndicatorShape: CustomRangeSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.always,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
      ),
      child: RangeSlider(
        values: _currentRangeValues,
        min: 0,
        max: 100,
        divisions: 100,
        labels: RangeLabels(
          '${_currentRangeValues.start.round()}',
          '${_currentRangeValues.end.round()}',
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
