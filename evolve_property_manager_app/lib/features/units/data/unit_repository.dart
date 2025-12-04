import '../../../data/models/unit.dart';
import '../../../data/services/api_service.dart';

class UnitRepository {
  final ApiService _apiService;

  UnitRepository(this._apiService);

  Future<List<Unit>> getUnitsByProperty(int propertyId) async {
    final response =
        await _apiService.get('/properties/$propertyId/units');
    final unitsList = response['units'] ?? response['data'] ?? [];
    return (unitsList as List)
        .map((u) => Unit.fromJson(u as Map<String, dynamic>))
        .toList();
  }

  Future<Unit> getUnitById(int unitId) async {
    final response = await _apiService.get('/units/$unitId');
    final unitData = response['unit'] ?? response['data'];
    return Unit.fromJson(unitData as Map<String, dynamic>);
  }

  Future<Unit> createUnit(Map<String, dynamic> data) async {
    final response = await _apiService.post('/units/create', data);
    final unitData = response['unit'] ?? response['data'];
    return Unit.fromJson(unitData as Map<String, dynamic>);
  }

  Future<Unit> updateUnit(int id, Map<String, dynamic> data) async {
    final response = await _apiService.put('/units/$id', data);
    final unitData = response['unit'] ?? response['data'];
    return Unit.fromJson(unitData as Map<String, dynamic>);
  }

  Future<void> deleteUnit(int id) async {
    await _apiService.delete('/units/$id');
  }

  Future<Unit> assignTenant(int unitId, int tenantId) async {
    final response = await _apiService.post('/units/$unitId/assign-tenant', {
      'tenant_id': tenantId,
    });
    final unitData = response['unit'] ?? response['data'];
    return Unit.fromJson(unitData as Map<String, dynamic>);
  }
}
