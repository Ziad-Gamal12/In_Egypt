import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/booking_bloc/booking_bloc_bloc.dart';
import 'package:in_egypt/core/Entities/CustomWebViewNavigationRequirmentsEntity.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewBody extends StatefulWidget {
  const CustomWebViewBody({
    super.key,
    required this.customWebViewNavigationRequirmentsEntity,
  });
  final CustomWebViewNavigationRequirmentsEntity
      customWebViewNavigationRequirmentsEntity;

  @override
  State<CustomWebViewBody> createState() => _CustomWebViewBodyState();
}

class _CustomWebViewBodyState extends State<CustomWebViewBody> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            final uri = Uri.parse(url);

            if (uri.host == "modern-payment-succe-fwsh.bolt.host") {
              context.read<BookingBloc>().add(PaymentSuccessEvent(
                    bookingEntity: widget
                        .customWebViewNavigationRequirmentsEntity.bookingEntity,
                  ));
            } else if (uri.host == "modern-arabic-paymen-64og.bolt.host") {
              context.read<BookingBloc>().add(PaymentFailedEvent());
            } else if (uri.host == "modern-arabic-paymen-ilje.bolt.host") {
              context.read<BookingBloc>().add(PaymentLoadingEvent());
            } else {
              log("❌ No match for host: ${uri.host}");
            }
          },
          onWebResourceError: (WebResourceError error) {
            log("❌ Web error: ${error.description}");
          },
        ),
      )
      ..loadRequest(
          Uri.parse(widget.customWebViewNavigationRequirmentsEntity.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "الدفع"),
      body: WebViewWidget(controller: controller),
    );
  }
}
