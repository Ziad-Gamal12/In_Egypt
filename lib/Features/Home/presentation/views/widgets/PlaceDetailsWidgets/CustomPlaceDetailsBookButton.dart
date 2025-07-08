import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Book/presentation/views/BookView.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomButton.dart';

class CustomPlaceDetailsBookButton extends StatelessWidget {
  const CustomPlaceDetailsBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 50,
          spreadRadius: 1,
          offset: const Offset(5, -15),
        )
      ]),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Custombutton(
                  text: "حجز",
                  color: kMainColor,
                  textColor: Colors.white,
                  onPressed: () {
                    GoRouter.of(context).push(BookPlaceView.routeName);
                  })),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "\$245 ",
                style: AppTextStyles(context)
                    .semiBold20
                    .copyWith(color: Colors.red),
              ),
              TextSpan(
                text: "/ شخص",
                style: AppTextStyles(context)
                    .regular14
                    .copyWith(color: Colors.grey),
              ),
            ])),
          )
        ],
      ),
    );
  }
}
