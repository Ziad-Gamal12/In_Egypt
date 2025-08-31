import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Book/domain/entities/RequestPaymentMethodReponse.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/Value/ValueResponseEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/souhoola/SouhoolaResponseEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsResponsesEntities/visa_and_master_card/VisaAndMasterCardResponseEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/PayementMethodsReponses/souhoola_response/souhoola_response.dart';
import 'package:in_egypt/core/models/PayementMethodsReponses/value_response/value_response.dart';
import 'package:in_egypt/core/models/PayementMethodsReponses/visa_and_master_card_reponse/visa_and_master_card_reponse.dart';
import 'package:in_egypt/core/models/payment_method_model/payment_method_model.dart';
import 'package:in_egypt/core/services/DioService.dart';

class PaymentRepoImpl implements PaymentRepo {
  final DioService dioService;

  PaymentRepoImpl({required this.dioService});
  @override
  Future<Either<Failure, PaymentMethodEntity>> fetchPaymentMethods() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $fawaterkTestaccessToken',
      };
      final result = await dioService.getData(
          fullUrl: "https://staging.fawaterk.com/api/v2/getPaymentmethods",
          options: Options(headers: headers));
      PaymentMethodEntity mainPaymentMethodResponse =
          PaymentMethodModel.fromJson(result).toEntity();
      List<DatumEntity> data = [];
      for (DatumEntity element in mainPaymentMethodResponse.data!) {
        if (element.paymentId == 11 ||
            element.paymentId == 2 ||
            element.paymentId == 30) {
          data.add(element);
        }
      }
      PaymentMethodEntity editedPaymentMethod = PaymentMethodEntity(
          status: mainPaymentMethodResponse.status, data: data);
      return Right(editedPaymentMethod);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(message: e.message));
    } on ApiException catch (e) {
      log(e.message);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Map<String, dynamic> getPaymentBody({
    required int paymentMethodId,
    required BookingEntity booking,
  }) =>
      {
        "payment_method_id": paymentMethodId,
        "cartTotal": getTotalPrice(booking),
        "currency": "EGP",
        "customer": getConsumerBody(user: booking.user),
        "redirectionUrls": {
          "successUrl": "https://modern-payment-succe-fwsh.bolt.host/",
          "failUrl": "https://modern-arabic-paymen-64og.bolt.host/",
          "pendingUrl": "https://modern-arabic-paymen-ilje.bolt.host/"
        },
        "cartItems": [getPlaceCartItem(booking: booking)]
      };
  Map<String, dynamic> getConsumerBody({required UserEntity user}) => {
        "first_name": user.firstName,
        "last_name": user.lastName,
        "email": user.email,
        "phone": user.phoneNumber,
        "address": ""
      };
  Map<String, dynamic> getPlaceCartItem({required BookingEntity booking}) {
    return {
      "name": booking.place?.name,
      "price": booking.place?.ticketPrice.toString(),
      "quantity": booking.numberOfGuests.toString()
    };
  }

  String getTotalPrice(BookingEntity booking) {
    final guests = booking.numberOfGuests ?? 1;
    final price = booking.place?.ticketPrice ?? 0;
    return (guests * price).toString();
  }

  @override
  Future<Either<Failure, RequestPaymentMethodReponse>> requestPaymentMethod(
      {required BookingEntity bookingEntity, required int methodId}) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $fawaterkTestaccessToken',
      };
      final result = await dioService.postData(
          fullUrl: "https://staging.fawaterk.com/api/v2/invoiceInitPay",
          options: Options(
            headers: headers,
          ),
          data: getPaymentBody(
              paymentMethodId: methodId, booking: bookingEntity));
      if (methodId == 2) {
        VisaAndMasterCardResponseEntity response =
            VisaAndMasterCardReponse.fromJson(result).toEntity();
        return Right(RequestPaymentMethodReponse(
          status: response.status ?? "",
          invoiceId: response.data?.invoiceId ?? 0,
          invoiceKey: response.data?.invoiceKey ?? "",
          redirectUrl: response.data?.paymentData?.redirectTo ?? "",
        ));
      } else if (methodId == 30) {
        SouhoolaResponseEntity response =
            SouhoolaResponse.fromJson(result).toEntity();
        return Right(RequestPaymentMethodReponse(
          status: response.status ?? "",
          invoiceId: response.data?.invoiceId ?? 0,
          invoiceKey: response.data?.invoiceKey ?? "",
          redirectUrl: response.data?.paymentData?.redirectTo ?? "",
        ));
      } else if (methodId == 11) {
        ValueResponseEntity response =
            ValueResponse.fromJson(result).toEntity();
        return Right(RequestPaymentMethodReponse(
          status: response.status ?? "",
          invoiceId: response.data?.invoiceId ?? 0,
          invoiceKey: response.data?.invoiceKey ?? "",
          redirectUrl: response.data?.paymentData?.redirectTo ?? "",
        ));
      } else {
        return left(ServerFailure(message: "خطأ في البيانات"));
      }
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(message: e.message));
    } on ApiException catch (e) {
      log(e.message);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
