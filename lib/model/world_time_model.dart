class WorldTimeModel {
  final String abbreviation;
  final Duration offsetFromUtc;
  final bool add;

  WorldTimeModel({
    this.abbreviation = 'UTC',
    this.offsetFromUtc = const Duration(hours: 0),
    this.add = false,
  });

  WorldTimeModel.fromJSON(Map<String, dynamic> json)
      : abbreviation = json["abbreviation"],
        add = json["utc_offset"].substring(1) == "+",
        offsetFromUtc =
            Duration(hours: int.parse(json["utc_offset"].substring(1, 3)));
}
