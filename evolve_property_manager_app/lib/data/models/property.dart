import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  final int id;
  final String name;
  final String address;
  final String city;
  final String state;
  @JsonKey(name: 'zip_code')
  final String zipCode;
  @JsonKey(name: 'total_units')
  final int totalUnits;
  @JsonKey(name: 'monthly_income')
  final double monthlyIncome;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.totalUnits,
    required this.monthlyIncome,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);

  Property copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    int? totalUnits,
    double? monthlyIncome,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      totalUnits: totalUnits ?? this.totalUnits,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
