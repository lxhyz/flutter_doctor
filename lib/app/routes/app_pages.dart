import 'package:get/get.dart';

import '../modules/check_up/bindings/check_up_binding.dart';
import '../modules/check_up/views/check_up_view.dart';
import '../modules/doctor_detail/bindings/doctor_detail_binding.dart';
import '../modules/doctor_detail/views/doctor_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_enter/bindings/login_enter_binding.dart';
import '../modules/login_enter/views/login_enter_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/message_detail/bindings/message_detail_binding.dart';
import '../modules/message_detail/views/message_detail_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/shopping_car/bindings/shopping_car_binding.dart';
import '../modules/shopping_car/views/shopping_car_view.dart';
import '../modules/store/bindings/store_binding.dart';
import '../modules/store/views/store_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_ENTER,
      page: () => LoginEnterView(),
      binding: LoginEnterBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      bindings: [
        RootBinding(),
        HomeBinding(),
        CheckUpBinding(),
        MineBinding(),
        ScheduleBinding()
      ],
    ),
    GetPage(
      name: _Paths.CHECK_UP,
      page: () => const CheckUpView(),
      binding: CheckUpBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAIL,
      page: () => const DoctorDetailView(),
      binding: DoctorDetailBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => const MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => const StoreView(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING_CAR,
      page: () => const ShoppingCarView(),
      binding: ShoppingCarBinding(),
      children: [
        GetPage(
          name: _Paths.SHOPPING_CAR,
          page: () => const ShoppingCarView(),
          binding: ShoppingCarBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_DETAIL,
      page: () => MessageDetailView(),
      binding: MessageDetailBinding(),
    ),
  ];
}
