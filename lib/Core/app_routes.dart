import 'package:findly/UI/Auth/StudentScreen/student_screen.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:findly/UI/splash_screen.dart';
import 'package:flutter/material.dart';

import '../UI/Auth/AgentScreen/agent_screen.dart';
import '../UI/Auth/ChooseRoleScreen/choose_role_screen.dart';
import '../UI/Auth/CreateAccountScreen/create_account_screen.dart';
import '../UI/Auth/PhotoGrapherScreen/photographer_screen.dart';
import '../UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String createAccount = '/create-account';
  static const String chooseRole = '/choose-role';
  static const String agent = '/agent';
  static const String student = '/student';
  static const String photographer = '/photographer';
  static const String mainBottomNavigationbar = '/main-bottom-navigationbar';
  static const String chatScreen = '/chat-screen';
  static const String subscription = '/subscription';
  //  static const String calender = '/calender';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => LogInScreen(isFrombottomSheet: false),
      createAccount: (context) => CreateAccountScreen(),
      chooseRole: (context) => const  ChooseRoleScreen(),
      student: (context) => const StudentScreen(),
      agent: (context) => AgentScreen(),
      photographer: (context) => PhotoGrapherScreen(),
      mainBottomNavigationbar: (context) => const MainBottomNavigationbar(),
      chatScreen: (context) => ChatScreen(),
      // signUp: (context) => SignUpScreen(),
      // menu: (context) => const MenuScreen(),
      // recording: (context) => RecordingScreen(),
      // calender: (context) => const CalenderScreen(),
      // prevSummeriseScreen: (context) => const PrevsummeriseScreen(),
      // summariseType: (context) => SummarisetypeScreen(),
      // setting: (context) => const SettingScreen(),
      // subscription: (context) => const SubscriptionScreen(),
    };
  }
}
