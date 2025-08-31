import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookedSuccessViewWidgets/CustomQrCode.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookedSuccessViewWidgets/SuccessLottieWidget.dart';
import 'package:in_egypt/Features/Home/presentation/views/HomeView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class BookedSuccessViewBody extends StatelessWidget {
  const BookedSuccessViewBody({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: 40),
      child: Column(
        children: [
          SizedBox(height: 40),
          SuccessLottieWidget(),
          Spacer(
            flex: 2,
          ),
          CustomQrCode(qrCodeUrl: bookingEntity.qrCodeUrl),
          SizedBox(height: 10),
          Text(
            "رقم الحجز: #${bookingEntity.id}",
            style:
                AppTextStyles(context).regular14.copyWith(color: Colors.black),
          ),
          Spacer(
            flex: 3,
          ),
          Custombutton(
              text: "الصفحة الرئيسية",
              color: Color(0xff00c985),
              textColor: Colors.white,
              onPressed: () {
                GoRouter.of(context).go(HomeView.routeName);
              })
        ],
      ),
    );
  }
}
