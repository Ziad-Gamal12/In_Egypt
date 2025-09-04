import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:meta/meta.dart';

part 'booking_bloc_event.dart';
part 'booking_bloc_state.dart';

class BookingBloc extends Bloc<BookingBlocEvent, BookingBlocState> {
  final BookingsRepo bookingsRepo;

  BookingBloc({required this.bookingsRepo}) : super(BookingBlocInitial()) {
    on<PaymentSuccessEvent>((event, emit) async {
      emit(BookingAddBookingLoading());

      final qrResult = await bookingsRepo.generateAndUploadQrCode(
          id: event.bookingEntity.id);

      await qrResult.fold(
        (failure) async {
          emit(BookingAddBookingFailure(failure.message));
        },
        (downloadUrl) async {
          event.bookingEntity.qrCodeUrl = downloadUrl;

          final addResult =
              await bookingsRepo.addBooking(bookingEntity: event.bookingEntity);

          addResult.fold(
            (failure) => emit(BookingAddBookingFailure(failure.message)),
            (_) => emit(BookingAddBookingSuccess()),
          );
        },
      );
    });
    on<PaymentFailedEvent>((event, emit) {
      emit(BookingAddBookingFailure("عملية الدفع فاشلة"));
    });
    on<PaymentLoadingEvent>((event, emit) => emit(BookingAddBookingLoading()));
  }
}
