import 'package:spice_blog/common/utils/value_object.dart';

class Name extends ValueObject<String?> {
  const Name([super.value]);

  @override
  ValueObject<String?> copyWith({String? value}) {
    return Name(value);
  }

  @override
  String? validator() {
    if (value == null || value!.length < 2) {
      return 'Name must be of atleast 2 characters';
    }
    return null;
  }
}
