// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:io';
import 'dart:ui' as ui;

import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/BookingModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/services/StorageService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BookingsRepoImp implements BookingsRepo {
  final Databaseservice databaseservice;
  final StorageService storageService;
  BookingsRepoImp(
      {required this.databaseservice, required this.storageService});
  @override
  Future<Either<Failure, void>> addBooking(
      {required BookingEntity bookingEntity}) async {
    try {
      Map<String, dynamic> json =
          BookingModel.fromEntity(bookingEntity).toJson();
      await databaseservice.setData(
          requirements: FireStoreRequirmentsEntity(
              collection: Backendkeys.bookingsCollection,
              docId: bookingEntity.id),
          data: json);
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, String>> generateAndUploadQrCode(
      {required String id}) async {
    try {
      final result = await generateQrCodeFile(id);
      return result.fold((failure) {
        return Left(failure);
      }, (file) async {
        final downloadUrl = await storageService.uploadFile(file: file);
        return Right(downloadUrl);
      });
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Future<Either<Failure, File>> generateQrCodeFile(String bookingId) async {
    try {
      final qrValidationResult = QrValidator.validate(
        data: bookingId,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.H,
      );

      if (qrValidationResult.status == QrValidationStatus.valid) {
        final qrCode = qrValidationResult.qrCode;

        final painter = QrPainter.withQr(
          qr: qrCode!,
          // ignore: deprecated_member_use
          color: const ui.Color(0xFF000000),
          // ignore: deprecated_member_use
          emptyColor: const ui.Color(0xFFFFFFFF),
          gapless: true,
        );

        final picData = await painter.toImageData(400);

        final buffer = picData!.buffer.asUint8List();

        final directory = await getTemporaryDirectory();
        final file = File('${directory.path}/$bookingId.png');
        await file.writeAsBytes(buffer);

        return right(file);
      } else {
        return left(ServerFailure(message: "حدث خطأ ما"));
      }
    } catch (e) {
      return left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
