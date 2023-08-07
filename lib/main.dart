import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vent_test/blocs/menu/menu_bloc.dart';
import 'package:vent_test/blocs/order/order_bloc.dart';
import 'package:vent_test/blocs/voucher/voucher_bloc.dart';
import 'package:vent_test/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuBloc(),
        ),
        BlocProvider(
          create: (context) => VoucherBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        routes: Routes.list,
        initialRoute: Routes.orderPage,
      ),
    );
  }
}
