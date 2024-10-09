import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:technaureus/my_app.dart';
import 'package:technaureus/utils/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil.init();

  await PrefUtil.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}
