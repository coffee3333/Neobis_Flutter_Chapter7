import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/application.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/container/di_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDi();
  runApp(const Application());
}
