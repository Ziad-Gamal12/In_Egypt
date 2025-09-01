// redirection_urls_entity.dart
// ignore_for_file: file_names

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
