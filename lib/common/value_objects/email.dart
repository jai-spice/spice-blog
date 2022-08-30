import 'package:spice_blog/common/utils/value_object.dart';

class Email extends ValueObject<String?> {
  const Email([super.value]);

  @override
  String? validator() {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value != null) {
      if (!emailRegex.hasMatch(value!)) {
        return "Not a valid email";
      }
    }
    return null;
  }

  @override
  Email copyWith({String? value}) {
    return Email(value ?? this.value);
  }
}
