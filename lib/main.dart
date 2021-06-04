import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_routes.dart';
import 'config/my_logger.dart';
import 'view/unknown_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'efood',
      enableLog: false,
      logWriterCallback: localLogWriter,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home_page,
      unknownRoute: GetPage(
          name: AppRoutes.notfound_page, page: () => UnknownRoutePage()),
      getPages: AppRoutes.routes,
      routingCallback: (routing) {
        // if (routing.current == '/second') {
        //   print('this is second page');
        // }
      },
    );
  }
}
