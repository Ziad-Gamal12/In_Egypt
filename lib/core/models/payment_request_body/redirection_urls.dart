class RedirectionUrls {
  String? successUrl;
  String? failUrl;
  String? pendingUrl;

  RedirectionUrls({this.successUrl, this.failUrl, this.pendingUrl});

  factory RedirectionUrls.fromJson(Map<String, dynamic> json) {
    return RedirectionUrls(
      successUrl: json['successUrl'] as String?,
      failUrl: json['failUrl'] as String?,
      pendingUrl: json['pendingUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'successUrl': successUrl,
        'failUrl': failUrl,
        'pendingUrl': pendingUrl,
      };
}
