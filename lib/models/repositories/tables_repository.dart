import 'package:restaurante_cliente/models/backend/tables/table.dart';
import './api_repository.dart';

class TablesRepository extends ApiRepository {
  /// Obtiene todas las mesas.
  Future<List<TableModel>> fetchTables() async {
    final tablesResponse = await apiClient.table.index();
    return tablesResponse.data.tables;
  }
}
