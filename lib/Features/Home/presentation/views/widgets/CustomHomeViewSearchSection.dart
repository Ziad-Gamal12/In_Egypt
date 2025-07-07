import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/widgets/CustomTeaxtField.dart';

class CustomHomeViewSearchSection extends StatelessWidget {
  const CustomHomeViewSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Customteaxtfield(
          labelText: "أبحث عن ...",
          obscureText: false,
          textInputType: TextInputType.text,
          validator: (val) {
            return null;
          },
          suffixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.grey,
          ),
        )
      ]),
    );
  }
}
