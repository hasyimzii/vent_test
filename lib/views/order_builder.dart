import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vent_test/blocs/menu/menu_bloc.dart';
import 'package:vent_test/core/style.dart';
import 'package:vent_test/models/menu.dart';
import 'package:vent_test/widgets/menu_widget.dart';

class OrderBuilder extends StatelessWidget {
  const OrderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MenuError) {
          return Center(
            child: Text(
              state.message,
              style: regularText(12),
            ),
          );
        } else if (state is MenuLoaded) {
          final List<Menu> menus = state.menus;
          List<int> amounts = [];
          List<TextEditingController> controllers = [];

          return ListView.builder(
            itemCount: menus.length,
            itemBuilder: (context, index) {
              amounts.add(0);
              controllers.add(TextEditingController());

              return StatefulBuilder(builder: (context, setState) {
                return MenuWidget(
                  name: menus[index].name!,
                  price: menus[index].price!,
                  amount: amounts[index],
                  image: menus[index].image!,
                  notesController: controllers[index],
                  plusFunc: () {
                    setState(() => amounts[index]++);
                  },
                  minFunc: () {
                    setState(
                        () => (amounts[index] == 0) ? 0 : amounts[index]--);
                  },
                );
              });
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
