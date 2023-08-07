part of 'voucher_bloc.dart';

sealed class VoucherEvent extends Equatable {
  const VoucherEvent();

  @override
  List<Object> get props => [];
}

class GetVoucher extends VoucherEvent {
  final String code;

  const GetVoucher({
    required this.code,
  });

  @override
  List<Object> get props => [code];
}
