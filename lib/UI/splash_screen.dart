import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      onSplashDone();
    });
  }

  onSplashDone() async {
    Get.offAll(() => const MainBottomNavigationbar());
    // BottomshettViewmodel model =
    //     Provider.of<BottomshettViewmodel>(context, listen: false);
    // model.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        decoration: const BoxDecoration(color: primaryColor),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 280.h),
            Image.asset(
              splashLogo,
              height: 213.h,
              width: 162.w,
            ),
            SizedBox(height: 195.h),
            // Row(
            //   children: [
            //     SizedBox(width: 37.w),
            //     workSansText(
            //       text: "swipe right to start",
            //       fontSize: 18.sp,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     const Spacer(),
            //     GestureDetector(
            //         onTap: () {
            //           onSplashDone();
            //         },
            //         child: const CustomButton()),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(context, AppRoutes.login);
            //       },
            //       child: Image.asset(
            //         rightswipe,
            //         height: 100.h,
            //         width: 88.w,
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(89, 96),
          painter: RPSCustomPainter(),
        ),
        Positioned(
          left: 5.w,
          child: CircleContainer(
            height: 56.h,
            width: 56.w,
            color: secondaryColor,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = whiteColor;
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width * 0.4058899, size.height * 0.4981104),
            width: size.width * 0.8235483,
            height: size.height * 0.7416833),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(1.04708, 47.8187);
    path_1.cubicTo(1.04708, 67.7762, 17.5725, 83.943, 36.1243, 83.943);
    path_1.cubicTo(45.4478, 83.943, 50.3403, 81.8773, 54.4075, 79.8114);
    path_1.cubicTo(54.8636, 79.5797, 55.3109, 79.347, 55.7543, 79.1164);
    path_1.cubicTo(59.2922, 77.2758, 62.5781, 75.5663, 68.0603, 75.5663);
    path_1.cubicTo(71.2158, 75.5663, 74.1035, 76.8358, 76.64, 78.6943);
    path_1.cubicTo(79.1757, 80.5521, 81.3875, 83.0176, 83.2051, 85.4631);
    path_1.cubicTo(85.0245, 87.911, 86.4613, 90.3557, 87.4428, 92.1868);
    path_1.cubicTo(87.9339, 93.103, 88.3119, 93.8671, 88.5675, 94.4032);
    path_1.cubicTo(88.6954, 94.6713, 88.7926, 94.8825, 88.8583, 95.0272);
    path_1.cubicTo(88.8911, 95.0996, 88.916, 95.1554, 88.9328, 95.1935);
    path_1.lineTo(88.952, 95.237);
    path_1.lineTo(88.957, 95.2486);
    path_1.lineTo(88.9584, 95.2517);
    path_1.lineTo(88.9587, 95.2526);
    path_1.cubicTo(88.9589, 95.2529, 88.9589, 95.2531, 88.4784, 95.4609);
    path_1.lineTo(87.9979, 95.6687);
    path_1.lineTo(87.9977, 95.6683);
    path_1.lineTo(87.9968, 95.6661);
    path_1.lineTo(87.9926, 95.6566);
    path_1.lineTo(87.9752, 95.6171);
    path_1.cubicTo(87.9596, 95.5819, 87.936, 95.5289, 87.9045, 95.4594);
    path_1.cubicTo(87.8416, 95.3205, 87.7471, 95.1155, 87.6224, 94.8539);
    path_1.cubicTo(87.3729, 94.3306, 87.0023, 93.5814, 86.52, 92.6815);
    path_1.cubicTo(85.5546, 90.8805, 84.1447, 88.4825, 82.3647, 86.0877);
    path_1.cubicTo(80.583, 83.6904, 78.4428, 81.3131, 76.0212, 79.5389);
    path_1.cubicTo(73.6005, 77.7653, 70.9255, 76.6134, 68.0603, 76.6134);
    path_1.cubicTo(62.8441, 76.6134, 59.7708, 78.2101, 56.2404, 80.0444);
    path_1.cubicTo(55.7964, 80.2751, 55.3453, 80.5095, 54.8817, 80.745);
    // path_1.cubicTo(50.7031, 82.8674, 45.6483, 84.9901, 36.1243, 84.9901);
    path_1.cubicTo(16.9812, 84.9901, 0, 68.3413, 0, 47.8187);
    path_1.lineTo(1.04708, 47.8187);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = whiteColor;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(1.04708, 47.8188);
    path_2.cubicTo(1.04708, 27.875, 17.5722, 11.7186, 36.1243, 11.7186);
    path_2.cubicTo(45.4479, 11.7186, 50.3404, 13.783, 54.4076, 15.8475);
    path_2.cubicTo(54.8637, 16.079, 55.311, 16.3116, 55.7544, 16.5421);
    path_2.cubicTo(59.2923, 18.3814, 62.5782, 20.0898, 68.0603, 20.0898);
    path_2.cubicTo(71.2157, 20.0898, 74.1034, 18.8211, 76.6399, 16.9639);
    path_2.cubicTo(79.1756, 15.1073, 81.3874, 12.6434, 83.205, 10.1995);
    path_2.cubicTo(85.0244, 7.75321, 86.4612, 5.31004, 87.4428, 3.48014);
    path_2.cubicTo(87.9339, 2.56456, 88.3118, 1.80095, 88.5675, 1.2652);
    path_2.cubicTo(88.6953, 0.997284, 88.7926, 0.786244, 88.8582, 0.641552);
    path_2.cubicTo(88.891, 0.569203, 88.9159, 0.513433, 88.9327, 0.475424);
    path_2.lineTo(88.9519, 0.431877);
    path_2.lineTo(88.9569, 0.42037);
    path_2.lineTo(88.9583, 0.417231);
    path_2.lineTo(88.9587, 0.416321);
    path_2.cubicTo(88.9588, 0.416051, 88.9589, 0.415854, 88.4784, 0.207939);
    path_2.lineTo(87.9979, 0);
    path_2.lineTo(87.9978, 0.000415549);
    path_2.lineTo(87.9968, 0.00256136);
    path_2.lineTo(87.9927, 0.0120632);
    path_2.lineTo(87.9753, 0.0515191);
    path_2.cubicTo(87.9597, 0.0867658, 87.9361, 0.139696, 87.9046, 0.209132);
    path_2.cubicTo(87.8416, 0.348008, 87.7472, 0.552869, 87.6224, 0.814284);
    path_2.cubicTo(87.3729, 1.33718, 87.0024, 2.08594, 86.5201, 2.9852);
    path_2.cubicTo(85.5547, 4.78497, 84.1448, 7.18137, 82.3648, 9.57464);
    path_2.cubicTo(80.5831, 11.9703, 78.4429, 14.346, 76.0213, 16.1191);
    path_2.cubicTo(73.6006, 17.8915, 70.9256, 19.0427, 68.0603, 19.0427);
    path_2.cubicTo(62.844, 19.0427, 59.7707, 17.447, 56.2403, 15.6139);
    path_2.cubicTo(55.7963, 15.3834, 55.3451, 15.1491, 54.8815, 14.9138);
    // path_2.cubicTo(50.703, 12.7927, 45.6482, 10.6715, 36.1243, 10.6715);
    path_2.cubicTo(16.9815, 10.6715, 0, 27.3092, 0, 47.8188);
    path_2.lineTo(1.04708, 47.8188);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = whiteColor;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(45.8768, 83.2677);
    path_3.lineTo(45.5482, 83.4195);
    path_3.lineTo(43.9775, 12.2179);
    path_3.cubicTo(53.4013, 14.8356, 65.7384, 22.9555, 72.7723, 19.0239);
    path_3.cubicTo(83.1318, 13.0896, 85.3382, 8.80027, 88.4785, 0.938545);
    path_3.lineTo(88.4785, 94.4138);
    path_3.cubicTo(83.8027, 84.6409, 79.8779, 80.4081, 71.2017, 76.0899);
    path_3.cubicTo(67.0437, 73.4912, 60.8201, 76.3657, 45.8768, 83.2677);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01176494;
    paint3Stroke.color = whiteColor;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = whiteColor;
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
