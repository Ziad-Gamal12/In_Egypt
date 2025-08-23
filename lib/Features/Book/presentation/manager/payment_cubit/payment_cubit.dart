import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Book/domain/entities/RequestPaymentMethodReponse.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentInitial());
  final PaymentRepo paymentRepo;

  Future<void> fetchPaymentMethods() async {
    emit(PaymentFetchPaymentMethodsLoading());
    final result = await paymentRepo.fetchPaymentMethods();
    result.fold(
        (failure) => emit(PaymentFetchPaymentMethodsFailure(failure.message)),
        (paymentMethods) =>
            emit(PaymentFetchPaymentMethodsSuccess(paymentMethods)));
  }

  Future<void> requestPaymentMethod(
      {required int methodId, required BookingEntity booking}) async {
    emit(PaymentRequestPaymentMethodLoading());
    final result = await paymentRepo.requestPaymentMethod(
        methodId: methodId, bookingEntity: booking);
    result.fold(
        (failure) => emit(PaymentRequestPaymentMethodFailure(failure.message)),
        (paymentMethods) =>
            emit(PaymentRequestPaymentMethodSuccess(paymentMethods)));
  }
}
