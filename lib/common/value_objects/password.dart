import 'package:spice_blog/common/utils/value_object.dart';

class Password extends ValueObject<String?> {
  const Password([super.value]);

  @override
  String? validator() {
    if (value != null) {
      if (value!.length < 8) {
        return 'Password must be of atleast 8 characters';
      }
    }
    return null;
  }

  @override
  Password copyWith({String? value}) {
    return Password(value ?? this.value);
  }
}
