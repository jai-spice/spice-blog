import 'package:spice_blog/common/base_classes/value_object.dart';

class Url extends ValueObject<String?> {
  const Url([super.value]);

  @override
  ValueObject<String?> copyWith({String? value}) {
    return Url(value ?? this.value);
  }

  @override
  String? validator() {
    final urlRegex = RegExp(
        r'[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
    if (value != null && !urlRegex.hasMatch(value!)) {
      return "Must be a valid URL";
    }
    return null;
  }
}
