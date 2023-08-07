import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vent_test/models/menu.dart';
import 'package:vent_test/services/menu_api.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<GetMenu>((event, emit) async {
      emit(MenuLoading());

      try {
        final List<Menu> request = await MenuApi.getMenu();
        emit(MenuLoaded(menus: request));
      } catch (e) {
        emit(MenuError(message: e.toString()));
      }
    });
  }
}
