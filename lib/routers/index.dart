import 'package:get/get.dart';
import 'package:flutter4test/screens/home_page.dart';


// 定义路由的字符串常量
class Routes {
  static const homePage = "/"; // tabbar 包含了4个页面 首页、数据、设备、我的
}

// 定义对应的路由
class AppPage {
  static final routes = [
    GetPage(name: Routes.homePage, page: () => const MyHomePage(title: "首页")),
  ];
}
