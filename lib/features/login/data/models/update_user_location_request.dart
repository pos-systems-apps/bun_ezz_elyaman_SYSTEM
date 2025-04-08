class UpdateUserLocationRequest {
  double latitude;
  double longitude;

  UpdateUserLocationRequest({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
