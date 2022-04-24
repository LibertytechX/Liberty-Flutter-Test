import 'package:do_it/core/constants/firebase_constants.dart';

String getFirebaseErrorMessageFromCode(String code) {
  return firebaseErrorMessages[code] ?? 'Unknown error';
}

