import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vent_test/models/voucher.dart';
import 'package:vent_test/services/voucher_api.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  VoucherBloc() : super(VoucherInitial()) {
    on<GetVoucher>((event, emit) async {
      emit(VoucherLoading());

      try {
        final List<Voucher> request = await VoucherApi.getVoucher(code: event.code);
        emit(VoucherLoaded(vouchers: request));
      } catch (e) {
        emit(VoucherError(message: e.toString()));
      }
    });
  }
}
