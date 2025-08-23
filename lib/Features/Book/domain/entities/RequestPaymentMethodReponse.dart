class RequestPaymentMethodReponse {
  final String status, invoiceKey, redirectUrl;
  final int invoiceId;

  RequestPaymentMethodReponse(
      {required this.status,
      required this.invoiceId,
      required this.invoiceKey,
      required this.redirectUrl});
}
