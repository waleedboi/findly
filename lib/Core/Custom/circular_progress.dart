import 'package:findly/Constant/colors.dart';
import 'package:flutter/material.dart';

class KCircularProgress extends StatelessWidget {
  const KCircularProgress({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? primaryColor,
      ),
    );
  }
}
