import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vent_test/blocs/menu/menu_bloc.dart';
import 'package:vent_test/core/style.dart';
import 'package:vent_test/views/order_builder.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuBloc menuBloc = context.read<MenuBloc>();
    menuBloc.add(GetMenu());

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: RefreshIndicator(
          onRefresh: () async => menuBloc.add(GetMenu()),
          child: Stack(
            children: [
              const OrderBuilder(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Pesanan',
                                style: boldText(16),
                              ),
                              Text(
                                ' (3 Menu)',
                                style: lightText(16),
                              ),
                            ],
                          ),
                          Text(
                            'Rp 28.000',
                            style: primaryText(13),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
