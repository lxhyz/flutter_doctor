import 'package:doctor/app/data/storage/storage.dart';
import 'package:doctor/app/utils/no_blue_overscroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_route_server.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => Storage().init());
  return runApp(
    ScrollConfiguration(
      behavior: NoBlueOverscrollBehavior(),
      child: GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [AppRouteService()],
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.black
              )
          ),
        ),
        builder: EasyLoading.init(),
      ),
    ),
  );
}
