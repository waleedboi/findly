import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_buttons.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UnscuccessulPaymentPpoup extends StatelessWidget {
  const UnscuccessulPaymentPpoup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 316.h,
        // width: 338.w,
        // margin: EdgeInsets.symmetric(horizontal: 40.w),
        padding: EdgeInsets.only(top: 36.h, left: 50.w, right: 50.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              blurRadius: 20.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            workSansText(
                text: "Payment Successful",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: blackColor),
            SizedBox(height: 11.h),
            Container(
              height: 102.h,
              width: 102.w,
              padding: EdgeInsets.all(20.r),
              decoration: const BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: <Color>[Color(0xFF18ACFE), Color(0xFFE0014B)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: CustomForwardSplash(
                size: 102.sp,
              ),
            ),
            SizedBox(height: 6.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                workSansText(
                    text: "We could not process your payment,",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
                workSansText(
                    text: "Please try another Method.",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackColor),
              ],
            ),
            SizedBox(height: 26.h),
            PaymentBackButton(
                text: "Ok",
                width: 86.w,
                onTap: () {
                  Get.offAll(() => const MainBottomNavigationbar());
                })
          ],
        ),
      ),
    );
  }
}

class CustomForwardSplash extends StatelessWidget {
  final double size;

  const CustomForwardSplash({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ForwardSlashPainter(),
    );
  }
}

class _ForwardSlashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = size.width * 0.15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-0.285398);
    canvas.translate(-size.width / 2, -size.height / 2);

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.8, size.height * 0.2);

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
