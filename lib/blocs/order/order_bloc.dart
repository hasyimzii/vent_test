import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vent_test/models/order.dart';
import 'package:vent_test/services/order_api.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<CreateOrder>((event, emit) async {
      emit(OrderLoading());

      try {
        final String request = await OrderApi.createOrder(
          order: Order(
            voucherId: event.voucherId,
            discount: event.discount,
            price: event.price,
            data: event.data,
          ),
        );
        emit(OrderSuccess(message: request));
      } catch (e) {
        emit(OrderError(message: e.toString()));
      }
    });

    on<CancelOrder>((event, emit) async {
      emit(OrderLoading());

      try {
        final String request = await OrderApi.cancelOrder(id: event.id);
        emit(OrderSuccess(message: request));
      } catch (e) {
        emit(OrderError(message: e.toString()));
      }
    });
  }
}
