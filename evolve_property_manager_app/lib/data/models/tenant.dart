import 'package:json_annotation/json_annotation.dart';

part 'tenant.g.dart';

@JsonSerializable()
class Tenant {
  final int id;
  final String name;
  final String email;
  final String? phone;
  @JsonKey(name: 'unit_id')
  final int? unitId;
  @JsonKey(name: 'lease_start')
  final DateTime? leaseStart;
  @JsonKey(name: 'lease_end')
  final DateTime? leaseEnd;
  final String status; // active, inactive
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Tenant({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.unitId,
    this.leaseStart,
    this.leaseEnd,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) =>
      _$TenantFromJson(json);

  Map<String, dynamic> toJson() => _$TenantToJson(this);

  Tenant copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? unitId,
    DateTime? leaseStart,
    DateTime? leaseEnd,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Tenant(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      unitId: unitId ?? this.unitId,
      leaseStart: leaseStart ?? this.leaseStart,
      leaseEnd: leaseEnd ?? this.leaseEnd,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
