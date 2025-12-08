import '../../../data/models/property.dart';
import '../../../data/services/api_service.dart';

class PropertyRepository {
  final ApiService _apiService;

  PropertyRepository(this._apiService);

  Future<List<Property>> getProperties() async {
    final response = await _apiService.get('./get_properties.php');
    final propertiesList = response['properties'] ?? response['data'] ?? [];
    return (propertiesList as List)
        .map((p) => Property.fromJson(p as Map<String, dynamic>))
        .toList();
  }

  Future<Property> getPropertyById(int id) async {
    final response = await _apiService.get('/properties/$id');
    final propertyData = response['property'] ?? response['data'];
    return Property.fromJson(propertyData as Map<String, dynamic>);
  }

  Future<Property> createProperty(Map<String, dynamic> data) async {
    final response = await _apiService.post('/properties/create', data);
    final propertyData = response['property'] ?? response['data'];
    return Property.fromJson(propertyData as Map<String, dynamic>);
  }

  Future<Property> updateProperty(int id, Map<String, dynamic> data) async {
    final response = await _apiService.put('/properties/$id', data);
    final propertyData = response['property'] ?? response['data'];
    return Property.fromJson(propertyData as Map<String, dynamic>);
  }

  Future<void> deleteProperty(int id) async {
    await _apiService.delete('/properties/$id');
  }

  Future<Property> uploadPropertyImage(int id, String imagePath) async {
    final response = await _apiService.uploadFile(
      '/properties/$id/upload-image',
      imagePath,
      fieldName: 'image',
    );
    final propertyData = response['property'] ?? response['data'];
    return Property.fromJson(propertyData as Map<String, dynamic>);
  }
}
