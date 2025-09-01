import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileActionButton.dart';

class CustomProfileDarkModeActionButton extends StatefulWidget {
  const CustomProfileDarkModeActionButton({
    super.key,
  });

  @override
  State<CustomProfileDarkModeActionButton> createState() =>
      _CustomProfileDarkModeActionButtonState();
}

class _CustomProfileDarkModeActionButtonState
    extends State<CustomProfileDarkModeActionButton> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return CustomProfileActionButton(
      title: "الوضع الليلي",
      trailing: Switch(
          activeTrackColor: Colors.black,
          activeThumbColor: Colors.amber,
          inactiveTrackColor: Colors.grey.shade100,
          inactiveThumbColor: Colors.black,
          value: isDark,
          onChanged: (val) {
            setState(() {
              isDark = val;
            });
          }),
    );
  }
}
