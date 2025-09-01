import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/widgets/CustomProfileActionButton.dart';
import 'package:in_egypt/core/Cubits/theme_cubit/theme_cubit.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isDark = Theme.of(context).brightness == Brightness.dark;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomProfileActionButton(
      title: "الوضع الليلي",
      trailing: Switch(
          activeTrackColor:
              isDarkMode == false ? Colors.grey[800] : Colors.grey[450],
          activeThumbColor: Colors.amber,
          inactiveTrackColor:
              isDarkMode ? Colors.grey[800] : Colors.grey.shade100,
          inactiveThumbColor: isDarkMode ? Colors.grey : Colors.black,
          value: isDark,
          onChanged: (val) async {
            context.read<ThemeCubit>().toggleTheme(val);
            setState(() {
              isDark = val;
            });
          }),
    );
  }
}
