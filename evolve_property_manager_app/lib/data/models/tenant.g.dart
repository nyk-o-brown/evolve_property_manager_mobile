// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tenant _$TenantFromJson(Map<String, dynamic> json) => Tenant(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  unitId: (json['unit_id'] as num?)?.toInt(),
  leaseStart: json['lease_start'] == null
      ? null
      : DateTime.parse(json['lease_start'] as String),
  leaseEnd: json['lease_end'] == null
      ? null
      : DateTime.parse(json['lease_end'] as String),
  status: json['status'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TenantToJson(Tenant instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'unit_id': instance.unitId,
  'lease_start': instance.leaseStart?.toIso8601String(),
  'lease_end': instance.leaseEnd?.toIso8601String(),
  'status': instance.status,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
