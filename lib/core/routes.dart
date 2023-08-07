import 'package:flutter/material.dart';
import 'package:vent_test/views/order_page.dart';

class Routes {
  // route list
  static String orderPage = '/order_page';

  // route map
  static Map<String, WidgetBuilder> list = {
    orderPage: (context) => const OrderPage(),
  };
}