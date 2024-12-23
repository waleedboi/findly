// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/Custom/pick_image.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/app_userr_model.dart';
import 'package:findly/Models/user_model.dart';
import 'package:findly/Models/user_response_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'ChooseRoleScreen/choose_role_screen.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateException,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  UserModel userModel = UserModel();
  List<UserModel> users = [];
  //password visibility
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool validatePassword(String password) {
    const String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$';
    final RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(password);
  }

  String? studentProfile;
  void setStudentProfile() {
    ImagePickerUtil.pickImage().then((String? value) async {
      studentProfile = value;
      print("studentProfile $studentProfile");
      notifyListeners();
    });
  }

  String? photographerProfile;
  void setPhotographerProfile() {
    ImagePickerUtil.pickImage().then((String? value) {
      photographerProfile = value;
      notifyListeners();
    });
  }

  String? agentProfile;
  void setAgentProfile() {
    ImagePickerUtil.pickImage().then((String? value) {
      agentProfile = value;
      notifyListeners();
    });
  }

  //***************************** CREATE ACCOUNT *********************/
  setUserData(UserData userData) {
    Provider.of<BottomshettViewmodel>(Get.context!, listen: false).user =
        userData;
    notifyListeners();
  }

  bool studentSignUpLoading = false;
  bool photographerSignUpLoading = false;
  bool agentSignUpLoading = false;
  //create agent account
  UserData user = UserData();
  void createAgentAccount({
    required String username,
    required bool isSocial,
    required String agentNumber,
  }) async {
    agentSignUpLoading = true;
    notifyListeners();

    String image = agentProfile != null
        ? await imageToFirebaseStorage(imagePath: agentProfile!)
        : "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    AgentModel agentData = isSocial
        ? AgentModel(
            email: googleUser!.email,
            firstName: googleUserFirstName,
            lastName: googleUserLastName,
            // password: passwordController.text,
            // confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image != "" ? image : googleUser!.photoUrl,
            role: "Agent",
            signUp: "Social",
            agentNumber: "1234",
          )
        : AgentModel(
            email: emailController.text,
            firstName: firsNameController.text,
            lastName: lastNameController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image,
            role: "Agent",
            signUp: "Email",
            agentNumber: "1234",
          );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: agentData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);
        firebaseSighupWithEmailAndPassword(emailController.text,
            passwordController.text, /*agentData, null, null,*/ user);
        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);
        isSocial
            ? null
            : await tempLogin(
                email: agentData.email!, password: agentData.confirmPassword!);
        await clearDate();
        agentSignUpLoading = false;
        notifyListeners();
        await Get.offAll(const MainBottomNavigationbar());
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error: sdf$errorMessage');
        log('Error stuscode: ${response.statusCode}');
        kGetSnakBar(text: errorMessage, title: "Error");
        agentSignUpLoading = false;
        notifyListeners();
      }
    } catch (e) {
      agentSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  Future<UserCredential> firebaseSighupWithEmailAndPassword(
      String email,
      String password,
      //AgentModel? agent, StudentModel? student,
      // PhotographerModel? photographer,
      UserData user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseSetUserData(/*agent, student, photographer,*/ user);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  firebaseSetUserData(
      // AgentModel? agent, StudentModel? student,
      //   PhotographerModel? photographer,
      UserData user) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .set(UserData.toJson(user));
    // assert(
    //     (agent != null && student == null && photographer == null) ||
    //         (agent == null && student != null && photographer == null) ||
    //         (agent == null && student == null && photographer != null),
    //     "At least one of agent, student, or photographer must be provided.");
    //usertype 1 for agents , 2 for students, 3 for photographers
    // int userType = 0;
    // if (agent != null) {
    //   userType = 1;
    //   FirebaseFirestore.instance.collection('users').doc()
    // } else if (student != null) {
    //   userType = 2;
    // } else if (photographer != null) {
    //   userType = 3;
    // }
  }

  //create student account
  createStudentAccount({
    required String username,
    required bool isSocial,
    required String studentCampus,
    required String studentNumber,
  }) async {
    studentSignUpLoading = true;
    notifyListeners();

    String image = studentProfile != null
        ? await imageToFirebaseStorage(imagePath: studentProfile!)
        : "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    StudentModel studentData = isSocial
        ? StudentModel(
            email: googleUser!.email,
            firstName: googleUserFirstName,
            lastName: googleUserLastName,
            // password: passwordController.text,
            // confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image != "" ? image : googleUser!.photoUrl,
            role: "Student",
            signUp: "Social",
            studentCampus: studentCampus,
            studentNumber: studentNumber,
          )
        : StudentModel(
            email: emailController.text,
            firstName: firsNameController.text,
            lastName: lastNameController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image,
            role: "Student",
            signUp: isSocial ? "Social" : "Email",
            studentCampus: studentCampus,
            studentNumber: studentNumber,
          );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: studentData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);
        firebaseSighupWithEmailAndPassword(emailController.text,
            passwordController.text, /*agentData, null, null,*/ user);
        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');
        isSocial
            ? null
            : await tempLogin(
                email: studentData.email!,
                password: studentData.confirmPassword!);
        await clearDate();

        studentSignUpLoading = false;
        notifyListeners();
        await Get.offAll(const MainBottomNavigationbar());
      } else {
        studentSignUpLoading = false;
        notifyListeners();
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        kGetSnakBar(
            text: errorMessage,
            title: "Error",
            backgroundColor: secondaryColor);
        print('Error: $errorMessage');
        // Handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      studentSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //create photographer account
  void createPhotographerAccount({
    required String username,
    required bool isSocial,
  }) async {
    photographerSignUpLoading = true;
    notifyListeners();

    String image = photographerProfile != null
        ? await imageToFirebaseStorage(imagePath: photographerProfile!)
        : "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    PhotographerModel photographerData = isSocial
        ? PhotographerModel(
            email: googleUser!.email,
            firstName: googleUserFirstName,
            lastName: googleUserLastName,
            // password: passwordController.text,
            // confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image != "" ? image : googleUser!.photoUrl,
            role: "Photographer",
            signUp: "Social",
          )
        : PhotographerModel(
            email: emailController.text,
            firstName: firsNameController.text,
            lastName: lastNameController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            username: username,
            imageUrl: image,
            role: "Photographer",
            signUp: isSocial ? "Social" : "Email",
          );

    try {
      var response = await apiService.request(
        endPoint: userRegisterUrl,
        type: RequestType.post,
        body: photographerData.toJson(),
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        user = UserData.fromJson(responseJson['data']);
        prefs.setString('username', username);
        prefs.setString("email", emailController.text);
        firebaseSighupWithEmailAndPassword(emailController.text,
            passwordController.text, /*agentData, null, null,*/ user);
        print('User ID: ${user.id}');
        print('First Name: ${user.firstName}');
        print('Email: ${user.email}');
        // Handle the dataclearDate
        isSocial
            ? null
            : await tempLogin(
                email: photographerData.email!,
                password: photographerData.confirmPassword!);
        await clearDate();
        photographerSignUpLoading = false;
        notifyListeners();
        await Get.offAll(const MainBottomNavigationbar());
      } else {
        photographerSignUpLoading = false;
        notifyListeners();
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['message'];
        print('Error: $errorMessage');
        // Handle the error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      photographerSignUpLoading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //******************* Login through Social **********************************/
  bool isGoogleSignInLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;
  String googleUserFirstName = "";
  String googleUserLastName = "";
  googleLogin() async {
    print('inside google sign');
    try {
      isGoogleSignInLoading = true;
      notifyListeners();

      await googleSignIn.signOut();

      googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        isGoogleSignInLoading = false;
        notifyListeners();
        return;
      }
      List<String> nameParts = googleUser!.displayName!.split(' ');

      // Extract first name and last name
      googleUserFirstName = nameParts.isNotEmpty ? nameParts[0] : '';
      googleUserLastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
      isGoogleSignInLoading = false;
      // Obtain the auth details from the Google sign-in
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
      Get.to(() => const ChooseRoleScreen(isSocialLogin: true));
    } catch (e) {
      isGoogleSignInLoading = false;
      notifyListeners();
      kGetSnakBar(text: "Something went wrong", title: "Error");
      log('Exception: $e');
    }
    // final GoogleSignInAuthentication googleAuth =
    //     await googleUser.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
  }

  bool isFacebookSignInLoading = false;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  Map<String, dynamic>? facebookUserData;
  String facebookUserFirstName = "";
  String facebookUserLastName = "";

  /// Renamed the method to avoid any name conflict
  Future<void> signInWithFacebook() async {
    try {
      isFacebookSignInLoading = true;
      notifyListeners();

      // Sign out of any existing Facebook session
      await facebookAuth.logOut();

      // Trigger the Facebook sign-in flow
      final LoginResult result = await facebookAuth.login();

      if (result.status == LoginStatus.success) {
        // Get the user data after successful login
        facebookUserData = await facebookAuth.getUserData();

        List<String> nameParts = facebookUserData!['name'].split(' ');

        // Extract first name and last name
        facebookUserFirstName = nameParts.isNotEmpty ? nameParts[0] : '';
        facebookUserLastName =
            nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
        final accessToken = result.accessToken!.tokenString;
        final credential = FacebookAuthProvider.credential(accessToken);
        await FirebaseAuth.instance.signInWithCredential(credential);
        isFacebookSignInLoading = false;
        notifyListeners();

        // Navigate to ChooseRoleScreen after successful login
        Get.to(() => const ChooseRoleScreen(isSocialLogin: true));
      } else {
        // Login was cancelled or failed
        isFacebookSignInLoading = false;
        notifyListeners();
        kGetSnakBar(text: "Facebook login canceled", title: "Error");
      }
    } catch (e) {
      isFacebookSignInLoading = false;
      notifyListeners();
      kGetSnakBar(text: "Something went wrong", title: "Error");
      log('Exception: $e');
    }
  }

  //******************* End Account Creation **********************************/

  setAsGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isguest", true);
  }

  clearDate() {
    studentProfile = null;
    photographerProfile = null;
    agentProfile = null;
    passwordController.clear();
    confirmPasswordController.clear();
    firsNameController.clear();
    lastNameController.clear();
    emailController.clear();
    googleUserFirstName = "";
    googleUserLastName = "";
    googleUser = null;

    notifyListeners();
  }

  //temp login to get access token

  tempLogin({
    required String email,
    required String password,
  }) async {
    try {
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      var response = await apiService.request(
        endPoint: userLoginUrl,
        type: RequestType.post,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        print('Response in temp login: $responseJson');
        print(
            'Response token in temp login: ${responseJson["data"]['accessToken']}');
        prefs.setString('token', responseJson["data"]['accessToken']);
        prefs.setString('email', email);
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error in temp: $errorMessage');
        log('Error stuscode in temp: ${response.statusCode}');
      }
    } catch (e) {
      notifyListeners();
      print('Exception in temp: $e');
    }
  }
}

void logGoogleUserNames(String displayName) {
  // Split the displayName by spaces
  List<String> nameParts = displayName.split(' ');

  // Extract first name and last name
  String firstName = nameParts.isNotEmpty ? nameParts[0] : '';
  String lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

  // Log the first name and last name
  log('Google User first name: $firstName');
  log('Google User last name: $lastName');
}

// Future<void> saveUsersToPrefs() async {
//   final prefs = await SharedPreferences.getInstance();
//   final usersJson = jsonEncode(users.map((user) => user.toJson()).toList());
//   await prefs.setString('users', usersJson);
// }

// Future<List<UserModel>> loadUsers() async {
//   try {
//     final prefs = await SharedPreferences.getInstance();
//     final usersJson = prefs.getString('users');
//     if (usersJson != null) {
//       List<dynamic> usersList = jsonDecode(usersJson);
//       return usersList
//           .map((userJson) => UserModel.fromJson(userJson))
//           .toList();
//     }
//     return [];
//   } catch (e) {
//     log("Error: $e");
//     Get.snackbar('Error', e.toString());
//   }
//   return [];
// }
