import 'package:genuine_task/app/routes/app_routes.dart';
import 'package:genuine_task/feature/auth/presentation/pages/login_page.dart';
import 'package:genuine_task/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initial = Routes.logIN;

  static final pages = [
    GetPage(name: Routes.logIN, page: () => LoginPage()),
    GetPage(name: Routes.customerList, page: () => DashboardPage()),
  ];
}