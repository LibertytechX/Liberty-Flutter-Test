import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  String message,
  {
    Toast length = Toast.LENGTH_LONG
  }
) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
  );
}