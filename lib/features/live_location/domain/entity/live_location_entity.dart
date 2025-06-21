class LiveLocationEntity {
  final double lat;
  final double lng;
  final String orderId;
  final String userId;
  final DateTime lastUpdatedAt;

  LiveLocationEntity({
    required this.lat,
    required this.lng,
    required this.orderId,
    required this.userId,
    required this.lastUpdatedAt,
  });
}
