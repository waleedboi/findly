import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Constant/assets_constant.dart';
import 'Views/BookMarks/bookmark_screen.dart';
import 'Views/Home/home_screen.dart';
import 'Views/Messages/messages_screen.dart';
import 'Views/Profile/profile_screen.dart';

class MainBottomNavigationbar extends StatefulWidget {
  const MainBottomNavigationbar({super.key});

  @override
  State<MainBottomNavigationbar> createState() =>
      _MainBottomNavigationbarState();
}

class _MainBottomNavigationbarState extends State<MainBottomNavigationbar> {
  // int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const MessagesScreen(),
    const BookMarkScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BottomshettViewmodel model =
          Provider.of<BottomshettViewmodel>(context, listen: false);
      model.init();
      model.onItemTapped(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomshettViewmodel>(builder: (context, model, child) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          bool shouldExit = model.onPopScope(didPop);
          if (shouldExit) {
            SystemNavigator.pop(); // Exit the app
          }
        },
        child: Scaffold(
          body: _widgetOptions.elementAt(model.currentIndex),
          bottomNavigationBar: Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.12),
                  spreadRadius: 0,
                  blurRadius: 48,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: SvgPicture.asset(
                        homesvg,
                        width: 18.w,
                        height: 18.h,
                        color:
                            model.currentIndex == 0 ? primaryColor : blackColor,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Image.asset(
                        message2,
                        width: 19.35.w,
                        height: 17.5.h,
                        color: model.currentIndex == 1 ? primaryColor : null,
                      ),
                    ),
                    label: 'Messages',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Image.asset(
                        blackheart,
                        width: 19.35.w,
                        height: 17.h,
                        color: model.currentIndex == 2 ? primaryColor : null,
                      ),
                    ),
                    label: 'Bookmarks',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: SvgPicture.asset(
                        profilesvg,
                        width: 18.w,
                        height: 18.h,
                        color: model.currentIndex == 3 ? primaryColor : null,
                      ),
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: model.currentIndex,
                backgroundColor: whiteColor,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.black,
                useLegacyColorScheme: false,
                selectedLabelStyle: workSansTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
                unselectedLabelStyle: workSansTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor.withOpacity(0.5),
                ),
                onTap: (int index) {
                  BottomshettViewmodel model =
                      Provider.of<BottomshettViewmodel>(context, listen: false);
                  if (index != 0 && model.email == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LogInScreen(isFrombottomSheet: true)),
                    );
                  } else {
                    model.onItemTapped(index);
                  }
                },
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ),
      );
    });
  }
}







//  BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(0),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       home,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 0 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(1),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       message,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 1 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Message',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(2),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       heart,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 2 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Bookmarks',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(3),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       person,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 3 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Profile',
//               ),