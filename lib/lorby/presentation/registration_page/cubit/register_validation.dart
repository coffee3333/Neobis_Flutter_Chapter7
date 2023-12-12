import 'package:rxdart/subjects.dart';

mixin RegisterValidation {
  bool rangePassChecker(String value, BehaviorSubject<bool> controller) {
    if (value.length >= 8 && value.length <= 15) {
      controller.sink.add(true);
      return true;
    } else {
      controller.sink.add(false);
      return false;
    }
  }

  bool registerPassChecker(String value, BehaviorSubject<bool> controller) {
    if (value.contains(RegExp(r'[a-z]')) && value.contains(RegExp(r'[A-Z]'))) {
      controller.sink.add(true);
      return true;
    } else {
      controller.sink.add(false);
      return false;
    }
  }

  bool minNumberPassChecker(String value, BehaviorSubject<bool> controller) {
    if (value.contains(RegExp(r'[0-9]'))) {
      controller.sink.add(true);
      return true;
    } else {
      controller.sink.add(false);
      return false;
    }
  }

  bool minSymbolPassChecker(String value, BehaviorSubject<bool> controller) {
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      controller.sink.add(true);
      return true;
    } else {
      controller.sink.add(false);
      return false;
    }
  }

  bool spacePassChecker(String value, BehaviorSubject<bool> controller) {
    if (!value.contains(" ")) {
      controller.sink.add(true);
      return true;
    } else {
      controller.sink.add(false);
      return false;
    }
  }
}
