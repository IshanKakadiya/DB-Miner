// ignore_for_file: non_constant_identifier_names

class AnimalAndImages {
  final String name;
  final String order;
  final String family;
  final String locations;
  final String name_of_young;
  final String group_behavior;
  final String estimated_population_size;
  final String biggest_threat;
  final String most_distinctive_feature;
  final String habitat;
  final String common_name;
  final String skin_type;
  final String color;
  final String top_speed;
  final String weight;
  final String height;
  final String age_of_sexual_maturity;
  String image;

  AnimalAndImages({
    required this.name,
    required this.common_name,
    required this.order,
    required this.family,
    required this.height,
    required this.weight,
    required this.top_speed,
    required this.color,
    required this.skin_type,
    required this.estimated_population_size,
    required this.locations,
    required this.name_of_young,
    required this.group_behavior,
    required this.biggest_threat,
    required this.habitat,
    required this.most_distinctive_feature,
    required this.age_of_sexual_maturity,
    required this.image,
  });

  factory AnimalAndImages.formMap({required Map<String, dynamic> data}) {
    return AnimalAndImages(
      name: data["name"],
      common_name: data["characteristics"]["common_name"] ?? "",
      order: data["taxonomy"]["order"] ?? "",
      family: data["taxonomy"]["family"] ?? "",
      height: data["characteristics"]["height"] ?? "",
      weight: data["characteristics"]["weight"] ?? "",
      top_speed: data["characteristics"]["top_speed"] ?? "",
      color: data["characteristics"]["color"] ?? "",
      skin_type: data["characteristics"]["skin_type"] ?? "",
      estimated_population_size:
          data["characteristics"]["estimated_population_size"] ?? "",
      locations: "Africa",
      name_of_young: data["characteristics"]["name_of_young"] ?? "",
      group_behavior: data["characteristics"]["group_behavior"] ?? "",
      biggest_threat: data["characteristics"]["biggest_threat"] ?? "",
      habitat: data["characteristics"]["habitat"] ?? "",
      most_distinctive_feature:
          data["characteristics"]["most_distinctive_feature"] ?? "",
      age_of_sexual_maturity:
          data["characteristics"]["age_of_sexual_maturity"] ?? "",
      image: "",
    );
  }
}
