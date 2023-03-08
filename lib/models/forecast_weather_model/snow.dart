class Snow {
  double? threeHours;

  Snow({this.threeHours});

  factory Snow.fromJson(Map<String, dynamic> json) => Snow(
        threeHours: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': threeHours,
      };
}
