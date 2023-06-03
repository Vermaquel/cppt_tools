// import 'dart:io';

// import 'package:encrypt/encrypt.dart';
// import 'package:get/get.dart';

// class EncryptController extends GetxController {
//   String encrypt(String input) {
//     const path = 'C:/key.txt';
//     final key = File(path).readAsStringSync();
//     final keyObject = Key.fromUtf8(key);
//     final encrypter = Encrypter(AES(keyObject));

//     return encrypter.encrypt(input).toString();
//   }

//   String decrypt(Encrypted input) {
//     const path = 'C:/key.txt';
//     final key = File(path).readAsStringSync();
//     final keyObject = Key.fromUtf8(key);
//     final encrypter = Encrypter(AES(keyObject));

//     return encrypter.decrypt(input).toString();
//   }
// }
