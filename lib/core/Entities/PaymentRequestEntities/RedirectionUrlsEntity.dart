// redirection_urls_entity.dart
class RedirectionUrlsEntity {
  final String? successUrl;
  final String? failUrl;
  final String? pendingUrl;

  const RedirectionUrlsEntity({
    this.successUrl,
    this.failUrl,
    this.pendingUrl,
  });
}
