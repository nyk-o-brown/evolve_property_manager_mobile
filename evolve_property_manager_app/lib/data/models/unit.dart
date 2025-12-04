import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  final int id;
  @JsonKey(name: 'property_id')
  final int propertyId;
  @JsonKey(name: 'unit_number')
  final String unitNumber;
  @JsonKey(name: 'rent_price')
  final double rentPrice;
  @JsonKey(name: 'tenant_id')
  final int? tenantId;
  final String status; // vacant, occupied
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Unit({
    required this.id,
    required this.propertyId,
    required this.unitNumber,
    required this.rentPrice,
    this.tenantId,
    required this.status,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);

  Unit copyWith({
    int? id,
    int? propertyId,
    String? unitNumber,
    double? rentPrice,
    int? tenantId,
    String? status,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Unit(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      unitNumber: unitNumber ?? this.unitNumber,
      rentPrice: rentPrice ?? this.rentPrice,
      tenantId: tenantId ?? this.tenantId,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
