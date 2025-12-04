import '../../../data/models/tenant.dart';
import '../../../data/services/api_service.dart';

class TenantRepository {
  final ApiService _apiService;

  TenantRepository(this._apiService);

  Future<List<Tenant>> getTenants() async {
    final response = await _apiService.get('/tenants');
    final tenantsList = response['tenants'] ?? response['data'] ?? [];
    return (tenantsList as List)
        .map((t) => Tenant.fromJson(t as Map<String, dynamic>))
        .toList();
  }

  Future<List<Tenant>> getTenantsByProperty(int propertyId) async {
    final response = await _apiService.get('/properties/$propertyId/tenants');
    final tenantsList = response['tenants'] ?? response['data'] ?? [];
    return (tenantsList as List)
        .map((t) => Tenant.fromJson(t as Map<String, dynamic>))
        .toList();
  }

  Future<Tenant> getTenantById(int id) async {
    final response = await _apiService.get('/tenants/$id');
    final tenantData = response['tenant'] ?? response['data'];
    return Tenant.fromJson(tenantData as Map<String, dynamic>);
  }

  Future<Tenant> createTenant(Map<String, dynamic> data) async {
    final response = await _apiService.post('/tenants/create', data);
    final tenantData = response['tenant'] ?? response['data'];
    return Tenant.fromJson(tenantData as Map<String, dynamic>);
  }

  Future<Tenant> updateTenant(int id, Map<String, dynamic> data) async {
    final response = await _apiService.put('/tenants/$id', data);
    final tenantData = response['tenant'] ?? response['data'];
    return Tenant.fromJson(tenantData as Map<String, dynamic>);
  }

  Future<void> deleteTenant(int id) async {
    await _apiService.delete('/tenants/$id');
  }
}
