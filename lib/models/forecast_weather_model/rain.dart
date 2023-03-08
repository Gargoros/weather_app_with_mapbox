class Rain {
  double? threeHours;

  Rain({this.threeHours});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        threeHours: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': threeHours,
      };
}
