import 'package:formz/formz.dart';

/// Validation errors for the [Phone] [FormzInput].
enum PhoneValidationError {
  /// Generic invalid error.
  invalid
}

/// Form input for an phone input.
class Phone extends FormzInput<String, PhoneValidationError> {
  /// {@macro phone}
  const Phone.pure() : super.pure('');

  /// {@macro phone}
  const Phone.dirty([String value = '']) : super.dirty(value);

  // static final RegExp _phoneRegExp = RegExp(
  //   r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
  // );
  static final RegExp _phoneRegExp = RegExp(
    '[0-9]{8,9}',
  );

  @override
  PhoneValidationError? validator(String? value) {
    return null;
    // return (value==null || value.isEmpty)
    //     ? PhoneValidationError.invalid
    //     :null;
    return _phoneRegExp.hasMatch(value ?? '')
        ? null
        : PhoneValidationError.invalid;
  }
}
