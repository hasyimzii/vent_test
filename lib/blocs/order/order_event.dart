part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends OrderEvent {
  final int? voucherId;
  final int discount;
  final int price;
  final List<OrderData> data;

  const CreateOrder({
    this.voucherId,
    required this.discount,
    required this.price,
    required this.data,
  });

  @override
  List<Object> get props => [discount, price, data];
}

class CancelOrder extends OrderEvent {
  final int id;

  const CancelOrder({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
