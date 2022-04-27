class CallableFunctions {
  static const getCategories = 'getCategories';
  static const saveUserInterests = 'saveUserInterests';
  static const getCountdowns = 'getCountdowns';
}

class FirestoreCollections {
  static const user = 'user';
  static const project = 'project';
  static const task = 'task';
}

Map<String, String> firebaseErrorMessages = {
  'user-not-found': 'User does not exist.',
  'invalid-email': 'Email address is not valid',
  'user-disabled': 'This account has been disabled. Please contact support',
  'wrong-password': 'Incorrect password',
  'email-already-in-use': 'An account with the provided email already exists. Proceed to login',
  'operation-not-allowed': 'An error occurred. Contact support',
  'weak-password': 'Password is too weak',
  'expired-action-code': 'This code has expired. Click resend to get a new one',
  'invalid-action-code': 'The provided code is not valid'
};