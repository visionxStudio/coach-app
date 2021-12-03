// import 'dart:io';

// import 'package:device_info/device_info.dart';
// import 'package:digicoach/src/common/service/api_response_model.dart';
// import 'package:digicoach/src/common/utils/storage/base_storage.dart';
// import 'package:digicoach/src/features/auth/data/model/auth_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authProvider = ChangeNotifierProvider((_) => AuthProvider());

// class AuthProvider extends ChangeNotifier {
//   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   //variable check if login is successful or not.
//   bool isLoginSuccessful = false;

//   String loginErrorMessage = "Authentication Failed, Please Try Again";

//   //userlogin in with device information
//   Future<bool> loginUser(String deviceInfo) async {
//     if (formKey.currentState!.validate()) {
//       print(deviceInfo);
//       UserModel user = UserModel(
//           email: emailController.text,
//           password: passwordController.text,
//           devicename: deviceInfo);
//       ApiResponse response = await authRepo.login(user);
//       if (response.status == "ok") {
//         shareprefrence.save('token', response.payload["token"].toString());
//         return true;
//       } else {
//         loginErrorMessage = response.message;
//         return false;
//       }
//     }
//     return false;
//   }

// //gettting user current device model
//   Future<String> getDeviceName() async {
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       return androidInfo.model;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       return iosInfo.utsname.machine;
//     }
//     return '';
//   }
// }
