part of 'voucher_bloc.dart';

sealed class VoucherState extends Equatable {
  const VoucherState();
  
  @override
  List<Object> get props => [];
}

final class VoucherInitial extends VoucherState {}

final class VoucherLoading extends VoucherState {}

final class VoucherLoaded extends VoucherState {
  final List<Voucher> vouchers;

  const VoucherLoaded({
    required this.vouchers,
  });
  
  @override
  List<Object> get props => [vouchers];
}

final class VoucherError extends VoucherState {
  final String message;

  const VoucherError({
    required this.message,
  });
  
  @override
  List<Object> get props => [message];
}
